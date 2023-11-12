--Task 1

INSERT INTO music_genres(genre_name)
VALUES ('Heavy metal'),
	('Breakbeat'),
	('Rock')
ON CONFLICT DO NOTHING; 

INSERT INTO Musicians(musician_name)
VALUES ('Metallica'),
	('Prodigy'),
	('Chemical brothers'),
	('Чайф')
ON CONFLICT DO NOTHING;

INSERT INTO Musicians_genres(genre_name_id, musician_id)
VALUES (1, 1),
	(2, 2),
	(2, 3),
	(3, 4),
	(1, 4)
ON CONFLICT DO NOTHING;

INSERT INTO Albums(album_name, year_of_issue)
VALUES ('Metallica', '19910101'),
	('ReLoad', '19970101'),
	('Master of puppets', '19860101'),
	('The Fat of the Land', '19970101'),
	('Experience', '19920101'),
	('Music for the Jilted', '19920101'),
	('Exit Planet Dust', '19950101'),
	('Dig Your Own Hole', '19970101'),
	('Push the Button', '20050101'),
	('Дети гор', '19930101'),
	('Шекогали', '19980101'),
	('Оранжевое настроение', '19960101'),
	('No geography', '20190101')
ON CONFLICT DO NOTHING;

INSERT INTO Albums_musicians(musician_id, album_id)
VALUES (1, 1),
	(1, 2),
	(1, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(3, 7),
	(3, 8),
	(3, 9),
	(4, 10),
	(4, 11),
	(4, 12),
	(3, 77)
ON CONFLICT DO NOTHING;

INSERT INTO Tracks(album_id, track_name, duration)
VALUES (1, 'The Unforgiven', 6.27),
	(1, 'Don’t Tread on Me', 4.00),
	(1, 'The Struggle Within', 3.54),
	(1, 'The God That Failed', 5.09),
	(1, 'Holier Than Thou', 3.48),
	(1, 'Nothing Else Matters', 6.29),
	(3, 'Master of Puppets', 8.35),
	(3, 'Leper Messiah', 5.40),
	(3, 'The Thing That Should Not Be', 6.36),
	(3, 'Disposable Heroes', 8.17),
	(2, 'The Memory Remains', 4.39),
	(2, 'Bad Seed', 4.05),
	(2, 'The Unforgiven II', 6.36),
	(2, 'Where the Wild Things Are', 6.54),
	(4, 'Fuel My Fire', 4.19),
	(4, 'Mindfields', 5.40),
	(4, 'Narayan', 9.06),
	(4, 'Diesel Power', 4.18),
	(4, 'Climbatize', 6.38),
	(4, 'Firestarter', 4.40),
	(5, 'Weather Experience',8.05),
	(5, 'Death of the Prodigy Dancers', 3.43),
	(5, 'Jericho', 3.44),
	(5, 'Hyperspeed (G-force Part 2)', 5.15),
	(5, 'Everybody in the Place', 4.11),
	(6, 'Their Law', 6.41),
	(6, 'The Heat (The Energy)', 4.28),
	(6, 'One Love', 3.53),
	(6, 'Speedway (Theme From Fastlane)', 8.56),
	(6, 'Poison', 6.42),
	(6, 'The Narcotic Suite: Skylined', 5.58),
	(7, 'Fuck Up Beats', 1.26),
	(7, 'Chico is Groove', 4.49),
	(7, 'One Too Many Mornings', 4.13),
	(8, 'Dig Your Own Hole', 5.27),
	(8, 'Do not Stop the Rock', 4.50),
	(8, 'Setting Sun', 5.29),
	(8, 'It Doesn’t Matter', 6.14),
	(9, 'Close Your Eyes', 6.14),
	(9, 'Shake Break Bounce', 3.45),
	(9, 'Galvanize', 6.34),
	(9, 'Come Inside', 4.46),
	(10, 'Мама, она больше не может', 5.54),
	(10, 'Зажги огонь в моих глазах', 4.16),
	(11, 'Я рисую на окне (Шкала)', 3.58),
	(11, 'Завяжи мне глаза', 2.53),
	(12, 'Шаляй-валяй', 2.58),
	(12, 'Белая ворона', 3.02),
	(77, 'Got to Keep On', 5.17),
	(77, 'Gravity Drops', 4.31)
ON CONFLICT DO NOTHING;

INSERT INTO Music_collections(collection_name, year_of_collection)
VALUES ('BoB Metallica', '20210101'),
	('BoB Prodigy', '20220101'),
	('Чайф 15', '20000101'),
	('Чайф 25', '20100101')
ON CONFLICT DO NOTHING;

INSERT INTO Collections_tracks(tracks_id, music_collection_id)
VALUES (1, 1),
	(2, 1),
	(3, 1),
	(16, 2),
	(18, 2),
	(20, 2),
	(43, 3),
	(44, 3),
	(45, 3),
	(45, 4),
	(46, 4),
	(47, 4);

