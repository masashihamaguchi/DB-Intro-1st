-- music_init.sql
-- @author Masashi Hamaguchi


-- drop all tables
drop table if exists plays;
drop table if exists tracks;
drop table if exists lyricists;
drop table if exists composers;
drop table if exists music;
drop table if exists cd;
drop table if exists members;
drop table if exists artists;
drop table if exists companies;
drop table if exists countries;


-- create tables
-- Country
create table countries (
  id serial primary key not null,
  country_region_name varchar not null,
  iso_3166_1 varchar not null,
  country_code varchar unique not null,
  three_letters varchar not null,
  two_letters varchar not null,
  place varchar not null,
  each_administrative_division varchar not null
);

-- Company
create table companies (
  id serial primary key not null,
  name varchar not null,
  country_code varchar references countries(country_code) not null
);

-- Artist
create table artists (
  id serial primary key not null,
  name varchar not null,
  company_id int references companies(id)
);

-- Member
create table members (
  id serial primary key not null,
  group_artist_id int references artists(id) not null,
  member_artist_id int references artists(id) not null
);

-- CD
create table cd (
  id serial primary key not null,
  title varchar not null,
  artist_id int references artists(id) not null,
  price int not null,
  year int not null,
  company_id int references companies(id) not null
);

-- Music
create table music (
  id serial primary key not null,
  title varchar not null
);

-- Composer
create table composers (
  id serial primary key not null,
  music_id int references music(id) not null,
  artist_id int references artists(id) not null
);

-- Lyricist
create table lyricists (
  id serial primary key not null,
  music_id int references music(id) not null,
  artist_id int references artists(id) not null
);

-- Track
create table tracks (
  id serial primary key not null,
  track_no int not null,
  music_id int references music(id) not null,
  length time not null
);

-- Play
create table plays (
  id serial primary key not null,
  cd_id int references cd(id) not null,
  track_id int references tracks(id) not null,
  artist_id int references artists(id) not null,
  role varchar
);


-- insert records
-- Country
\copy countries from 'csv/countries.csv' with csv

-- Company
insert into companies (name, country_code) values ('株式会社エンジン', '392');
insert into companies (name, country_code) values ('トイズファクトリー', '392');
insert into companies (name, country_code) values ('株式会社10969', '392');
insert into companies (name, country_code) values ('株式会社A-Sketch', '392');
insert into companies (name, country_code) values ('株式会社ニューカム', '392');
insert into companies (name, country_code) values ('株式会社ソニー・ミュージックエンタテインメント', '392');

-- Artist
insert into artists (name, company_id) values ('Mr.Children', 1);
insert into artists (name, company_id) values ('桜井 和寿', 1);
insert into artists (name, company_id) values ('田原 健一', 1);
insert into artists (name, company_id) values ('中川 敬輔', 1);
insert into artists (name, company_id) values ('鈴木 英哉', 1);
insert into artists (name, company_id) values ('ONE OK ROCK', 3);
insert into artists (name, company_id) values ('Taka', 3);
insert into artists (name, company_id) values ('Toru', 3);
insert into artists (name, company_id) values ('Ryota', 3);
insert into artists (name, company_id) values ('Tomoya', 3);
insert into artists (name, company_id) values ('西野カナ', 5);

insert into artists (name) values ('Dan Lancaster');
insert into artists (name) values ('Mike Duce');
insert into artists (name) values ('Jamil Kazmi');
insert into artists (name) values ('Derek Fuhrmann');
insert into artists (name) values ('Liam O''Donnell');
insert into artists (name) values ('Jason“Poo Bear”Boyd');
insert into artists (name) values ('Jared Gutstadt');
insert into artists (name) values ('CJ Baran');
insert into artists (name) values ('Ben Romans');
insert into artists (name) values ('David Pramik');
insert into artists (name) values ('Michael Jade');
insert into artists (name) values ('Pete Nappi');
insert into artists (name) values ('Janee“Jin Jin”Bennett');
insert into artists (name) values ('Joshua Lewis Golden');
insert into artists (name) values ('Ethan Thompson');
insert into artists (name) values ('Kyle Moorman');
insert into artists (name) values ('Nick Long');
insert into artists (name) values ('Colin Brittain');
insert into artists (name) values ('Dan Book');
insert into artists (name) values ('Brian Howes');
insert into artists (name) values ('Mark Crew');
insert into artists (name) values ('Charlie Snyder');
insert into artists (name) values ('FAST LANE');
insert into artists (name) values ('GIORGIO 13 CANCEMI');
insert into artists (name) values ('MATS LIE SKARE');
insert into artists (name) values ('Marimo Wamoto');
insert into artists (name) values ('Kazuhiko.M');
insert into artists (name) values ('WISE');
insert into artists (name) values ('小倉しんこう');
insert into artists (name) values ('佐伯ユウスケ');
insert into artists (name) values ('KASUMI');
insert into artists (name) values ('想天坊');
insert into artists (name) values ('MINMI');
insert into artists (name) values ('Jeff Miyahara');
insert into artists (name) values ('Kenji“JINO”Hino');
insert into artists (name) values ('Masa Kohama');
insert into artists (name) values ('DJ Mass');
insert into artists (name) values ('GRP');
insert into artists (name) values ('etsuco');
insert into artists (name) values ('持山 翔子');
insert into artists (name) values ('中村 亮');
insert into artists (name) values ('Yoo Nakamura');

-- Member
insert into members (group_artist_id, member_artist_id) values (1, 2);
insert into members (group_artist_id, member_artist_id) values (1, 3);
insert into members (group_artist_id, member_artist_id) values (1, 4);
insert into members (group_artist_id, member_artist_id) values (1, 5);
insert into members (group_artist_id, member_artist_id) values (6, 7);
insert into members (group_artist_id, member_artist_id) values (6, 8);
insert into members (group_artist_id, member_artist_id) values (6, 9);
insert into members (group_artist_id, member_artist_id) values (6, 10);

-- CD
insert into cd (title, artist_id, price, year, company_id) values ('SUPERMARKET FANTASY', 1, 3204, 2008, 2);
insert into cd (title, artist_id, price, year, company_id) values ('Eye of the Storm', 6, 3300, 2019, 4);
insert into cd (title, artist_id, price, year, company_id) values ('Love Collection 〜mint〜', 11, 3204, 2013, 6);

-- Music
insert into music (title) values ('終末のコンフィデンスソング');
insert into music (title) values ('HANABI');
insert into music (title) values ('エソラ');
insert into music (title) values ('声');
insert into music (title) values ('少年');
insert into music (title) values ('旅立ちの唄');
insert into music (title) values ('口がすべって');
insert into music (title) values ('水上バス');
insert into music (title) values ('東京');
insert into music (title) values ('ロックンロール');
insert into music (title) values ('羊、吠える');
insert into music (title) values ('風と星とメビウスの輪');
insert into music (title) values ('GIFT');
insert into music (title) values ('花の匂い');
insert into music (title) values ('Eye of the Storm');
insert into music (title) values ('Stand Out Fit In');
insert into music (title) values ('Head High');
insert into music (title) values ('Grow Old Die Young');
insert into music (title) values ('Push Back');
insert into music (title) values ('Wasted Nights');
insert into music (title) values ('Change');
insert into music (title) values ('Letting Go');
insert into music (title) values ('Worst in Me');
insert into music (title) values ('In the Stars (feat. Kiiara)');
insert into music (title) values ('Giants');
insert into music (title) values ('Can''t Wait');
insert into music (title) values ('The Last Time');
insert into music (title) values ('Believe');
insert into music (title) values ('私たち');
insert into music (title) values ('会いたくて 会いたくて');
insert into music (title) values ('if');
insert into music (title) values ('Distance');
insert into music (title) values ('glowly days');
insert into music (title) values ('MAKE UP');
insert into music (title) values ('遠くても feat.WISE');
insert into music (title) values ('Dear…');
insert into music (title) values ('たとえ どんなに…');
insert into music (title) values ('Be Strong');
insert into music (title) values ('Summer Girl feat.MINMI');
insert into music (title) values ('Sweet Dreams');
insert into music (title) values ('HAPPY HAPPY');
insert into music (title) values ('Always');

-- Track
insert into tracks (track_no, music_id, length) values (1, 1, '00:05:11');
insert into tracks (track_no, music_id, length) values (2, 2, '00:05:43');
insert into tracks (track_no, music_id, length) values (3, 3, '00:05:06');
insert into tracks (track_no, music_id, length) values (4, 4, '00:04:17');
insert into tracks (track_no, music_id, length) values (5, 5, '00:05:38');
insert into tracks (track_no, music_id, length) values (6, 6, '00:05:37');
insert into tracks (track_no, music_id, length) values (7, 7, '00:04:13');
insert into tracks (track_no, music_id, length) values (8, 8, '00:05:05');
insert into tracks (track_no, music_id, length) values (9, 9, '00:04:37');
insert into tracks (track_no, music_id, length) values (10, 10, '00:03:31');
insert into tracks (track_no, music_id, length) values (11, 11, '00:04:40');
insert into tracks (track_no, music_id, length) values (12, 12, '00:05:17');
insert into tracks (track_no, music_id, length) values (13, 13, '00:05:44');
insert into tracks (track_no, music_id, length) values (14, 14, '00:05:10');
insert into tracks (track_no, music_id, length) values (1, 15, '00:03:03');
insert into tracks (track_no, music_id, length) values (2, 16, '00:03:34');
insert into tracks (track_no, music_id, length) values (3, 17, '00:03:27');
insert into tracks (track_no, music_id, length) values (4, 18, '00:03:26');
insert into tracks (track_no, music_id, length) values (5, 19, '00:03:29');
insert into tracks (track_no, music_id, length) values (6, 20, '00:03:44');
insert into tracks (track_no, music_id, length) values (7, 21, '00:02:56');
insert into tracks (track_no, music_id, length) values (8, 22, '03:20:00');
insert into tracks (track_no, music_id, length) values (9, 23, '00:03:09');
insert into tracks (track_no, music_id, length) values (10, 24, '00:03:24');
insert into tracks (track_no, music_id, length) values (11, 25, '00:02:43');
insert into tracks (track_no, music_id, length) values (12, 26, '00:03:19');
insert into tracks (track_no, music_id, length) values (13, 27, '00:02:50');
insert into tracks (track_no, music_id, length) values (1, 28, '00:03:51');
insert into tracks (track_no, music_id, length) values (2, 29, '00:05:48');
insert into tracks (track_no, music_id, length) values (3, 30, '00:04:42');
insert into tracks (track_no, music_id, length) values (4, 31, '00:04:42');
insert into tracks (track_no, music_id, length) values (5, 32, '00:03:48');
insert into tracks (track_no, music_id, length) values (6, 33, '00:03:43');
insert into tracks (track_no, music_id, length) values (7, 34, '00:04:21');
insert into tracks (track_no, music_id, length) values (8, 35, '00:05:43');
insert into tracks (track_no, music_id, length) values (9, 36, '00:05:30');
insert into tracks (track_no, music_id, length) values (10, 37, '00:05:33');
insert into tracks (track_no, music_id, length) values (11, 38, '00:04:45');
insert into tracks (track_no, music_id, length) values (12, 39, '00:03:49');
insert into tracks (track_no, music_id, length) values (13, 40, '00:04:55');
insert into tracks (track_no, music_id, length) values (14, 41, '00:04:43');
insert into tracks (track_no, music_id, length) values (15, 42, '00:05:18');

-- Play
insert into plays (cd_id, track_id, artist_id) values (1, 1, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 2, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 3, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 4, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 5, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 6, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 7, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 8, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 9, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 10, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 11, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 12, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 13, 1);
insert into plays (cd_id, track_id, artist_id) values (1, 14, 1);
insert into plays (cd_id, track_id, artist_id) values (2, 15, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 16, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 17, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 18, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 19, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 20, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 21, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 22, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 23, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 24, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 25, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 26, 6);
insert into plays (cd_id, track_id, artist_id) values (2, 27, 6);
insert into plays (cd_id, track_id, artist_id) values (3, 28, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 29, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 30, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 31, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 32, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 33, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 34, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 35, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 36, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 37, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 38, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 39, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 40, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 41, 11);
insert into plays (cd_id, track_id, artist_id) values (3, 42, 11);

-- Composer
\copy composers from 'csv/composers.csv' with csv

-- Lyricist
\copy lyricists from 'csv/lyricists.csv' with csv


-- select records
\i music_query.sql

-- output records
\i music_output.sql
