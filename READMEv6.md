# READMEv6.md

Debido al gran apollo reciente de la herramienta y guia, he decidido crear una seccion especifica para el infame ipv6 ya que tiene algunas diferencias.

# Monster in The Middle
Primero, a diferencia de la version de Man in The Mirrror para ipv4 el mitm se realizara con mitm6 una tambien muy efectiva herramienta a la hora de realizar ataques del tipo mitm, si bien todavia me encuentro profundizando en su funcionamiento, limitaciones y utilidades.
De momento a mostrado ser muy poderosa, aprovechandose del hecho de que aunque ipv6 sigue sin ser muy usado Windows ya lo configuro como el protocolo preferido cuando se trata de de escoger entre ipv4 o ipv6... (O algo asi, todavia continuo profundizando).

!Nota> Como tal no es necesario utilizar mitm6, se puede usar cualquier herramienta que sirva para realizar mitm con ipv6, un ejemplo de una alternativa podria ser el ndp.probe de bettercap que entiendo se parece hasta cierto punto, aunque de momento no lo he probado.

En un futuro agregare la funcionalidad al script, pero de momento es necesario configurar las reglas de iptables de manera manual, basicamente si lo que quieres es ipv4 e ipv6 deberias optar por nftables, pero debido a que son mas complejas lo mas sencillo seria
directamente configurar las reglas para ipv4 con iptables y las reglas para ipv6 con ip6tables, ambas tienen practimente la misma sintaxis. Por lo que para configurar nuestras reglas y abusar de ipv6 simplemente sera cambiar el comando y cambiar la ip a donde redirigiremos
el trafico (Notese que para tener una ipv6 que configurar deberemos haber lanzado primero mitm6).

sea mi ipv6 2001:db8::1 donde se supone que en mi puerto 80 se aloja mi sitio de phishing, el comando seria el siguiente:
sudo ip6tables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination [2001:db8::1]:80

Under Construction... Let me cook.
