import sqlite3

# sqlite3 only allows one command per execute function
# This function wrapped sqlite's execute function to allow 
# multiple execution in one command to show you how some
# volunerable sql servers are attacked
def execute(c, commands):
	command_arr = commands.split(";")
	for command in command_arr:
		command = command.strip() # remove white spaces
		if not command.startswith('--'):
			c.execute(command)