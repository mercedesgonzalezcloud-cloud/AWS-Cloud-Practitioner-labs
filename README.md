# aws-ec2-ssh-connection
# Lanzamiento y Conexión SSH a Instancia EC2 en AWS

Despliegue de un servidor virtual (EC2) Linux en la nube de AWS y conexión remota segura mediante terminal y clave privada SSH.

-------------------------------------------------------------------------------------------------------------------

## 🛠️ Servicios y Conceptos Utilizados

* **Amazon EC2:** Servidor virtual en la nube.
* **Key Pair (Par de Claves):** Par de claves criptográficas (`.pem`) para autenticación SSH segura.
* **Security Group:** Para este entorno de prueba se habilitó el puerto de entrada 22 (SSH) desde `0.0.0.0/0` para facilitar la conexión rápida. En un entorno de producción real, hubiera restringido la regla a mi IP o IP indicadas únicamente.
* **Terminal / CLI:** Conexión remota mediante línea de comandos.

-------------------------------------------------------------------------------------------------------------------

## 🚀 Implementación

1. **Creación de la Instancia EC2:**
   * Selección de AMI Linux (Amazon Linux / Ubuntu).
   * Generación y descarga del par de claves privadas (`.pem`).
   * Configuración del Grupo de Seguridad (*Security Group*) permitiendo tráfico en el puerto `22`.

2. **Conexión mediante SSH desde la terminal:**
   * Ajuste de permisos de la clave privada para mayor seguridad:
     ```bash
     chmod 400 tu-clave.pem
     ```
     *(Nota: En esta prueba práctica en un entorno local de Windows no se ejecutó este paso, ya que el cliente SSH de la terminal permite la conexión directa al detectar el archivo protegido dentro del perfil de usuario).*
     
   * Ejecución del comando de conexión SSH con la dirección pública de la instancia:
     ```bash
     ssh -i "/directorio/donde/se/guardo/laclave.pem" ec2-user@<IP-publica-o-DNS-de-la-instanciaEC2>
     ```

-------------------------------------------------------------------------------------------------------------------

## 📸 Evidencia de Conexión

<img width="1225" height="371" alt="imagen conexión SSH censured" src="https://github.com/user-attachments/assets/1d8d7d44-1cc1-41b2-82be-dc82c3151a26" />


-------------------------------------------------------------------------------------------------------------------

## 🔒 Buenas Prácticas de Seguridad

* **Protección de Claves:** La clave `.pem` no se sube a GitHub para evitar la exposición de credenciales privadas.
* **Control de Acceso:** AWS recomienda limitar la regla del Security Group únicamente a tu dirección IP pública en lugar de `0.0.0.0/0` pero para este test se ha simplificado ya que la instance creada en AWS solo se ha usado para mostrar la conexión SSH y se ha eliminado posteriormente.
