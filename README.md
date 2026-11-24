# Programación Distribuida

Repositorio de prácticas y proyectos desarrollados durante la asignatura de **Programación Distribuida** en la **Universidad Central del Ecuador**.

## Objetivo

Este repositorio contiene ejercicios y aplicaciones desarrolladas durante el curso para comprender conceptos fundamentales de:

- Aplicaciones Web Java
- Servicios REST
- JSON
- Docker
- PostgreSQL
- Helidon
- Quarkus
- JPA / Hibernate
- MicroProfile
- Arquitecturas Distribuidas

---

# Estructura del Proyecto

```text
prog-distribuida
│
├── web01
├── web02
├── web03
├── app-authors
├── app-books
│
├── gradle
├── gradlew
├── gradlew.bat
└── settings.gradle.kts
```

---

# Proyecto: web01

Aplicación web básica desplegada en Apache Tomcat.

## Tecnologías

- Java
- Servlets
- JSP
- Apache Tomcat
- Gradle

## Conceptos aprendidos

- Aplicaciones Web Java
- Estructura de un proyecto web
- Despliegue WAR
- Configuración de Tomcat

---

# Proyecto: web02

Primer servicio REST desarrollado con RESTEasy y Undertow.

## Tecnologías

- RESTEasy
- Undertow
- Java
- Gradle

## Conceptos aprendidos

- Servicios REST
- Endpoints HTTP
- Parámetros de ruta
- Serialización JSON

## Endpoint

```http
GET /api/hola/{nombre}
```

### Ejemplo

```http
GET /api/hola/Jhonny
```

Respuesta:

```json
{
  "mensaje": "Hola Jhonny"
}
```

---

# Proyecto: web03

Microservicio desarrollado con Helidon conectado a PostgreSQL usando Docker.

## Tecnologías

- Helidon SE
- Docker
- PostgreSQL
- JDBC
- JSON-B

## Conceptos aprendidos

- Configuración externa con YAML
- Docker Compose
- Conexión a bases de datos
- Consultas SQL
- Generación automática de JSON

## Endpoint

```http
GET /books
```

### Ejemplo de respuesta

```json
[
  {
    "isbn": "978-01",
    "title": "Java"
  },
  {
    "isbn": "978-02",
    "title": "Cloud Native"
  }
]
```

---

# Proyecto: app-authors

Microservicio desarrollado con Quarkus para la gestión de autores.

## Tecnologías

- Quarkus
- JPA
- Hibernate ORM
- Panache Repository
- CDI
- PostgreSQL
- MicroProfile Config

## Conceptos aprendidos

- Entidades JPA
- Repositorios
- Inyección de Dependencias
- Configuración externa
- APIs REST
- Persistencia de datos

## Entidad

```text
Author
├── id
├── name
└── version
```

## Endpoints

### Obtener todos los autores

```http
GET /authors
```

### Obtener autor por ID

```http
GET /authors/{id}
```

### Ejemplo

```http
GET /authors/1
```

Respuesta:

```json
{
  "id": 1,
  "name": "Gabriel Garcia Marquez",
  "version": 1
}
```

---

# Proyecto: app-books

Microservicio desarrollado con Quarkus para la gestión de libros e inventario.

## Tecnologías

- Quarkus
- Hibernate ORM
- Panache
- PostgreSQL
- JSON-B

## Conceptos aprendidos

- Relaciones One-To-One
- Inventario
- Persistencia con JPA
- Consultas mediante Repository
- APIs REST

## Entidades

### Book

```text
Book
├── isbn
├── title
├── price
└── version
```

### Inventory

```text
Inventory
├── sold
├── supplied
└── version
```

## Relación

```text
Book
  │
  │ One-To-One
  ▼
Inventory
```

## Endpoint

```http
GET /books
```

### Ejemplo

```json
[
  {
    "isbn": "978-0134686097",
    "title": "Effective Java",
    "price": 45.00,
    "version": 1,
    "inventory": {
      "sold": 10,
      "supplied": 50,
      "version": 1
    }
  }
]
```

---

# Base de Datos

## PostgreSQL

La base de datos utilizada en los proyectos Quarkus es:

```text
modelo-db
```

Ejecutada mediante Docker Compose.

## Principales tablas

```text
authors
books
inventory
books_authors
```

---

# Docker

Docker se utiliza para ejecutar PostgreSQL y Adminer.

## Servicios

### PostgreSQL

```text
Puerto: 5432
```

### Adminer

```text
http://localhost:9080
```

---

# Tecnologías Utilizadas

- Java 25
- Gradle
- PostgreSQL
- Docker
- Docker Compose
- Apache Tomcat
- RESTEasy
- Undertow
- Helidon
- Quarkus
- Hibernate ORM
- JPA
- Panache
- CDI
- MicroProfile Config
- JSON-B

---

# Autor

**Jhonny Eduardo Ninabanda Pambabay**

Universidad Central del Ecuador

Facultad de Ingeniería y Ciencias Aplicadas

Periodo Académico: 2026 - 2027

---

# Estado del Proyecto

✅ web01 implementado

✅ web02 implementado

✅ web03 implementado

✅ app-authors implementado

✅ app-books implementado

Continuando el aprendizaje de Arquitecturas Distribuidas, Microservicios y Cloud Native Java.
