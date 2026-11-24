-- ABT-3: users table (HR manager accounts for login.php / manage.php)
-- Owner: Tran Trung Tin
-- To be merged into the team's main .sql file (NOP-2).
--
-- Passwords are stored only as hashes made by PHP's password_hash()
-- (bcrypt) and checked with password_verify(). Never store plain text.
-- The seeded account is admin / admin for the marker, as the brief requires.
-- To make a hash for a new account:
--   php -r 'echo password_hash("NEW_PASSWORD", PASSWORD_DEFAULT), "\n";'
--
-- failed_attempts and locked_until are for the lockout (ABT-6):
-- after 3 wrong passwords, login.php sets locked_until a few minutes ahead
-- and refuses to log in until then; a successful login resets both.

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  user_id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username        VARCHAR(50)  NOT NULL,
  password_hash   VARCHAR(255) NOT NULL,
  failed_attempts TINYINT UNSIGNED NOT NULL DEFAULT 0,
  locked_until    DATETIME     NULL DEFAULT NULL,
  created_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id),
  UNIQUE KEY uq_users_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- admin / admin
INSERT INTO users (username, password_hash)
VALUES ('admin', '$2y$12$gZ5Dw4CCiOkUgLf60kN58eDwwz4mvbGO.OafXR8YDOydpmQ16H9fK');
