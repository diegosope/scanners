#!/bin/bash

function ctrl_c(){
  echo -e "\n\n[!] Saliendo...\n"
  tput cnorm; exit 1 #recuperar cursor ; código error
}

tput civis #quitar cursor

# Ctrl+C
trap ctrl_c SIGINT

for i in $(seq 1 254); do  
  for port in 80 443 22 21 25 110 143 53 3389 137 139 23 445 135 3306 5432 123 161 1194 5900; do
    timeout 1 bash -c "echo '' > /dev/tcp/192.168.1.$i/$port" 2>/dev/null && echo "[+] Host 192.168.1.$i - Port $port (OPEN)" &
  done
done

wait

tput cnorm
