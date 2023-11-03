CREATE TABLE IF NOT EXISTS music_genres (
	genre_name_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musicians (
	musician_id SERIAL PRIMARY KEY,
	musician_name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musicians_genres (
	musician_id INTEGER REFERENCES Musicians(musician_id),
	genre_name_id INTEGER REFERENCES music_genres(genre_name_id),
	CONSTRAINT musician_genre_id PRIMARY KEY (musician_id, genre_name_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(30) NOT NULL,
	year_of_issue DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums_musicians (
	musician_id INTEGER REFERENCES Musicians(musician_id),
	album_id INTEGER REFERENCES Albums(album_id),
	CONSTRAINT albums_musicians_id PRIMARY KEY (musician_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	tracks_id SERIAL PRIMARY KEY,
	duration DECIMAL(4, 2) NOT NULL,
	track_name VARCHAR(30) NOT NULL,
	album_id INTEGER UNIQUE REFERENCES Albums(album_id)   
);

CREATE TABLE IF NOT EXISTS Music_collections (
	music_collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(30) NOT NULL,
	year_of_collection DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections_tracks (
	tracks_id INTEGER REFERENCES Tracks(tracks_id),
	music_collection_id INTEGER REFERENCES Music_collections(music_collection_id),
	CONSTRAINT collections_tracks_id PRIMARY KEY (tracks_id, music_collection_id)
);