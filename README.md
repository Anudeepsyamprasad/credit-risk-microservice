# Credit Risk & Event Analytics Platform

```markdown
## Key Technologies
- Java 17
- Spring Boot
- Spring Security (JWT Authentication)
- PostgreSQL
- JPA / Hibernate
- Docker
- AWS EC2
- Maven

## Overview

This project simulates a distributed financial risk evaluation and reporting platform designed to process high-volume loan decision events and generate performance-optimized analytical reports.

The system models:

- Risk evaluation engine for loan applications
- Event ingestion layer simulating distributed clusters
- Reporting framework for live and historical analytics
- SQL performance optimization using indexing strategies
- Observability and monitoring capabilities

This project is designed to demonstrate backend system design, data aggregation, distributed systems fundamentals, and performance tuning techniques.

---

## Architecture

Client  
   ↓  
Risk Evaluation API  
   ↓  
Event Ingestion Layer  
   ↓  
PostgreSQL (Transactional + Reporting Data)  
   ↓  
Reporting Engine (Aggregation APIs)

---

## Core Modules

### 1. Risk Core Engine

Responsible for:

- Evaluating loan applications
- Computing risk scores
- Persisting loan decisions
- Generating corresponding risk events

Key features:

- Transactional consistency
- Secure REST APIs (JWT-based authentication)
- Financial domain modeling
- Structured error handling

---

### 2. Event Ingestion Layer

Simulates distributed cluster-based event generation.

Each loan decision generates an event containing:

- `cluster_id`
- `application_id`
- `status`
- `processing_time_ms`
- `created_at`

The system supports high-volume event storage to enable realistic reporting workloads.

---

### 3. Reporting Engine

Provides performance-optimized APIs for:

- Success rate by cluster
- Failure trends over time
- SLA breach detection
- Time-windowed analytics
- Cluster-level aggregation metrics

Advanced SQL features used:

- GROUP BY
- HAVING
- Indexed filtering
- Time-based aggregation
- Execution plan analysis

---

## Database Design

The schema is designed to handle:

- High-volume event ingestion
- Time-series reporting workloads
- Aggregation-heavy queries

Indexes are applied to optimize:

- `cluster_id` filtering
- `created_at` time-window queries
- Reporting aggregations

---

## Performance Optimization

Performance investigation was conducted using:

- `EXPLAIN ANALYZE`
- Execution plan comparison
- Composite indexing strategies

Example optimization approach:

1. Identify slow aggregation query
2. Analyze execution plan
3. Detect sequential scan
4. Introduce composite index on `(cluster_id, created_at)`
5. Re-evaluate execution plan
6. Measure reduced execution time

Performance improvements will be documented with execution plan comparison results.

---

## Observability

The system includes:

- Structured logging
- Spring Boot Actuator endpoints
- Health monitoring
- Performance-aware reporting APIs

This enables debugging of slow queries and monitoring of API response times.

---

## Deployment

- Dockerized Spring Boot application
- PostgreSQL container via Docker Compose
- Deployable to AWS EC2

---

## Scalability Considerations

For large-scale deployment:

- Table partitioning by time for event tables
- Read replicas for heavy reporting queries
- Caching frequently accessed reports
- Horizontal scaling of API layer
- Potential migration to streaming-based ingestion (e.g., Kafka)

---

## Future Enhancements

- Materialized views for heavy aggregations
- Real-time event streaming integration
- Distributed tracing support
- Monitoring dashboard integration


## Database Layer

This module contains:

• PostgreSQL schema for financial entities
• Sample dataset for testing
• Risk evaluation queries
• Performance optimization indexes

Execution order:

1. schema/01_create_tables.sql
2. data/02_sample_data.sql
3. queries/03_risk_queries.sql
4. indexes/04_indexes.sql


## Project Structure

src/main/java/com/creditrisk

controller
 - RiskController.java
 - ReportingController.java

service
 - RiskEvaluationService.java
 - ReportingService.java

repository
 - LoanApplicationRepository.java
 - RiskEventRepository.java

model
 - LoanApplication.java
 - RiskEvent.java

security
 - JwtAuthenticationFilter.java
 - SecurityConfig.java

config
 - DatabaseConfig.java


Sample API Example: 
- POST /api/loan/evaluate

Request:
{
  "income": 60000,
  "creditScore": 720,
  "existingDebt": 15000
}

Response:
{
  "riskScore": 82,
  "decision": "APPROVED"
}

# How to Run the Project
- Prerequisites
Make sure the following tools are installed:
- Java 17+
- Maven 3.8+
- Docker & Docker Compose
- PostgreSQL (if not using Docker)

Verify installation:
- java -version
- mvn -version
- docker --version

### 1. Clone the Repository
- git clone https://github.com/Anudeepsyamprasad/credit-risk-microservice.git
- cd credit-risk-microservice

### 2 Start PostgreSQL Database (Docker)
Run PostgreSQL using Docker:
- docker-compose up -d
This will start a PostgreSQL container with the configured database.

Default configuration:
- Database: creditrisk
- Username: postgres
- Password: postgres
- Port: 5432

### 3 Initialize Database Schema
Run SQL scripts in order:
database/schema/01_create_tables.sql
database/data/02_sample_data.sql
database/queries/03_risk_queries.sql
database/indexes/04_indexes.sql

You can run them using:
psql -U postgres -d creditrisk -f database/schema/01_create_tables.sql

### 4 Build the Spring Boot Application
- mvn clean install

### 5 Run the Application
- mvn spring-boot:run

Application will start at:
"http://localhost:8080"

### 6 Test APIs
Example API request:
Evaluate Loan Risk
POST - /api/loan/evaluate

Example request:
{
  "income": 70000,
  "creditScore": 720,
  "existingDebt": 15000
}
Example response:
{
  "riskScore": 82,
  "decision": "APPROVED"
}

You can test APIs using:
- Postman
- cURL
- Swagger (if enabled)

