INSERT INTO users (full_name, email, monthly_income)
VALUES
('R Anudeep', 'anudeep@gmail.com', 85000),
('Priya Verma', 'priya@gmail.com', 65000);

INSERT INTO loans (user_id, loan_amount, interest_rate, tenure_months)
VALUES
(1, 500000, 9.5, 60),
(2, 300000, 11.0, 48);

INSERT INTO transactions (user_id, amount, type, category, transaction_date)
VALUES
(1, 20000, 'EXPENSE', 'Rent', '2026-03-01'),
(1, 10000, 'EXPENSE', 'Food', '2026-03-02'),
(1, 85000, 'INCOME', 'Salary', '2026-03-01'),
(2, 15000, 'EXPENSE', 'Shopping', '2026-03-01'),
(2, 65000, 'INCOME', 'Salary', '2026-03-01');