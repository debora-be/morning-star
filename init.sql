CREATE DATABASE IF NOT EXISTS morning_star_dev;
CREATE USER IF NOT EXISTS 'morning_star'@'%' IDENTIFIED BY 'morning_pass';
GRANT ALL PRIVILEGES ON morning_star_db.* TO 'morning_star'@'%';
FLUSH PRIVILEGES;
