#SQL Injection

This is a showcase of SQL injection and how to prevent it.

##Installation and Usage

###Installation
If any of the following commands fail with "Permission" issue, try again with root authentication (```sudo su```).

1. Download this folder to local directory 
2. cd into this folder
3. run ```docker build -t sql-injection .``` to build the image

###Usage
1. run ```docker run sql-injection``` to run the container
2. Type the following commands in *another terminal / command prompt* to check the ip address of the container:
  - Type ```docker ps``` to check the running containers
  - Find out the container name of **ofuzz**, for example, dreamy_leavitt
  - Type ```docker inspect <container name>```, in this example ```docker inspect dreamy_leavitt``` to check the properties of this container
  - You will find the ip address of the container in the last a few lines 
3. Now open your browser, type in <container ip address>:3000 as url. Now you can see a terminal in browser.
  - Log in using username **term** and password **term**
4. Run ```EmailCloud``` to run the vulnerable server.
5. Type ```Alice``` for username, type ```pwd``` for password, you will get Alice's email addresses.
6. Type ```Random``` for username, type ```forgot``` for password, you will get "Invalid username password pair!".
7. Everything seems normal so far. Now pull all the data from this table:
  - Try ```a' OR '1=1``` for both username and password, tell me what you see. (It is because "1=1" is always true!)
  - Pull someone's identity without a password: Try ```Alice'; --``` as username and anything for password. See what you got! 
8. You can also try to modify the database:
  - Find out the table name:
    - Type ```x' OR 0<(SELECT COUNT(*) FROM random_name); --``` for username and anything for password (```--``` comments out everything follows it in this line). 
    You will get "A database error occured" because there's no table named "random_name". 
    - Replace *random_name* with some guesses and see what would happen. It would not take too long before you get the correct table name "emailcloud".
  - Now you can do anything to the table!
    - Type ```x'; INSERT INTO emailcloud VALUES ('hacker', 'pwd', 'myemail@hackerunion.org'); --``` for username and anything for password.
    - Check if you can get your email by typeing ```hacker``` as username and ```pwd``` as password. If this is a real server, you can make yourself administrator and do anything you want.
    - You can even delete the entire table from the database. Type ```x'; DROP TABLE emailcloud; --``` for username and anything for password. Now try getting your email again.
    - Don't forget to recover the database by using ```RecoverDatabase``` before you try to use it again.
9. Prevent SQL injection
  - Open the source code of EmailCloud by typing ```nano /app/client.py```, command the lines under ```# unsafe``` and uncommand the lines under ```# SQL injection protection```
  - Run ```EmailCloud``` to run the securied server.
  - Do the samething to this server and see what would happen.

###How to prevent SQL injection
1. Constrain user input, e.g. don't allow username and password containing characters like ', ", and *
2. Use parameters with stored procedures, like what we did in this case
