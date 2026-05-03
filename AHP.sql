-- =========================
-- DROP ALL (RESET DB)
-- =========================
DROP TABLE IF EXISTS result;
DROP TABLE IF EXISTS score;
DROP TABLE IF EXISTS criteria_weight;
DROP TABLE IF EXISTS criteria;
DROP TABLE IF EXISTS apartment;
DROP TABLE IF EXISTS users;

-- =========================
-- USERS
-- =========================
CREATE TABLE users (
    username TEXT PRIMARY KEY,
    password TEXT NOT NULL
);

INSERT INTO users VALUES
('admin', '123');

-- =========================
-- APARTMENT
-- =========================
CREATE TABLE apartment (
    id TEXT PRIMARY KEY,
    name TEXT,
    price NUMERIC,
    area NUMERIC,
    distance NUMERIC
);
-- Toggle Row Level Security → OFF
INSERT INTO apartment VALUES
('A1', 'Nhà Quận 1', 8, 7, 5),
('A2', 'Nhà Quận 3', 6, 9, 7),
('A3', 'Nhà Thủ Đức', 9, 6, 6),
('A4', 'Nhà Bình Thạnh', 7, 8, 4);

-- =========================
-- CRITERIA
-- =========================
CREATE TABLE criteria (
    id INT PRIMARY KEY,
    name TEXT
);

INSERT INTO criteria VALUES
(1, 'Giá'),
(2, 'Diện tích'),
(3, 'Khoảng cách'),
(4, 'Hình thể'),
(5, 'Đường'),
(6, 'Pháp lý'),
(7, 'Tiện ích');

-- =========================
-- CRITERIA WEIGHT (AHP)
-- =========================
CREATE TABLE criteria_weight (
    id SERIAL PRIMARY KEY,
    criteria_id INT REFERENCES criteria(id),
    weight NUMERIC
);
-- Toggle Row Level Security → OFF
INSERT INTO criteria_weight(criteria_id, weight) VALUES
(1, 0.25),
(2, 0.2),
(3, 0.2),
(4, 0.1),
(5, 0.1),
(6, 0.1),
(7, 0.05);

-- =========================
-- SCORE (CHUẨN AHP - LINH HOẠT)
-- =========================
CREATE TABLE score (
    apartment_id TEXT REFERENCES apartment(id),
    criteria_id INT REFERENCES criteria(id),
    value NUMERIC,
    PRIMARY KEY (apartment_id, criteria_id)
);
-- Toggle Row Level Security → OFF
-- DATA MẪU
INSERT INTO score VALUES
-- A1
('A1',1,8),('A1',2,7),('A1',3,5),('A1',4,9),('A1',5,10),('A1',6,10),('A1',7,9),

-- A2
('A2',1,6),('A2',2,9),('A2',3,7),('A2',4,8),('A2',5,7),('A2',6,8),('A2',7,7),

-- A3
('A3',1,9),('A3',2,6),('A3',3,6),('A3',4,7),('A3',5,8),('A3',6,9),('A3',7,8),

-- A4
('A4',1,7),('A4',2,8),('A4',3,4),('A4',4,8),('A4',5,9),('A4',6,7),('A4',7,8);

-- =========================
-- RESULT (KẾT QUẢ XẾP HẠNG)
-- =========================
CREATE TABLE result (
    apartment_id TEXT REFERENCES apartment(id),
    final_score NUMERIC,
    rank INT
);

-- =========================
-- VIEW TÍNH ĐIỂM AHP
-- =========================
CREATE OR REPLACE VIEW ahp_result AS
SELECT 
    s.apartment_id,
    SUM(s.value * w.weight) AS final_score
FROM score s
JOIN criteria_weight w 
    ON s.criteria_id = w.criteria_id
GROUP BY s.apartment_id
ORDER BY final_score DESC;

