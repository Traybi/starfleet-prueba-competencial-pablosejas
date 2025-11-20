1) Acceder a 192.168.1.30:8006 desde la URL de nuestro navegador. 
2) Logearse en proxmox

- usuario: alumno
- contraseña: Alumno1234

1) Accedemos a nuestra máquina virtual

2. Máquina virtual PROXMOX

- Entramos a la maquina virtual desde la terminal  a través de SSH con las credenciales: 

  usuario: sejas
  contraseña: largavidayprosperidad

- Asignamos una IP estática, en mi caso, la 192.168.1.61

Tras LogIn en el servidor, si hacemos 'ls' en el home, tenemos un archivo. Hacemos un 'cat' o un 'nano' y se nos indicará que la primera misión es la 47-A. 

# Misión 1:
 
 🖖 1. Registro de Entrada — Personalización del Sistema
 
Haciendo un "sudo nano /etc/motd" abro el archivo del mensaje de bienvenida y hago los cambios: 
 
 - Nombre del cadete : PabloSejasElGuaperas
 - ID del grupo YT1: (Coincidiendo con Mario y Diego Huamanchumo Grupo1)
 - FECHA ESTELAR: CurDate
 - Entrando en un submódulo de ingeniería de la USS Enterprise NCC-1701-D...

# Misión 2: 

🛠️ 2. Instalación del Núcleo de Servicios — Pila LAMP

Para poder estar en contacto con la flota, debemos instalar: 

- Apache, MySQL, PHP.

Primero **actulizamo**s nuestro **sistema**:

'sudo apt update && apt upgrade'

Instalo **Apache** mediante: 

'sudo apt install apache2 -y'

Compruebo si el servicio está activo mediante:

'sudo  systemctl status apache2'

Instalo **MySQL** mediante: 

'sudo apt install mysql-server -y'

**Compruebo** si el **servicio** está **activo** mediante:

'sudo systemctl status mysql'

**Instalo PHP mediante**:

'sudo apt install php -y'

Instalamos los módulos más comunes de PHP:

'sudo apt install php-mysql php-cli php-curl php-json php-cgi php-xml php-mbstring -y'

También vamos instalar otro paquete de apache:
 
 'sudo apt install libapache2-mod-php -y' 

Después reiniciamos Apache mediante:

'sudo systemctl restart apache2'

# Misión3:

🛡️ 3. Activación del Escudo Deflector — Firewall UFW

Solo deben permitirse:

- Canal de comunicaciones principal (SSH)

  Levantamos el firewall para el puerto 22 mediante: 
  
  'sudo ufw allow 22'

- Canal web (HTTP / HTTPS) para los puertos 80 y 442 mediante: 

  'sudo ufw allow 80' y 'sudo ufw allow 443'

Mostrar en la web un panel con el “estado del escudo”, es decir, mostrar el estado de puertos abiertos mediante: 'sudo ufw status verbose'

# Misión 4 

📡 4. Registro de Telemetría — JSON + HTML

Creo el archivo JSON vacío con el nombre "diagnósticoLCARS.json" mediante un .sh, en este caso generar_diagnostico.sh: 

Para darle permisos a este .sh y que nos cree directamente "diagnosticoLCARS.json" hacemos:

'sudo chmod +x generar_diagnostico.sh' y luego lo ejecutamos con 'sudo ./generar_diagnostico.sh'

Para comprobar que se ha creado todo bien, hacemos:

'sudo nano /var/www/html/diagnosticoLCARS.json'

Ahora hay que crear una interfaz HTML de estilo LCARS que:

- Lea el JSON mediante JavaScript
- Muestre los datos como paneles de la consola de mando
- Sea accesible desde la web principal del host
- Este será el “Panel de Diagnóstico de Ingeniería”.

Creamos el archivo index.html en la ruta correcta mediante:

'sudo nano /var/www/html/index.html'.

Luego tendríamos que poner en nuestro navegador la ip y visualizaremos lo creado.
