used the same image from nginx for server. gor the postgres base from airflow
had port issues, site wasn't reachable from localhost. deleted the airflow's healthcheck from server, changed the port to another, all worked.
used 'exec', 'up', 'down', 'rm' and 'rmi' commands