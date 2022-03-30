# TW-projet
 
 
The aim of this project is the implementation of the outils and knowledge acquired during our course TW2. This is a e commerce site for selling burgers. Used technologies: J2EE, JSP, HTML, CSS, JS. The data related to users accounts, products etc. are stored in an SQLite database.

## Instructions

You don't need to worry about the connector for the database. It comes with the project, it is stored in WEB-INF/lib.

First take the **wildfly** archive and place it in your **/tmp**. Place yourself inside the widfly folder and run this command:

```sh
bash bin/standalone.sh
```
This will launch your server which will be available at: **http://localhost:8080/**.

Now, place yourself inside the **tw_projet** and open a terminal. You need to set up the following environment variables through this two lines of code: 


```sh
export JBOSS_HOME=/tmp/wildfly-14.0.1.Final
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/ 
```
```diff
- Be careful you might need to change java-11-openjdk-amd64 in function to your version of java.
```

Now you need to place **creation_db.sql** in your **tmp**. Place yourself in **tmp** and open a terminal. Run the following command:

```sh
sqlite3 burgerinsa.db
```
This will create a database called burgerinsa. Now you are inside the sqlite environment. Type the following command:
```sh
.read creation_db.sql
```

To verify everything went well type this:

```sh
SELECT * FROM USERS;
```

The command should prompt you with this:


```sh
1|Mary Jane|+50764490994|mary.jane@gmail.com|admin123|admin

```
In order to enable UPDATES on the tables please after creating the database burgerinsa do CTRL+Z and type this in the terminal:
```sh
fuser burgerinsa.db
```

This will prompt you with this:
```sh
/tmp/burgerinsa.db:   15847

```

Or whatever number you have after /tmp/burgerinsa.db. Copy that number and do this command:
```sh
kill -9 15847

```



Now place yourself inside **tw_projet** and open a terminal. Type this:

```sh
./compile.sh

```
This will compile everything that is needed in order for you to see the website.
Now open your browser and type this as an URL: **http://localhost:8080/BurgerINSA/WebContent/index.jsp**
