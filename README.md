# SQL Injection

## Description of the scenario

SQL (Structured Query Language) Injection is an example of a cybersecurity attack that exploits knowledge of SQL 
syntax and unintended vulnerabilities in database client code to make malicious changes to a database. The vulnerabilities 
in the client code typically stem from improper input validation, allowing the attacker to access, insert, modify, or delete 
entries in the database tables. If the database contains privileged information or implements access control for such information, 
a hacker can gain access to this information using such attacks. 

This repository contains one such example of vulnerable database client code and the types of SQL Injection attacks that 
can be performed against it. Instructions are also provided for fixing this vulnerability, and verifying that the SQL Injection 
attacks can no longer be performed.

## Target Audience

### Instructors

If you are an instructor teaching cybersecurity concepts and secure coding, you can use this example to provide hands-on 
experience with SQL Injection attacks and the ease with which privileged information can be retrieved. You can also 
use the insecure client code to instruct students on identifying such vulnerabilities and methods for securing their code.

### Students

If you are a student in a cybersecurity class, or, a budding programmer, it is instructive to understand how minor mistakes 
in code can lead to large security vulnerabilities. If you are currently learning about SQL Injection in your class, you can 
get further practical experience with how these attacks operate and what can be done to prevent such attacks.

## Design and Architecture

This demonstration is designed as a single Docker container that hosts both the database server and client. The SQLite database 
engine is used for the server and the Python sqlite package is used to implement a database client with improper input validation. 
A Jupyter notebook is included with step-by-step instructions for conducting various SQL Injection attacks via the vulnerable 
database client. The Python-based database client can be executed from the Jupyter notebook terminal interface. Instructions are 
also provided in the Jupyter notebook for fixing the vulnerability in the database client code and retrying the SQL Injection attacks.

## Installation and Usage

The recommended approach to running this container is on CHEESEHub, a web platform for cybersecurity demonstrations. CHEESEHub 
provides the necessary resources for orchestrating and running containers on demand. In order to set up this application to be 
run on CHEESEHub, an *application specification* needs to be created that configures the Docker image to be used, memory and 
CPU requirements, and, the ports to be exposed. The JSON *spec* for this SQL Injection demonstration can be found [here](https://github.com/rkalyanapurdue/catalog/tree/master/sqlinjection).

CHEESEHub uses Kubernetes to orchestrate its application containers. You can also run this application on your own Kubernetes 
installation. For instructions on setting up a minimal Kubernetes cluster on your local machine, refer to [Minikube](https://github.com/kubernetes/minikube). 

Before being able to run on either CHEESEHub or Kubernetes, a Docker image needs to be built for this application container. 
The container definition can be found in the *Dockerfile* in this repository. To build the container, run:

``
docker build -t <image tag of your choice> .
``

Once a Docker image has been built, you can run this container using just the Docker engine:

``
docker run -d -p 8888 <image tag from above>
``

Since the user facing interface of the container is the Jupyter notebook we expose port 8888 to be accessible on the host machine.

### Usage
On navigating to the URL of the container in your browsr, you will be presented with a Jupyter notebook interface displaying a list of files 
and folders. Click to select the SQLInjection.ipynb Jupyter notebook to begin. The notebook includes a step-by-step overview of how to exploit 
the vulnerable client to gain unauthorized access to the database and even insert or delete records. You will need to open a terminal window 
from the Jupyter notebook interface to run the commands from the Jupyter notebook instructions. 

Finally, a simple fix is proposed that incorporates input validation to patch the client and prevent unauthorized access. You will need to open, 
edit and save a Python file that implements the database client. The file can be located in the Jupyter notebook interface following the 
directory structure specified in the SQLInjection.ipynb notebook. 

## How to Contribute

To report issues or contribute enhancements to this application, open a GitHub issue. 

