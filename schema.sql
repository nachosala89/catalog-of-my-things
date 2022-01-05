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

