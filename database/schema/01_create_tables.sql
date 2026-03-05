CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    monthly_income NUMERIC(12,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    loan_amount NUMERIC(12,2) NOT NULL,
    interest_rate NUMERIC(5,2) NOT NULL,
    tenure_months INT NOT NULL,
    emi NUMERIC(10,2),
    status VARCHAR(50) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    amount NUMERIC(12,2) NOT NULL,
    type VARCHAR(50) CHECK (type IN ('INCOME', 'EXPENSE')),
    category VARCHAR(100),
    transaction_date DATE NOT NULL
);