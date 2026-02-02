-- ALTER DATA TYPE

CREATE type myaddress AS(
	city VARCHAR(50),
	country VARCHAR(20)
);

-- rename 
ALTER TYPE myaddress RENAME TO my_address;

-- change the owner
ALTER TYPE my_address OWNER TO postgres;

-- change the schema
ALTER TYPE my_address SET SCHEMA test_scm;

-- add attribute
ALTER TYPE test_scm.my_address ADD ATTRIBUTE is_enable VARCHAR(30);


-- ALter ENUM data type
-------------------------------------------------------------------------------------------
CREATE TYPE color AS ENUM ('Red','Blue','Yellow');

ALTER TYPE color RENAME VALUE 'Red'  TO 'Redd';

SELECT enum_range(NULL::color);

ALTER TYPE color ADD VALUE 'Grey' AFTER 'Redd';
SELECT enum_range(NULL::color);
ALTER TYPE color ADD VALUE 'Orange' BEFORE 'Blue';



CREATE TYPE motion AS ENUM ('done','running','working','standing');

CREATE TABLE jobs(
	job_id SERIAL PRIMARY KEY,
	job motion
);

INSERT INTO jobs (job)
VALUES ('done'), ('running') , ('running') , ('standing');

SELECT * FROM jobs;

UPDATE jobs SET job = 'working' WHERE job = 'running';

ALTER TYPE motion RENAME TO motion_old;

CREATE TYPE motion AS ENUM ('done','running','working');

UPDATE jobs SET job = 'done' WHERE job = 'standing';


ALTER TABLE jobs ALTER COLUMN job TYPE motion USING job::text::motion;
--- if any of old entry of enum should not exist in table before assigning it a 
--- a new enum , if new enum consist all old values then it's okay

DROP TYPE motion_old;


DO
$$
BEGIN
  IF NOT EXISTS (
    SELECT *
    FROM pg_type typ
    INNER JOIN pg_namespace nsp
      ON nsp.oid = typ.typnamespace
    WHERE nsp.nspname = current_schema()
      AND typ.typname = 'ai'
  ) THEN

    CREATE TYPE ai AS (
      a text,
      i integer
    );

  END IF;
END;
$$
LANGUAGE plpgsql;