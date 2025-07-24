#!/bin/bash

#Variables de color
mas='\e[1;35m[+]\e[0m'
C_Blanco='\e[1;37m'
C_Morado='\e[1;35m'
C_Rojo='\e[1;31m'
res='\e[0m'

# Es importante recoger todo al salir
limpiar() {
    echo -e "\n$mas$C_Blanco Ctrl+C detectado. Limpiando reglas$C_Morado NAT$C_Blanco..."
    iptables -t nat -F
    echo -e "$mas$C_Blanco Reglas limpiadas. Saliendo."
    exit 0
}

# El nombre lo indica
mostrar_banner() {
    clear
    echo -e "$C_Morado⣿⣿⣿⣿⣿⣿⣿⡿⡛⠟⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ⣿⣿⣿⣿⣿⣿⠿⠨⡀⠄⠄⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿"
    sleep 0.15
    echo -e "⣿⣿⣿⣿⠿⢁⠼⠊⣱⡃⠄⠈⠹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ⣿⣿⡿⠛⡧⠁⡴⣦⣔⣶⣄⢠⠄⠄⠹⣿⣿⣿⣿⣿⣿⣿⣤⠭⠏⠙⢿⣿⣿⣿⣿⣿ "
    sleep 0.15
    echo -e "⣿⡧⠠⠠⢠⣾⣾⣟⠝⠉⠉⠻⡒⡂⠄⠙⠻⣿⣿⣿⣿⣿⡪⠘⠄⠉⡄⢹⣿⣿⣿⣿ ⣿⠃⠁⢐⣷⠉⠿⠐⠑⠠⠠⠄⣈⣿⣄⣱⣠⢻⣿⣿⣿⣿⣯⠷⠈⠉⢀⣾⣿⣿⣿⣿ "
    sleep 0.15
    echo -e "⣿⣴⠤⣬⣭⣴⠂⠇⡔⠚⠍⠄⠄⠁⠘⢿⣷⢈⣿⣿⣿⣿⡧⠂⣠⠄⠸⡜⡿⣿⣿⣿ ⣿⣇⠄⡙⣿⣷⣭⣷⠃⣠⠄⠄⡄⠄⠄⠄⢻⣿⣿⣿⣿⣿⣧⣁⣿⡄⠼⡿⣦⣬⣰⣿ "
    sleep 0.15
    echo -e "⣿⣷⣥⣴⣿⣿⣿⣿⠷⠲⠄⢠⠄⡆⠄⠄⠄⡨⢿⣿⣿⣿⣿⣿⣎⠐⠄⠈⣙⣩⣿⣿ ⣿⣿⣿⣿⣿⣿⢟⠕⠁⠈⢠⢃⢸⣿⣿⣶⡘⠑⠄⠸⣿⣿⣿⣿⣿⣦⡀⡉⢿⣧⣿⣿ "
    sleep 0.15
    echo -e "⣿⣿⣿⣿⡿⠋⠄⠄⢀⠄⠐⢩⣿⣿⣿⣿⣦⡀⠄⠄⠉⠿⣿⣿⣿⣿⣿⣷⣨⣿⣿⣿ ⣿⣿⣿⡟⠄⠄⠄⠄⠄⠋⢀⣼⣿⣿⣿⣿⣿⣿⣿⣶⣦⣀⢟⣻⣿⣿⣿⣿⣿⣿⣿⣿"
    sleep 0.15
    echo -e "⣿⣿⣿⡆⠆⠄⠠⡀⡀⠄⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ⣿⣿⡿⡅⠄⠄⢀⡰⠂⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿$res"
    sleep 0.15
    echo ""
    sleep 0.15
    echo -e "                   $C_Morado=====#=====$res  $C_Blanco Man in the mirror$res   $C_Morado=====#=====$res"
    sleep 1.5

}

# Reaccion al Ctrl+C
trap limpiar SIGINT

# Verificar si se ejecuta como root
if [[ $EUID -ne 0 ]]; then
    echo -e "$C_Rojo[!]$res$C_Blanco Este script debe ejecutarse como root. Usa sudo."
    exit 1
fi

echo "1" > /proc/sys/net/ipv4/ip_forward

# Mostrar banner
mostrar_banner

echo ""

# Obtener interfaces activas
interfaces=($(ip -o link show | awk -F': ' '/state UP/ && $2 != "lo" {print $2}'))

echo -e "$mas$C_Blanco Interfaces de red activas:$res"
for i in "${!interfaces[@]}"; do
    echo -e "  $C_Morado$((i+1)))$res $C_Blanco${interfaces[$i]}$res"
done

# Leer opción del usuario
while true; do
    echo ""
    echo -e "$C_Morado[?]$res$C_Blanco Elige una interfaz:"
    read -p $'Opcion: ' seleccion
    if [[ "$seleccion" =~ ^[0-9]+$ ]] && (( seleccion >= 1 && seleccion <= ${#interfaces[@]} )); then
        interfaz=${interfaces[$((seleccion-1))]}
        echo ""
        echo -e "$mas$C_Blanco Interfaz seleccionada:$res $C_Morado$interfaz$res"
        break
    else
        echo -e "$C_Rojo[!]$C_Blanco Selección inválida. Intenta de nuevo.$res"
    fi
done

# Obtener IP de la interfaz seleccionada
IP=$(ip addr show "$interfaz" | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)
if [[ -z $IP ]]; then
    echo "[!] No se pudo obtener la IP de la interfaz '$interfaz'."
    exit 1
fi
echo -e "$mas$C_Blanco Dirección IP detectada:$res$C_Morado $IP$res"

# Menú de puertos
echo -e "\n$mas$C_Blanco Selecciona un conjunto de puertos:"
echo -e "$C_Morado 1)$C_Blanco Solo HTTP (80)"
echo -e "$C_Morado 2)$C_Blanco Web (80,443)"
echo -e "$C_Morado 3)$C_Blanco Dominio (80,443,445,139,389,636)"
echo -e "$C_Morado 4)$C_Blanco Dopaje (80,443,445,139,3389,25,8080,8081)"
echo -e "$C_Morado 5)$C_Blanco Personalizado"

read -p "Opcion: " opcion

case $opcion in
    1) PUERTOS="80" ;;
    2) PUERTOS="80,443" ;;
    3) PUERTOS="80,443,445,139,389,636" ;;
    4) PUERTOS="80,443,445,139,3389,25,8080,8081" ;;
    5)
        read -p "Ingresa los puertos separados por coma (ej: 21,22,23): " PUERTOS
        ;;
    *)
        echo -e "$C_Rojo[!]$C_Blanco Opción inválida.$res"
        exit 1
        ;;
esac

# Aplicar reglas de iptables
IFS=',' read -ra PORT_LIST <<< "$PUERTOS"
for PORT in "${PORT_LIST[@]}"; do
    iptables -t nat -A PREROUTING -p tcp --dport $PORT -j DNAT --to-destination $IP:$PORT
done

iptables -t nat -A POSTROUTING -j MASQUERADE

# Mostrar tabla
echo -e "\n$mas$C_Blanco Reglas de iptables (tabla$C_Morado NAT$C_Blanco):$res\n"
iptables -L -t nat

echo -e "\n$mas$C_Blanco Redirección activa. Presiona$C_Morado Ctrl+C$C_Blanco para detener y limpiar reglas NAT...$res"
# Espera infinita
while true; do
    sleep 1
done
