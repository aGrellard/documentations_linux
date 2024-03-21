import socket
import subprocess
from scapy.all import ARP, Ether, srp

def scan_ip(subnet):
    """
    Scanne les adresses IP dans le sous-réseau spécifié.
    :param subnet: Sous-réseau à scanner, par exemple '192.168.1.1/24'
    :return: Liste des adresses IP trouvées.
    """
    print("Scanning IP addresses on the network...")
    packet = Ether(dst="ff:ff:ff:ff:ff:ff") / ARP(pdst=subnet)
    result = srp(packet, timeout=2, verbose=0)[0]
    ip_addresses = [received.psrc for sent, received in result]
    return ip_addresses

def resolve_dns(ip_addresses):
    """
    Effectue une résolution DNS sur les adresses IP fournies.
    :param ip_addresses: Liste des adresses IP.
    :return: Dictionnaire des adresses IP et de leurs noms d'hôte associés.
    """
    ip_dns_mapping = {}
    for ip in ip_addresses:
        try:
            hostname = socket.gethostbyaddr(ip)[0]
        except socket.herror:
            hostname = 'Unknown'
        ip_dns_mapping[ip] = hostname
    return ip_dns_mapping

def resolve_dns_with_avahi(ip_addresses):
    """
    Utilise avahi-resolve-address pour effectuer une résolution DNS sur les adresses IP fournies.
    :param ip_addresses: Liste des adresses IP.
    :return: Dictionnaire des adresses IP et de leurs noms d'hôte associés.
    """
    ip_dns_mapping = {}
    for ip in ip_addresses:
        try:
            # Exécute avahi-resolve-address et capture la sortie
            result = subprocess.run(["avahi-resolve-address", ip], capture_output=True, text=True)
            output = result.stdout.strip()
            # La sortie est généralement de la forme "adresse_ip nom_d'hôte", nous divisons donc la chaîne pour obtenir ces éléments
            _, hostname = output.split()
        except Exception as e:
            print(f"Erreur lors de la résolution de {ip}: {e}")
            hostname = 'Unknown'
        ip_dns_mapping[ip] = hostname
    return ip_dns_mapping

def scan_open_ports(ip, ports):
    """
    Scanne les ports ouverts pour une adresse IP donnée.
    :param ip: Adresse IP à scanner.
    :param ports: Liste des ports à scanner.
    :return: Liste des ports ouverts.
    """
    open_ports = []
    for port in ports:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        result = sock.connect_ex((ip, port))
        if result == 0:
            open_ports.append(port)
        sock.close()
    return open_ports

# Exemple d'utilisation
subnet = "192.168.0.1/24"
ip_addresses = scan_ip(subnet)
print("IPs found:", ip_addresses)

common_ports = [22, 80, 443, 21]
dns_mapping = resolve_dns_with_avahi(ip_addresses)
for ip, hostname in dns_mapping.items():
    open_ports = scan_open_ports(ip, common_ports)
    print("%-16s %-25s | %s" % (ip, hostname, open_ports))

# Scannez seulement quelques ports communs pour l'exemple
#
# for ip in ip_addresses:
#     open_ports = scan_open_ports(ip, common_ports)
#     print(f"Open ports for {ip}: {open_ports}")
