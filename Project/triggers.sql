CREATE OR REPLACE FUNCTION update_activities() RETURNS TRIGGER AS $$
BEGIN
    UPDATE Plant
    SET lastWatering = NEW.dateOfCreation,
        lastSunBath = NEW.dateOfCreation,
        lastAttention = NEW.dateOfCreation
    WHERE plant_id = NEW.plant_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_activities
AFTER INSERT ON plant
FOR EACH ROW
EXECUTE FUNCTION update_activities();

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE OR REPLACE FUNCTION hash_password()
RETURNS TRIGGER AS $$
BEGIN
    NEW.password := crypt(NEW.password, gen_salt('bf'));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER hash_password_trigger
BEFORE INSERT OR UPDATE ON "user"
FOR EACH ROW
EXECUTE FUNCTION hash_password();