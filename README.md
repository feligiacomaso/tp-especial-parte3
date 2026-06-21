TP Especial - Etapa 3
API REST de Comentarios de Álbumes
Integrantes
Felicitas Giacomaso (feligiacomaso@gmail.com) Benjamin Herrera Randazzo (herrerabenjamin091@gmail.com)

Descripción
Este proyecto corresponde a la Etapa 3 del Trabajo Práctico Especial de Web 2. Se desarrolló una API RESTful para la gestión de comentarios asociados a álbumes musicales pertenecientes al catálogo musical implementado en etapas anteriores.

La API permite consultar, crear y modificar comentarios realizados sobre los álbumes almacenados en la base de datos.

Endpoints
Obtener todos los comentarios
GET /comentarios
Obtener un comentario por ID
GET /comentarios/:id
Filtrar comentarios por álbum
GET /comentarios?id_album={id}
Ordenar comentarios
GET /comentarios?sort=fecha&order=asc
GET /comentarios?sort=fecha&order=desc
Paginar resultados
GET /comentarios?page=1&limit=2
Iniciar sesión
POST /auth/login
Body:

{
    "email": "webadmin",
    "password": "admin"
}
Crear comentario (requiere token JWT)
POST /comentarios
Modificar comentario (requiere token JWT)
PUT /comentarios/:id
Observaciones
Para probar los endpoints protegidos es necesario obtener previamente un token JWT mediante el endpoint de login y enviarlo en el encabezado:

Authorization: Bearer <token>
