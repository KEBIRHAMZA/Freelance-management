# Freelancer and mission management.

> Full-stack web application for freelancer and mission management.  
> Built with Spring Boot · Spring Data JPA · MySQL · REST API · JavaScript Fetch API · Thymeleaf

![Java](https://img.shields.io/badge/Java-11+-ED8B00?style=flat&logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-2.7.x-6DB33F?style=flat&logo=spring-boot)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat&logo=mysql&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-3.8+-C71A36?style=flat&logo=apache-maven)
![JUnit5](https://img.shields.io/badge/JUnit-5-25A162?style=flat&logo=junit5&logoColor=white)

---

## 📋 Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [API Endpoints](#api-endpoints)
- [Getting Started](#getting-started)
- [Running Tests](#running-tests)
- [Git Flow](#git-flow)

---

## About the Project

Platform that connects freelancers with missions. It allows managing freelancer profiles with their skills, tracking available missions, and searching for the right match based on specialty, skill, or daily rate.

This project was built as a learning project to practice the full Spring Boot stack — from IoC and dependency injection to JPA entities, REST API design, AJAX frontend, and unit/integration testing.

---

## Features

- 👤 **Freelancer management** — create, view, search and filter freelancer profiles
- 📋 **Mission tracking** — manage missions with status, budget and client info
- 🛠 **Skill catalog** — tag freelancers with technical skills by category
- 🔍 **Smart search** — filter by name, specialty, skill, daily rate or budget range
- 🌐 **REST API** — full JSON API with proper HTTP status codes (200, 201, 404, 409)
- 🖥 **Thymeleaf views** — server-side rendered pages for freelancer and mission lists
- ⚡ **AJAX frontend** — dynamic search without page reload using JavaScript Fetch API
- 🧪 **Test suite** — unit tests (Mockito), controller tests (MockMvc), repository tests (H2)

---

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Java 11 |
| Framework | Spring Boot 2.7.x |
| Persistence | Spring Data JPA |
| Database | MySQL 8.0 |
| Templates | Thymeleaf |
| Frontend | JavaScript (Fetch API) + CSS |
| Build tool | Maven |
| Testing | JUnit 5 · Mockito · MockMvc · H2 |
| Version control | Git + GitHub (Git Flow) |

---

## Project Structure

```
src/
├── main/
│   ├── java/org/mql/freelance/
│   │   ├── FreelanceHubApplication.java     ← @SpringBootApplication
│   │   ├── models/
│   │   │   ├── Freelancer.java              ← @Entity + @ManyToMany Skills & Missions
│   │   │   ├── Mission.java                 ← @Entity (title, budget, status, client)
│   │   │   └── Skill.java                   ← @Entity (name, category)
│   │   ├── repositories/
│   │   │   ├── FreelancerRepository.java    ← JpaRepository + custom @Query JPQL
│   │   │   ├── MissionRepository.java       ← derived queries + findByBudgetBetween
│   │   │   └── SkillRepository.java
│   │   ├── services/
│   │   │   ├── FreelanceService.java        ← interface
│   │   │   └── FreelanceServiceDefault.java ← @Service + constructor injection
│   │   ├── controllers/
│   │   │   ├── FreelancerController.java    ← @Controller (Thymeleaf views)
│   │   │   ├── FreelancerRestController.java← @RestController (JSON API)
│   │   │   └── MissionRestController.java   ← @RestController (JSON API)
│   │   └── config/
│   │       └── SpringConfig.java            ← @Configuration + @Bean
│   └── resources/
│       ├── application.properties
│       ├── static/
│       │   ├── css/styles.css
│       │   └── js/
│       │       ├── freelance-service.js     ← Fetch API calls
│       │       └── freelance-view.js        ← Dynamic HTML rendering
│       ├── templates/
│       │   ├── freelancers-list.html        ← Thymeleaf template
│       │   └── missions-list.html
│       └── data.sql                         ← Test data
└── test/
    └── java/org/mql/freelance/
        ├── TestDataFactory.java             ← Shared test fixtures
        ├── services/                        ← Unit tests with Mockito
        ├── controllers/                     ← MockMvc tests
        ├── repositories/                    ← @DataJpaTest with H2
        └── integration/                     ← @SpringBootTest end-to-end
```

---

## Database Schema

```sql
-- freelancers (id, name, email, specialty, daily_rate)
-- missions    (id, title, description, budget, status, client)
-- skills      (id, name, category)
-- freelancer_skill   (freelancer_id, skill_id)   ← ManyToMany join table
-- freelancer_mission (freelancer_id, mission_id)  ← ManyToMany join table
```

**Entity relationships :**

```
Freelancer ──── ManyToMany ──── Skill
Freelancer ──── ManyToMany ──── Mission
```

---

## API Endpoints

### Freelancers

| Method | URL | Description | Status |
|---|---|---|---|
| `GET` | `/api/freelancers` | Get all freelancers | 200 |
| `GET` | `/api/freelancers/{id}` | Get freelancer by id | 200 / 404 |
| `GET` | `/api/freelancers?name=xxx` | Search by name | 200 |
| `GET` | `/api/freelancers?skill=xxx` | Filter by skill | 200 |
| `GET` | `/api/freelancers?maxRate=600` | Filter by max daily rate | 200 |
| `POST` | `/api/freelancers` | Create a freelancer | 201 / 409 |

### Missions

| Method | URL | Description | Status |
|---|---|---|---|
| `GET` | `/api/missions` | Get all missions | 200 |
| `GET` | `/api/missions/{id}` | Get mission by id | 200 / 404 |
| `GET` | `/api/missions?status=OPEN` | Filter by status | 200 |
| `GET` | `/api/missions?client=xxx` | Filter by client | 200 |
| `GET` | `/api/missions?keyword=xxx` | Search by keyword | 200 |
| `GET` | `/api/missions?min=5000&max=15000` | Filter by budget range | 200 |

### Web Views (Thymeleaf)

| URL | Description |
|---|---|
| `/freelancers` | Freelancer list page |
| `/missions` | Mission list page |
| `/skills` | Skill catalog page |

> All REST endpoints support `@CrossOrigin("*")` for AJAX access from the static frontend.

---

## Getting Started

### Prerequisites

- Java 11 or higher
- Maven 3.8+
- MySQL 8.0

### 1. Clone the repository

```bash
git clone https://github.com/votre-username/freelancehub.git
cd freelancehub
```

### 2. Create the MySQL database

```sql
CREATE DATABASE freelancehub
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

### 3. Configure `application.properties`

```properties
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost/freelancehub
spring.datasource.username=root
spring.datasource.password=your_password

spring.jpa.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.defer-datasource-initialization=true
spring.sql.init.mode=always

server.port=8080
server.servlet.context-path=/freelance
```

### 4. Run the application

```bash
mvn spring-boot:run
```

The application will be available at `http://localhost:8080/freelance`

### 5. Access the API

```bash
# Get all freelancers
curl http://localhost:8080/freelance/api/freelancers

# Search by name
curl http://localhost:8080/freelance/api/freelancers?name=Ali

# Get missions with status OPEN
curl http://localhost:8080/freelance/api/missions?status=OPEN

# Create a freelancer
curl -X POST http://localhost:8080/freelance/api/freelancers \
  -H "Content-Type: application/json" \
  -d '{"name":"Ali Benali","email":"ali@test.ma","specialty":"Backend Java","dailyRate":650}'
```

---

## Running Tests

### Run all tests

```bash
mvn test
```

### Run a specific test class

```bash
mvn test -Dtest=FreelancerRepositoryTest
```

### Run a specific test method

```bash
mvn test -Dtest=FreelancerRepositoryTest#findByKeyword_WhenNoMatch_ReturnsEmptyList
```

### Generate test coverage report (JaCoCo)

```bash
mvn test jacoco:report
# Open target/site/jacoco/index.html in your browser
```

### Test layers overview

| Test type | Annotation | Tools | What it tests |
|---|---|---|---|
| Unit tests | `@ExtendWith(MockitoExtension.class)` | JUnit 5 + Mockito | Service business logic in isolation |
| Controller tests | `@WebMvcTest` | MockMvc | REST endpoints, HTTP codes, JSON |
| Repository tests | `@DataJpaTest` | H2 in-memory | Derived queries, @Query JPQL |
| Integration tests | `@SpringBootTest` | MockMvc + H2 | Full stack end-to-end |

---

## Git Flow

This project follows the **Git Flow** branching strategy :

```
main        → stable production code (tagged releases)
develop     → integration branch (all features merge here)
feature/*   → one branch per Jira ticket
fix/*       → bug fixes
release/*   → release preparation
hotfix/*    → urgent production fixes
```

### Branch naming convention

```
feature/FH-XXX-short-description
test/FH-T-XXX-what-is-tested
fix/FH-XXX-what-is-fixed
chore/FH-XXX-what-is-configured
```

### Commit message convention (Conventional Commits)

```
type(scope): short description  Ref: FH-XXX

Examples:
feat(model): add Freelancer entity with ManyToMany relations  Ref: FH-013
test(service): add unit tests for getAllFreelancers  Ref: FH-T-011
fix(api): return 404 when freelancer not found  Ref: FH-022
chore(test): configure H2 datasource for test profile  Ref: FH-T-003
```

---

## Author

**KEBIR Hamza** 

---

*FreelanceHub — Built to learn, designed to grow.*
