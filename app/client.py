import sqlite
import sqlite3
import getpass

conn = sqlite3.connect('database')
c = conn.cursor()

# start service
print("""

============================================================================
                ******   *     *     *     ***   *
                *        **   **    * *     *    *
                ******   * * * *   *****    *    *
                *        * * * *   *   *    *    *
                ******   *  *  *   *   *   ***   *****

                ******   *       *****   *   *   ****
                *        *       *   *   *   *   *   *
                *        *       *   *   *   *   *   *
                *        *       *   *   *   *   *   *
                ******   *****   *****   *****   ****

Welcome to Email Cloud, you can store your email addresses in our service.
You can log into our server and get all your email addresses at any time.
============================================================================

""")
print("Please log in:")
while True:
	try:
		# take username and password
		username = input("Username: ")
		password = getpass.getpass(prompt="Password: ")
		
		# unsafe
		command = "SELECT * FROM emailcloud WHERE username = '" + username + "' AND password = '" + password + "'"
		sqlite.execute(c, command)

		# SQL injection protection
		# command = "SELECT * FROM emailcloud WHERE username = ? AND password = ?"
		# c.execute(command, (username, password))

		# fetch all the results
		result = c.fetchall()
		if result == None or result == []:
			print("Invalid username password pair!")
		else:
			print("Your profile data is listed in the following: \n", str(result))
	except KeyboardInterrupt:
		print("\nexit")
		break
	except:
		print("A database error occured")
	finally:
		print("\nTry again:")

conn.commit()
conn.close()
