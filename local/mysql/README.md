# master 

- SHOW MASTER STATUS\G;
- GRANT REPLICATION SLAVE ON *.* TO 'foway'@'%';

# slave

- CHANGE MASTER TO MASTER_HOST='local-store', MASTER_USER='foway', MASTER_PASSWORD='qwerty', master_auto_position=1;
- START SLAVE;

# replica test

- CREATE TABLE repltable ( no INT(8), PRIMARY KEY (no) );
- INSERT INTO repltable VALUES (1);