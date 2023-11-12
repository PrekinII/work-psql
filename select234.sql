--Task 2
SELECT track_name, duration 
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks);

SELECT track_name
FROM Tracks
WHERE duration > 3.5

SELECT collection_name
FROM music_collections
WHERE year_of_collection BETWEEN '20180101' AND '20210101'

SELECT musician_name
FROM musicians
WHERE cardinality(regexp_split_to_array(musician_name,' ')) = 1
 
SELECT track_name
FROM TRACKS
WHERE track_name SIMILAR TO '%(My|my|мой|Мой)%'

--Task 3

SELECT genre_name, COUNT(musician_id) --Количество исполнителей в каждом жанре.
FROM Music_genres RIGHT JOIN musicians_genres
	ON Music_genres.genre_name_id = musicians_genres.genre_name_id
GROUP BY genre_name

SELECT COUNT(track_name) tracks_2019_2020 --Количество треков, вошедших в альбомы 2019–2020 годов.
FROM tracks RIGHT JOIN albums
	ON tracks.album_id = albums.album_id
	WHERE year_of_issue BETWEEN '20190101' AND '20210101'
	
SELECT album_name, ROUND(AVG(duration), 2) --Средняя продолжительность треков по каждому альбому.
FROM albums RIGHT JOIN tracks
	ON albums.album_id = tracks.album_id
GROUP BY album_name

SELECT musician_name --Все исполнители, которые не выпустили альбомы в 2020 году. (Ощущение, что можно было проще)
FROM musicians 
	INNER JOIN albums_musicians
		USING (musician_id) --Здесь я узнал, что есть USING
GROUP BY musician_id
HAVING musician_id != (
	SELECT musician_id
	FROM albums_musicians RIGHT JOIN albums
		USING(album_id)
	WHERE year_of_issue = '20190101')

SELECT collection_name --Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
FROM music_collections 
	INNER JOIN collections_tracks
		USING (music_collection_id)
	INNER JOIN tracks
		USING (tracks_id)
	INNER JOIN albums_musicians
		USING (album_id)
	INNER JOIN musicians
		USING (musician_id)
WHERE musician_id = (
	SELECT musician_id
	FROM musicians
	WHERE musician_name = 'Чайф'
	)
GROUP BY collection_name 

--Task 4

SELECT album_name --Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
FROM albums
	INNER JOIN albums_musicians
		USING (album_id)
	INNER JOIN musicians_genres
		USING (musician_id)
WHERE musician_id = (SELECT musician_id
		FROM (SELECT musician_id, COUNT(genre_name_id) AS x
			FROM musicians_genres
			GROUP BY musician_id) multi_gen
		WHERE x > 1) 
GROUP BY album_name
						
SELECT track_name --Наименования треков, которые не входят в сборники. 
FROM tracks
	FULL JOIN collections_tracks
		USING (tracks_id)
	FULL JOIN music_collections
		USING (music_collection_id)
WHERE music_collection_id IS NULL

SELECT musician_name --Исполнители самого короткого трека
FROM tracks
	INNER JOIN albums_musicians
		USING (album_id) 
	INNER JOIN musicians
		USING (musician_id)
WHERE duration = (SELECT MIN(duration) FROM tracks)

SELECT album_name --Названия альбомов, содержащих наименьшее количество треков
FROM (SELECT album_id, album_name, COUNT(tracks_id) AS x
	FROM albums
		INNER JOIN tracks
			USING (album_id)
	GROUP BY album_name, album_id) min_count_tracks
WHERE x = (SELECT min(x) FROM (SELECT album_id, album_name, COUNT(tracks_id) AS x
	FROM albums
		INNER JOIN tracks
			USING (album_id)
	GROUP BY album_name, album_id) min_count_tracks)

