# Databases

**SQLite:**
```bash
# Install SQLite
pkg install sqlite

# Create database
sqlite3 mydb.db

# In SQLite prompt:
CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT);
INSERT INTO users VALUES (1, 'John');
SELECT * FROM users;
.quit
```

**PostgreSQL:**
```bash
# Install PostgreSQL
pkg install postgresql

# Initialize database
mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql

# Start server
pg_ctl -D $PREFIX/var/lib/postgresql start

# Create database
createdb mydb

# Connect
psql mydb
```
