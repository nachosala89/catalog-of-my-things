--Create table items
CREATE Table items (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id)
);

--Create table genres
CREATE Table genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY(id)
);

-- Add Foreign key to items table
ALTER TABLE items
ADD COLUMN genre_id INT,
ADD FOREIGN KEY(genre_id)
REFERENCES genres(id);

-- Create table music_albums
CREATE Table music_albums (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  PRIMARY KEY (id)
);

-- Create table label
CREATE Table labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);

-- Create table books
CREATE Table books (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  genre_id INT,
  label_id INT,
  CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(id),
  CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES labels(id)
);
