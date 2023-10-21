CREATE TABLE "user"(
    user_id SERIAL NOT NULL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE place(
    place_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    geocode VARCHAR(100) NOT NULL,
    temperature INT NOT NULL,
    humidity INT NOT NULL,
    user_id INT NOT NULL REFERENCES "user"(user_id)
);

CREATE TABLE species(
    species_id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    waterFrequency INT NOT NULL,
    sunFrequency INT NOT NULL,
    attentionFrequency INT NOT NULL,
    description VARCHAR(100) NOT NULL
);

CREATE TABLE plant(
    plant_id SERIAL NOT NULL PRIMARY KEY,
    photo VARCHAR(100) NOT NULL,
    name VARCHAR(50) NOT NULL,
    dateOfCreation DATE NOT NULL,
    lastWatering TIMESTAMP NOT NULL,
    lastSunBath TIMESTAMP NOT NULL,
    lastAttention TIMESTAMP NOT NULL,
    place_id INT NOT NULL REFERENCES place(place_id),
    species INT NOT NULL REFERENCES species(species_id)
);