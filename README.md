# TP Especial - Etapa 3

## API REST de Comentarios de Álbumes

##Integrantes
Felicitas Giacomaso (feligiacomaso@gmail.com) Benjamin Herrera Randazzo (herrerabenjamin091@gmail.com)

## Descripción

Este proyecto corresponde a la **Etapa 3 del Trabajo Práctico Especial** de Web 2. Se desarrolló una API RESTful para la gestión de comentarios asociados a álbumes musicales pertenecientes al catálogo musical implementado en etapas anteriores.

La API permite consultar, crear y modificar comentarios realizados sobre los álbumes almacenados en la base de datos.

## Endpoints

### Obtener todos los comentarios

```http
GET /comentarios
```

### Obtener un comentario por ID

```http
GET /comentarios/:id
```

### Filtrar comentarios por álbum

```http
GET /comentarios?id_album={id}
```

### Ordenar comentarios

```http
GET /comentarios?sort=fecha&order=asc
GET /comentarios?sort=fecha&order=desc
```

### Paginar resultados

```http
GET /comentarios?page=1&limit=2
```

### Iniciar sesión

```http
POST /auth/login
```

Body:

```json
{
    "email": "webadmin",
    "password": "admin"
}
```

### Crear comentario (requiere token JWT)

```http
POST /comentarios
```

### Modificar comentario (requiere token JWT)

```http
PUT /comentarios/:id
```


## Observaciones

Para probar los endpoints protegidos es necesario obtener previamente un token JWT mediante el endpoint de login y enviarlo en el encabezado:

```http
Authorization: Bearer <token>
```
