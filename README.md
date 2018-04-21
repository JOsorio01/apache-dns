# apache-dns

Prueba para un proyecto.
Es un sitio web con dominio "www.chilate.com" que está corriendo en una infraestructura de contenedores en Docker Compose.
Consta de un DNS Server que se conecta a un Reverse Proxy que redirige las peticiones a otros contenedores uno que reciba peticiones HTTP en la página de inicio "/" y otro que atiende HTTPS en la página "/compras" del sitio.
