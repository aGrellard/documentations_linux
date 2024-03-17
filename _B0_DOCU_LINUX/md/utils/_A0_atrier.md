

  13/03/2024   11:10.50   /home/mobaxterm  history

-    
    ```sh
    sudo nohup python3 "/home/alpi/Documents/python/check_process.py"  >/dev/null 2>&1 &
    ```

-    
    ```sh
    ps aux | grep /home/alpi/Documents/python/check_process.py | awk '{print $2}' | xargs kill -9
    ```

-    
    ```sh
    history
    ```

-    
    ```sh
    ps aux | grep chromium |  awk '{print $2}'  | xargs kill -9
    ```

-    
    ```sh
    export DISPLAY=:0 && nohup chromium >/dev/null 2>&1
    ```

-    
    ```sh
    export DISPLAY=:0 && nohup chromium 192.168.0.109:3000>/dev/null 2>&1 &
    ```

-    
    ```sh
    find /path -iname "*.avi"  -type f -size +100M -size -1000M -exec du -sh {} \; | awk -F/ 'tolower($NF) ~ /^/' | sort -nr
    ```

-    
    ```sh
    lsof -i tcp:3000 | grep node | awk '{print $2}'
    ```

-    
    ```sh
    lsof -i tcp:3000 | grep node | awk '{print $2}' | xargs kill -9
    ```

-    
    ```sh
    lsof -i tcp:3001 | grep node | awk '{print $2}'
    ```

-    
    ```sh
    lsof -i tcp:3001 | grep node | awk '{print $2}' | xargs kill -9
    ```

-    
    ```sh
    node /var/www/node/node_ads/index.js >/dev/null 2>&1 &
    ```

-    
    ```sh
    ps aux | grep /var/www/node/node_ads |  awk '{print $2}'
    ```

-    
    ```sh
    ps aux | grep /var/www/node/node_ads |  awk '{print $2}'  | xargs kill -9
    ```

-    
    ```sh
    sudo service node_google status
    ```

-    
    ```sh
    pwd
    ```

-    
    ```sh
    sudo apt update
    ```

-    
    ```sh
    export DISPLAY=:0 && nohup vlc --http-port 8081 --http-password azeqsd "/home/adri/Documents/playlist.m3u" >/dev/null 2>&1 &
    ```

-    
    ```sh
    export DISPLAY=:0 && xdotool search --sync --onlyvisible --class "vlc" windowactivate
    ```

-    
    ```sh
    ps aux | grep vlc |  awk '{print $2}'  | xargs kill -9
    ```

-    
    ```sh
    export DISPLAY=:0 && xdotool search --sync --onlyvisible --class "firefox-esr" windowactivate key
    ```

-    
    ```sh
    export DISPLAY=:0 && xdotool search --sync --onlyvisible --class "firefox-esr" windowactivate key ctrl+Tab
    ```

-    
    ```sh
    export DISPLAY=:0 && xdotool keydown alt key Tab key Left key Left; sleep 2; xdotool keyup alt; xdotool key enter
    ```

-    
    ```sh
    zenity --info --text="Bonjour !" --title="Hello World"
    ```

-    
    ```sh
    export DISPLAY=:0 && xdotool keydown alt key Tab key Left key Left; sleep 2; xdotool keyup alt; xdotool key enter
    ```

-    
    ```sh
    export DISPLAY=:0 && xdotool search --sync --onlyvisible --class "firefox-esr" windowactivate key
    ```
