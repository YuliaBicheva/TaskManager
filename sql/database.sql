CREATE TABLE test.tasks
(uid INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  description VARCHAR(200),
  priority VARCHAR(10),
  ready TINYINT(1) DEFAULT '0' NOT NULL,
  created DATETIME not null default now()
)DEFAULT CHARSET utf8;


INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 1","Это задание номер 1",0,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 2","Это задание номер 2",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 3","Это задание номер 3",2,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 4","Это задание номер 4",0,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 5","Это задание номер 5",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 6","Это задание номер 6",2,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 7","Это задание номер 7",0,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 8","Это задание номер 8",2,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 9","Это задание номер 9",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 10","Это задание номер 10",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 11","Это задание номер 11",2,1);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 12","Это задание номер 12",0,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 13","Это задание номер 13",1,1);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 14","Это задание номер 14",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 15","Это задание номер 15",0,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 16","Это задание номер 16",0,1);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 17","Это задание номер 17",2,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 18","Это задание номер 18",1,1);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 19","Это задание номер 19",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 20","Это задание номер 20",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 21","Это задание номер 21",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 22","Это задание номер 22",1,0);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 23","Это задание номер 23",1,1);
INSERT INTO test.tasks (name, description, priority, ready) VALUES ("Задание 24","Это задание номер 24",1,0);