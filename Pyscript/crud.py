import mysql.connector as myconn
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Access the environment variables
db_host = os.getenv('DB_HOST')
db_user = os.getenv('DB_USER')
db_pass = os.getenv('DB_PASS')

# Use these variables in your database connection setup


conn_obj = myconn.connect(user=db_user, password=db_pass, host=db_host)

# Create Database
def create_database(database_name):
    cursor = conn_obj.cursor()
    cursor.execute(f"CREATE DATABASE IF NOT EXISTS {database_name}")
    cursor.execute(f'USE {database_name}')
    print('Database created successfully')

# Create Table
def create_table():
    cursor = conn_obj.cursor()
    cursor.execute("""CREATE TABLE IF NOT EXISTS EMPLOYEES(
                   emp_id INT AUTO_INCREMENT PRIMARY KEY,
                   name VARCHAR(255) NOT NULL,
                   position VARCHAR(255),
                   salary INT);""")
    print('Employee table is created')

# Insert Values
def insert_value(name, position, salary):
    cursor = conn_obj.cursor()
    cursor.execute('SELECT * FROM EMPLOYEES WHERE name = %s AND position = %s AND salary = %s', (name, position, salary))
    result = cursor.fetchall()
    if result:
        print(f"Record for {name} already exists. Skipping insertion.")
    else:
        cursor.execute('INSERT INTO EMPLOYEES (name, position, salary) VALUES(%s, %s, %s)', (name, position, salary))
        conn_obj.commit()
        print('Values successfully inserted')

# Show Tuples
def read():
    cursor = conn_obj.cursor()
    cursor.execute('SELECT * FROM EMPLOYEES')
    results = cursor.fetchall()
    for record in results:
        print(record)

# Update Values
def update_employee(emp_id, name=None, position=None, salary=None):
    cursor = conn_obj.cursor()
    query = "UPDATE EMPLOYEES SET "
    fields = []
    values = []
    if name:
        fields.append("name = %s")
        values.append(name)
    if position:
        fields.append("position = %s")
        values.append(position)
    if salary:
        fields.append("salary = %s")
        values.append(salary)
        
    query += ", ".join(fields) + " WHERE emp_id = %s"
    values.append(emp_id)
    cursor.execute(query, tuple(values))
    conn_obj.commit()

# Delete Employee
def delete_employee(employee_id):
    cursor = conn_obj.cursor()
    query = "DELETE FROM EMPLOYEES WHERE emp_id = %s"
    cursor.execute(query, (employee_id,))
    conn_obj.commit()

if __name__ == "__main__":
    create_database('python')
    create_table()
    insert_value("Aniket Babar", "Software Developer", 85000)
    insert_value("Pratiksha Yadav", "Data Analyst", 70000)
    insert_value("Sahil Vichare", "HR", 50000)
    read()
    update_employee(1, salary=90000, position="Senior Software Developer")
    read()

conn_obj.close()
