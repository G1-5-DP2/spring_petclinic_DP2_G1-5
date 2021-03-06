-- One admin user, named admin1 with passwor 4dm1n and authority admin
INSERT INTO users(username,password,enabled) VALUES ('admin1','4dm1n',TRUE);
INSERT INTO authorities VALUES ('admin1','admin');
-- One owner user, named owner1 with passwor 0wn3r
INSERT INTO users(username,password,enabled) VALUES ('owner1','0wn3r',TRUE);
INSERT INTO authorities VALUES ('owner1','owner');
-- One vet user, named vet1 with passwor v3t
INSERT INTO users(username,password,enabled) VALUES ('vet1','v3t',TRUE);
INSERT INTO authorities VALUES ('vet1','veterinarian');

INSERT IGNORE INTO vets(id, first_name, last_name) VALUES (1, 'James', 'Carter');
INSERT IGNORE INTO vets(id, first_name, last_name) VALUES (2, 'Helen', 'Leary');
INSERT IGNORE INTO vets(id, first_name, last_name) VALUES (3, 'Linda', 'Douglas');
INSERT IGNORE INTO vets(id, first_name, last_name) VALUES (4, 'Rafael', 'Ortega');
INSERT IGNORE INTO vets(id, first_name, last_name) VALUES (5, 'Henry', 'Stevens');
INSERT IGNORE INTO vets(id, first_name, last_name) VALUES (6, 'Sharon', 'Jenkins');


INSERT IGNORE INTO specialties(id, name) VALUES (1, 'radiology');
INSERT IGNORE INTO specialties(id, name) VALUES (2, 'surgery');
INSERT IGNORE INTO specialties(id, name) VALUES (3, 'dentistry');

INSERT IGNORE INTO vet_specialties(vet_id, specialty_id) VALUES (2, 1);
INSERT IGNORE INTO vet_specialties(vet_id, specialty_id) VALUES (3, 2);
INSERT IGNORE INTO vet_specialties(vet_id, specialty_id) VALUES (3, 3);
INSERT IGNORE INTO vet_specialties(vet_id, specialty_id) VALUES (4, 2);
INSERT IGNORE INTO vet_specialties(vet_id, specialty_id) VALUES (5, 1);

INSERT IGNORE INTO types(id, name) VALUES (1, 'Beagle');
INSERT IGNORE INTO types(id, name) VALUES (2, 'Boxer');
INSERT IGNORE INTO types(id, name) VALUES (3, 'Yorkshire');
INSERT IGNORE INTO types(id, name) VALUES (4, 'German shepherd');
INSERT IGNORE INTO types(id, name) VALUES (5, 'Greyhound');
INSERT IGNORE INTO types(id, name) VALUES (6, 'Labrador');
INSERT IGNORE INTO types(id, name) VALUES (7, 'Dalmatian');
INSERT IGNORE INTO types(id, name) VALUES (8, 'Buldog');
INSERT IGNORE INTO types(id, name) VALUES (9, 'Rottweiler');
INSERT IGNORE INTO types(id, name) VALUES (10, 'Basset Hound');
INSERT IGNORE INTO types(id, name) VALUES (11, 'Chow Chow');
INSERT IGNORE INTO types(id, name) VALUES (12, 'Fox Terrier');
INSERT IGNORE INTO types(id, name) VALUES (13, 'Golden Retriever');
INSERT IGNORE INTO types(id, name) VALUES (14, 'Pitbull');
INSERT IGNORE INTO types(id, name) VALUES (15, 'Bearded Collie');
INSERT IGNORE INTO types(id, name) VALUES (16, 'Terranova');
INSERT IGNORE INTO types(id, name) VALUES (17, 'Terrier Norwich');
INSERT IGNORE INTO types(id, name) VALUES (18, 'Pekingese');
INSERT IGNORE INTO types(id, name) VALUES (19, 'Siberian Husky');
INSERT IGNORE INTO types(id, name) VALUES (20, 'Great Dane');
INSERT IGNORE INTO types(id, name) VALUES (21, 'Mongrel Dog'); 
INSERT IGNORE INTO types(id, name) VALUES (22, 'Other');

INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (1, 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '6085551023');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (2, 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (3, 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (4, 'Harold', 'Davis', '563 Friendly St.', 'Windsor', '6085553198');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (5, 'Peter', 'McTavish', '2387 S. Fair Way', 'Madison', '6085552765');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (6, 'Jean', 'Coleman', '105 N. Lake St.', 'Monona', '6085552654');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (7, 'Jeff', 'Black', '1450 Oak Blvd.', 'Monona', '6085555387');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (8, 'Maria', 'Escobito', '345 Maple St.', 'Madison', '6085557683');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (9, 'David', 'Schroeder', '2749 Blackhawk Trail', 'Madison', '6085559435');
INSERT IGNORE INTO owners(id, first_name, last_name, address, city, telephone) VALUES (10, 'Carlos', 'Estaban', '2335 Independence La.', 'Waunakee', '6085555487');

INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (1, 'Leo', '2010-09-07', 1, 1);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (2, 'Basil', '2012-08-06', 5, 2);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (3, 'Rosy', '2011-04-17', 5, 3);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (4, 'Jewel', '2010-03-07', 5, 3);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (5, 'Iggy', '2010-11-30', 3, 4);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (6, 'George', '2010-01-20', 4, 5);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (7, 'Samantha', '2012-09-04', 1, 6);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (8, 'Max', '2012-09-04', 1, 6);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (9, 'Lucky', '2011-08-06', 5, 7);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (10, 'Mulligan', '2007-02-24', 2, 8);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (11, 'Freddy', '2010-03-09', 5, 9);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (12, 'Lucky', '2010-06-24', 2, 10);
INSERT IGNORE INTO pets(id,name,birth_date,type_id,owner_id) VALUES (13, 'Sly', '2012-06-08', 1, 10);

INSERT IGNORE INTO visits(id,pet_id,visit_date,description,clinic,competition_check) VALUES (1, 7, '2013-01-01', 'rabies shot','canin vet','PASSED');
INSERT IGNORE INTO visits(id,pet_id,visit_date,description,clinic,competition_check) VALUES (2, 8, '2013-01-02', 'rabies shot','canin vet','-');
INSERT IGNORE INTO visits(id,pet_id,visit_date,description,clinic,competition_check) VALUES (3, 8, '2013-01-03', 'neutered','Boyton vet','NOT PASSED');
INSERT IGNORE INTO visits(id,pet_id,visit_date,description,clinic,competition_check) VALUES (4, 7, '2013-01-04', 'spayed', 'Boyton vet', 'PASSED');


INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,canodrome) VALUES ('Race',1,'First Race Test','2020-04-05','FINISHED', 7500.00 ,800,5,'Gran Hipodromo de Andalucia');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,canodrome) VALUES ('Race',2,'Second Race Test','2020-06-14','DRAFT', 7500.00 ,800,5,'Lorem Ipsum Patata');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,canodrome) VALUES ('Race',7,'MySQL Race','2020-04-07','FINISHED', 7500.00 ,800,5,'Gran Hipodromo de Andalucia');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,canodrome) VALUES ('Race',10,'Fourth Race Test','2020-10-14','DRAFT', 7500.00 ,800,5,'Gran Hipodromo de Andalucia');

INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,place) VALUES ('Beauty',3,'Beauty ConTEST','2020-04-06','FINISHED', 7500.00,800,1,'Pabellon Principe Felipe');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,place) VALUES ('Beauty',6,'Beauty ConTEST2','2021-06-4','DRAFT', 7500.00,800,1,'Pabellon España');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,place) VALUES ('Beauty',9,'Beauty ConTEST3','2020-05-07','DRAFT', 7500.00,800,1,'Pabellon Principe Felipe');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,place) VALUES ('Beauty',12,'Beauty ConTEST4','2020-04-03','DRAFT', 7500.00,800,1,'Pabellon Principe Felipe');

INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,circuit) VALUES ('Hability',4,'Hability ConTEST','2020-07-10','DRAFT', 8000.00,800,1,'WiZink Center');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,circuit) VALUES ('Hability',5,'Hability ConTEST sponsors','2020-07-12','DRAFT', 8000.00,800,1,'IFEMA');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,circuit) VALUES ('Hability',8,'Hability ConTEST 2','2020-09-12','DRAFT', 8000.00,800,1,'Fibes');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,circuit) VALUES ('Hability',11,'Hability ConTEST completo','2020-02-12','DRAFT', 8000.00,800,1,'Fibes');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,circuit) VALUES ('Hability',13,'Hability ConTEST 3','2020-02-12','FINISHED', 8000.00,800,1,'Villamarin');
INSERT IGNORE INTO tournaments(dtype,id,name,date,status,reward_money,capacity,type_id,circuit) VALUES ('Hability',14,'Hability ConTEST 4','2020-02-12','FINISHED', 8000.00,800,1,'Villamarin');

INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (1,'Royal Canin', 4000.0, 'www.royalcanin.com',1);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (2,'Affinity', 3000.0, 'www.affinity.com',1);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (3,'Pedigree', 7500.0, 'www.pedigree.com',1);

INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (4,'Royal Canin', 4000.0, 'www.royalcanin.com',5);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (5,'Affinity', 3000.0, 'www.affinity.com',5);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (6,'Pedigree', 7500.0, 'www.pedigree.com',5);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (7,'Pedigree', 7500.0, 'www.pedigree.com',3);

INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (8,'Royal Canin', 4000.0, 'www.royalcanin.com',7);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (9,'Affinity', 3000.0, 'www.affinity.com',7);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (10,'Pedigree', 7500.0, 'www.pedigree.com',7);

INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (11,'Royal Canin', 4000.0, 'www.royalcanin.com',9);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (12,'Affinity', 3000.0, 'www.affinity.com',9);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (13,'Pedigree', 7500.0, 'www.pedigree.com',9);

INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (14,'Royal Canin', 4000.0, 'www.royalcanin.com',10);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (15,'Affinity', 3000.0, 'www.affinity.com',10);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (16,'Pedigree', 7500.0, 'www.pedigree.com',10);

INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (17,'Royal Canin', 4000.0, 'www.royalcanin.com',11);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (18,'Affinity', 3000.0, 'www.affinity.com',11);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (19,'Pedigree', 7500.0, 'www.pedigree.com',11);

INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (20,'Royal Canin', 4000.0, 'www.royalcanin.com',13);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (21,'Affinity', 3000.0, 'www.affinity.com',13);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (22,'Pedigree', 7500.0, 'www.pedigree.com',13);

INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (23,'Royal Canin', 4000.0, 'www.royalcanin.com',14);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (24,'Affinity', 3000.0, 'www.affinity.com',14);
INSERT IGNORE INTO sponsor(id,name,money,url,tournament_id) VALUES (25,'Pedigree', 7500.0, 'www.pedigree.com',14);

INSERT IGNORE INTO judges(id, first_name, last_name, city, contact) values (1, 'Juez', 'Primero', 'Sevilla', 'primero@example.com');

INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,1);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,3);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,2);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,6);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,7);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,8);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,9);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,10);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,11);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,14);
INSERT IGNORE INTO tournament_judges(judge_id, tournament_id) VALUES (1,13);

INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (1,2);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (1,3);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (1,4);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (1,9);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (1,11);

INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (7,2);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (7,3);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (7,4);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (7,9);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (7,11);

INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (2,2);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (2,3);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (2,4);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (2,9);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (2,11);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (2,12);

INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (3,2);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (3,3);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (3,4);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (3,9);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (3,11);

INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (4,13);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (4,12);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (4,8);
INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (4,1);

INSERT IGNORE INTO tournament_pets(tournament_id, pet_id) VALUES (5,2);

INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (1, 2, 1, 40.086, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (2, 3, 1, 38.595, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (3, 4, 1, 39.487, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (4, 9, 1, 37.9402, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (5, 11, 1, 38.276, 0, 0, 0);

INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (1, 2, 7, 40.086, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (2, 3, 7, 38.595, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (3, 4, 7, 39.487, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (4, 9, 7, 37.9402, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (5, 11, 7, 38.276, 0, 0, 0);

INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (6, 8, 4, 38.276, 0, 0, 0);
INSERT IGNORE INTO resulttime(id, pet_id, tournament_id, time, lowfails, mediumfails, bigfails) VALUES (7, 1, 4, 40.276, 1, 1, 1);

INSERT IGNORE INTO resultscore(id, pet_id, tournament_id, haircut, haircutdif, technique, posture) VALUES (2, 3, 3, 4, 6, 5, 5);
INSERT IGNORE INTO resultscore(id, pet_id, tournament_id, haircut, haircutdif, technique, posture) VALUES (3, 4, 3, 1, 0, 0, 0);
INSERT IGNORE INTO resultscore(id, pet_id, tournament_id, haircut, haircutdif, technique, posture) VALUES (4, 9, 3, 0, 0, 0, 0);
INSERT IGNORE INTO resultscore(id, pet_id, tournament_id, haircut, haircutdif, technique, posture) VALUES (5, 11, 3, 4, 10, 10, 10);
