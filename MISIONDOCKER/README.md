En el final de la anterior misión nos dice que la proxima esta en "mensaje_starfleet_A43". Para buscar en todos lados dónde está, hacemos un:

	"sudo find / -name mensaje_starfleet_A43"

 Cuando entremos a la ruta y hagamos un cat o un nano, el archivo nos dirá que el código de la misión es MD_4353.mis, por lo que tenemos que hacer otra find buscando dónde está:

	"sudo find / -name MD_4353.mis"

Cuando hagamos un cat nos dirá todo lo que tenemos que hacer, como en la misión anterior.

Lo primero es instalar docker, para ello usamos los siguientes comandos:

	 "sudo apt install apt-transport-https ca-certificates curl software-properties-common"
	 
	 "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg"
	 
	 "echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"
	 
	 "sudo apt install docker.io -y"

Nos dice un pequeño acertijo el enunciado, al decirnos que el sistema esta lleno de secretos. Si vamos a nuestro /home y después a secreto/ y seguimos la ruta haciendo ls todo el rato llegamos a un archivo .db y a un README, si hacemos un "cat" al README nos podrá los pasos que debemos seguir para montar la base de datos en el WordPress. Tenemos que seguir los siguientes pasos:

	docker build -f dokerfile.db -t mi-mariadb-wp:1.0 .

	Ejecutar el contenedor con esa imagen:

	docker network create wp-net

	docker run -d \
	  --name wp-db \
	  --network wp-net \
	  mi-mariadb-wp:1.0

Ahora en el siguiente paso tenemos que crear un contenedor personalizado que sirva como servidor web, lo primero que hacemos es crear un directorio para el proyecto, con el que organizaremos todo:

	"mkdir -p ~/starfleet/html"

Dentro crearemos el archivo index.html

	Esta subido al repositorio.

Ahora para crear el DockerFile hacemos:

	FROM nginx:alpine
    # Copiar tu HTML a la carpeta pública del servidor
    COPY index.html /usr/share/nginx/html/index.html
    # Exponer el puerto estándar de NGINX
    EXPOSE 80
    # Iniciar servicio
    CMD ["nginx", "-g", "daemon off;"]

Para construir la imagen ejecutamos esto:

	"sudo docker build -t starfleet-nginx ."

Para ejecutar el contenedor

	"sudo docker run -d -p 8081:80 starfleet-nginx"

Para acceder tenemos que poner nuestra IP y el puerto :8081

Para poder subirlo a  DockerHub, en nuestra terminal hacemos:

	"sudo docker login"

Ahora le ponemos un nombre a la imagen que vamos a subir:

	"sudo docker tag starfleet-nginx traybi10/starfleet-nginx"

Por último tenemos que hacer un push de la imagen

	"sudo docker push traybi10/starfleet-nginx"
