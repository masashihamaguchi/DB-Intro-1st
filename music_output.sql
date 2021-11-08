-- music_output.sql
-- @author Masashi Hamaguchi


--  output tables to as csv
\copy companies to 'output/companies.csv' with csv header null as ''
\copy artists to 'output/artists.csv' with csv header null as ''
\copy members to 'output/members.csv' with csv header null as ''
\copy cd to 'output/cd.csv' with csv header null as ''
\copy tracks to 'output/tracks.csv' with csv header null as ''
\copy plays to 'output/plays.csv' with csv header null as ''
