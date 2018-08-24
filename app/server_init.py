import sqlite3

conn = sqlite3.connect('database')
c = conn.cursor()

# set up the database
c.execute("DROP TABLE IF EXISTS emailcloud")
c.execute('''CREATE TABLE emailcloud
			 (username text, password text, email text)''')

users = [('Alice', 'pwd', 'alice@mail.com'),
		 ('Alice', 'pwd', 'second@mail.com'),
		 ('Alice', 'pwd', 'third@mail.com'),
		 ('Bob', 'pwd', 'bob1@mail.com'),
		 ('Bob', 'pwd', 'bob2@mail.com'),
		 ('Charles', 'pwd', 'charlie@mail.com'),
		 ('Donald', 'pwd', 'foo@mail.com'),
		 ('Donald', 'pwd', 'bar@mail.com'),
		 ('Apple', 'pwd', 'johnny@mail.com'),
		 ('Eric', 'pwd', 'xing@mail.com'),
		 ('Eric', 'pwd', 'mello@mail.com')
		]

c.executemany("INSERT INTO emailcloud VALUES (?, ?, ?)", users)

conn.commit()
conn.close()
