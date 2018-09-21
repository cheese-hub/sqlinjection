# SQL Injection

This is a demonstration of SQL injection attacks that exploit unsecure database client code and ways to prevent such attacks.

## Installation and Usage

### Installation
To build the container, run:

``
docker build -t cheesehub/sqlinjection .
``

This demonstration is designed around a Jupyter notebook interface. When running the container, expose port 8888:

``
docker run -d -p 8888 cheesehub/sqlinjection
``

### Usage
The container includes a simple sqllite based implementation of a database and vulnerable client. You will be presented with a Jupyter notebook interface displaying a list of files and folders. Click to select the SQLInjection.ipynb Jupyter notebook to begin.
The notebook includes a step-by-step overview of how to exploit the vulnerable client to gain unauthorized access to the database and even insert or delete records. You will need to open a terminal window from the Jupyter notebook interface to run the commands from the Jupyter notebook instructions. 

Finally, a simple fix is proposed that incorporates input validation to patch the client and prevent unauthorized access. You will need to open, edit and save a Python file that implements the database client. The file can be located in the Jupyter notebook interface following the directory structure specified in the SQLInjection.ipynb notebook. 
