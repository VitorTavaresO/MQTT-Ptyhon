----------------- User -----------------
INSERT INTO "user" (username, birthday, email, password) VALUES ('roger', '1999-01-01', 'roger@gmail.com', '123456');
INSERT INTO "user" (username, birthday, email, password) VALUES ('maria', '1999-01-01', 'maria@gmail.com', '123456');
INSERT INTO "user" (username, birthday, email, password) VALUES ('joao', '1999-01-01', ' joao@gmail.com', '123456');

SELECT username, birthday, email, password FROM "user" WHERE user_id = 1;
SELECT username, birthday, email FROM "user" WHERE user_id = 2;
SELECT user_id FROM "user" WHERE username = 'joao';

UPDATE "user" SET username = 'rogerio' WHERE user_id = 1;
UPDATE "user" SET email = 'maria@hotmail.com' WHERE user_id = 2;
UPDATE "user" SET password = 'joao' WHERE user_id = 3;

DELETE FROM "user" WHERE user_id = 1;
DELETE FROM "user" WHERE user_id = 2;
DELETE FROM "user" WHERE user_id = 3;

----------------- Place -----------------
INSERT INTO place (name, geocode, temperature, humidity, user_id) VALUES ('Casa', '123456', 30, 50, 1);
INSERT INTO place (name, geocode, temperature, humidity, user_id) VALUES ('Apartamento', '123456', 26, 47, 2);
INSERT INTO place (name, geocode, temperature, humidity, user_id) VALUES ('Trabalho', '123456', 20, 64, 3);

SELECT name, geocode, temperature, humidity, user_id FROM place WHERE place_id = 1;
SELECT name, geocode, temperature, humidity FROM place WHERE place_id = 2;
SELECT place_id FROM place WHERE name = 'Trabalho';

UPDATE place SET name = 'Casa do Rogerio' WHERE place_id = 1;
UPDATE place SET geocode = '654321' WHERE place_id = 2;
UPDATE place SET temperature = 25 WHERE place_id = 3;

DELETE FROM place WHERE place_id = 1;
DELETE FROM place WHERE place_id = 2;
DELETE FROM place WHERE place_id = 3;

----------------- Species -----------------
INSERT INTO species (name, waterFrequency, sunFrequency, attentionFrequency, description) VALUES ('Cacto', 2, 5, 2, 'Cacto é uma planta que não precisa de muita água.');
INSERT INTO species (name, waterFrequency, sunFrequency, attentionFrequency, description) VALUES ('Suculenta', 3, 5, 4, 'Suculenta é uma planta que não precisa de muita água.');
INSERT INTO species (name, waterFrequency, sunFrequency, attentionFrequency, description) VALUES ('Rosa', 6, 6, 5, 'Rosa é uma planta que precisa de muita água.');

SELECT name, waterFrequency, sunFrequency, attentionFrequency, description FROM species WHERE species_id = 1;
SELECT waterFrequency, sunFrequency, attentionFrequency FROM species WHERE species_id = 2;
SELECT species_id FROM species WHERE name = 'Rosa';

UPDATE species SET name = 'Cacto da casa' WHERE species_id = 1;
UPDATE species SET waterFrequency = 4 WHERE species_id = 2;
UPDATE species SET sunFrequency = 7 WHERE species_id = 3;

DELETE FROM species WHERE species_id = 1;
DELETE FROM species WHERE species_id = 2;
DELETE FROM species WHERE species_id = 3;

----------------- Plant -----------------
INSERT INTO plant (photo, name, dataOfCreation, lastWatering, lastSunBath, lastAttention, place_id, species) VALUES ('photo1', 'Cacto da casa', '2020-01-01', '2023-10-07', '2023-10-07', '2023-10-07', 1, 1);
INSERT INTO plant (photo, name, dataOfCreation, lastWatering, lastSunBath, lastAttention, place_id, species) VALUES ('photo2', 'Suculenta da casa', '2020-10-05', '2023-10-19', '2023-10-20', '2023-10-20', 2, 2);
INSERT INTO plant (photo, name, dataOfCreation, lastWatering, lastSunBath, lastAttention, place_id, species) VALUES ('photo3', 'Rosa da casa', '2020-10-05', '2023-10-19', '2023-10-20', '2023-10-20', 3, 3);

SELECT photo, name, dataOfCreation, lastWatering, lastSunBath, lastAttention, place_id, species FROM plant WHERE plant_id = 1;
SELECT photo, name, dataOfCreation, lastWatering, lastSunBath, lastAttention FROM plant WHERE plant_id = 2;
SELECT plant_id FROM plant WHERE name = 'Rosa da casa';

UPDATE plant SET photo = 'photo4' WHERE plant_id = 1;
UPDATE plant SET name = 'Suculenta da casa' WHERE plant_id = 2;
UPDATE plant SET dataOfCreation = '2020-10-05' WHERE plant_id = 3;

DELETE FROM plant WHERE plant_id = 1;
DELETE FROM plant WHERE plant_id = 2;
DELETE FROM plant WHERE plant_id = 3;

