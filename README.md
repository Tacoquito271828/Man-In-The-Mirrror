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
