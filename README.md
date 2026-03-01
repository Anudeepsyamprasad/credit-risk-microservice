# Credit Risk & Event Analytics Platform

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
