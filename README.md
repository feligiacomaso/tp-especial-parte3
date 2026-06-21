<h1> Catálogo Musical </h1>

<h2>Integrantes </h2> 

Felicitas Giacomaso (feligiacomaso@gmail.com)
Benjamin Herrera Randazzo (herrerabenjamin091@gmail.com)

<h2>Tematica</h2>

Catálogo de música, álbumes de cada artista.

<h2>Descripción</h2>

Este sitio web permite mostrar distintos artistas con su información personal como fecha de nacimiento o nombre completo y una lista de sus álbumes con su fecha de lanzamiento y cantidad de canciones. El sistema incluye autenticación de usuarios para el inicio y cierre de sesión de administradores, permitiendo realizar operaciones de alta, baja y modificación de los datos tanto de los artistas como de los álbumes.

---

<h2>Instrucciones de instalación y despliegue</h2>

1. Copiar la carpeta del proyecto en el directorio htdocs del servidor local Apache.
2. Iniciar los servicios de Apache y MySQL.
3. Acceder a phpMyAdmin y crear una base de datos vacía con el nombre catalogo_musical.
4. Importar el archivo catalogo_musical.sql ubicado en la raíz del proyecto para cargar la estructura y los datos de prueba.

La conexión con la base de datos se realiza por defecto hacia el host localhost, con el usuario root y sin contraseña.

---

 <h2>Acceso al sistema</h2>

Para navegar la interfaz pública se debe ingresar en el navegador la dirección local del proyecto.

Para realizar operaciones de administración como alta, baja y modificación de datos, se debe ingresar al formulario de inicio de sesión mediante la ruta login_form.

Las credenciales del usuario administrador para pruebas son las siguientes:

* Usuario: webadmin
* Contraseña: admin


---

<h2>Diagrama de entidad relación</h2>

El diagrama de entidad relación que detalla las tablas de artista, álbum y usuario se encuentra adjunto en la raíz del proyecto en formato de imagen.



<img width="944" height="583" alt="Captura de pantalla 2026-05-23 215259" src="https://github.com/user-attachments/assets/a62b8a7b-aa59-4220-a228-ae0727b2476c" />
