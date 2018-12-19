# Spring Boot, Postgres, JPA, Hibernate Rest API

Build Restful API for a simple  application using Spring Boot, Postgres, JPA and Hibernate.

## Requirements

1. Java - 1.8.x

2. Maven - 3.x.x

3. Postgres - 9.5.x

## Steps to Setup

**1. Clone the application**

```bash
git clone https://github.com/desarrollomarquez
```

**2. Create Postgres database**
```bash
create database trackerentropia
```

**3. Change postgres username and password as per your installation**

+ open `src/main/resources/application.properties`

+ change `spring.datasource.username` and `spring.datasource.password` as per your mysql installation

**4. Build and run the app using maven**

```bash
mvn package
java -jar target/TrackerDataEntropia-1.0.0.jar
```

Alternatively, you can run the app without packaging it using -

```bash
mvn spring-boot:run
```

The app will start running at <http://localhost:8080>.

## Explore Rest APIs

The app defines following CRUD APIs.

    GET /api/vehiculos
    
    POST /api/vehiculos
    
    GET /api/vehiculos/{vehiculoId}
    
    PUT /api/vehiculos/{vehiculoId}
    
    DELETE /api/vehiculos/{vehiculoId}

You can test them using postman or any other rest client.

## Learn more

You can find the tutorial for this application on github -

<https://github.com/desarrollomarquez/>
