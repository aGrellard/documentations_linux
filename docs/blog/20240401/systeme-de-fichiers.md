# modification des droits d'accès au disques durs externes



# samba share

```bash
[data1t-prog]                                                                                 
        comment = Dossier programmation ddur usb 1 TO                                         
        path = /media/usb_1T/Data/Programmation_code                                          
        read only = no                                                                        
        browseable = yes                                                                      
        writable = yes                                                                        
        guest ok = no                                                                         
        valid users = @users                                                                  
[films]                                                                                       
        comment = films                                                                       
        path = /media/usb_3T/Partage/media/videos/films/films                                 
        read only = no                                                                        
        browseable = yes                                                                      
        writable = yes                                                                        
        guest ok = no                                                                         
        valid users = @samba_share                                                            
                                                                                              
[musiques]                                                                                    
        comment = films                                                                       
        path = /media/usb_3T/Partage/media/videos/films/films                                 
        read only = no                                                                        
        browseable = yes                                                                      
        writable = yes                                                                        
        guest ok = no                                                                         
        valid users = @users                                                                  
                                                                                              
```

