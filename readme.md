# Requirements
To run the script `add_rows.py`, you need to have Docker and Python installed.  You also need to intall the psycopg library.  This Python library is used to for interfacing with the PostgreSQL database.  It can be installed with the following command:

    pip install "psycopg[binary]"

If you have all the requirements installed, you should be able to simply run the Python script `add_rows.py` the way you would any other Python script.  

When you run `add_rows.py`, it will use Docker Compose to create two databases.  The first one (the primary database) will be replicated by the standby database.  It will wait for the containers to completely startup.  When they have both started up, it will add 100 rows to the primary database.  It will then query the standby database and verify that it now contains 100 rows.  Finally, it will close the containers.  Note, however, that it will not remove the volumes that the data was saved to.  So, if you run the script again, there will be 200 rows in both of the databases instead of 100.  If you want to, you can remove the volumes by running the following command in the folder containing `docker-compose.yaml`:

    docker-compose down -v
