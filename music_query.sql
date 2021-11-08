-- music_query.sql
-- @author Masashi Hamaguchi


-- select records
select
  cd.id                   as  id,
  cd.title                as  タイトル,
  a.name                  as  アーティスト,
  cd.year                 as  リリース年,
  cd.price                as  定価,
  c.name                  as  レーベル,
  country.country_region_name     as  国・地域名

from cd

left outer join artists a on a.id = cd.artist_id
left outer join companies c on c.id = cd.company_id
left outer join countries country on country.country_code = c.country_code

order by cd.id asc;


select
  a.id                    as  id,
  a.name                  as  アーティスト,
  g_a.name                as  グループ名,
  array_to_string(array(select unnest(array_agg(m_a.name)) order by 1), ', ')  as  メンバー,
  c.name                  as  所属事務所

from artists a

left outer join members m on m.group_artist_id = a.id
left outer join artists m_a on m_a.id = m.member_artist_id
left outer join members g_m on g_m.member_artist_id = a.id
left outer join artists g_a on g_a.id = g_m.group_artist_id
left outer join companies c on c.id = a.company_id

where a.company_id is not null

group by a.id, g_a.id, c.id
order by a.id asc;


select
  t.id                          as  id,
  cd.title                      as  アルバム,
  m.title                       as  曲名,
  a.name                        as  アーティスト,
  array_to_string(array(select distinct unnest(array_agg(c_a.name)) order by 1 asc), ', ')  as  作詞,
  array_to_string(array(select distinct unnest(array_agg(l_a.name)) order by 1 asc), ', ')  as  作曲,
  t.length                      as  時間,
  c.name                        as  レーベル,
  country.country_region_name   as  国・地域名

from tracks t

-- 楽曲情報
left outer join music m on m.id = t.music_id
-- 作詞・作曲情報
left outer join composers composer on composer.music_id = m.id
left outer join artists c_a on c_a.id = composer.artist_id
left outer join lyricists lyricist on lyricist.music_id = m.id
left outer join artists l_a on l_a.id = lyricist.artist_id
-- トラック情報
left outer join plays p on p.track_id = t.id
-- アルバム情報
left outer join cd on cd.id = p.cd_id
left outer join artists a on a.id = cd.artist_id
left outer join companies c on c.id = cd.company_id
left outer join countries country on country.country_code = c.country_code

-- where a.name = 'Mr.Children'

group by t.id, cd.id, m.id, a.id, c.id, country.id

order by cd.id asc, t.track_no asc;


select
  cd.title                      as  CDタイトル,
  t.track_no                    as  No,
  m.title                       as  タイトル,
  a.name                        as  アーティスト,
  t.length                      as  時間

from cd

left outer join plays p on p.cd_id = cd.id
right outer join tracks t on t.id = p.track_id
left outer join music m on m.id = t.music_id
left outer join artists a on a.id = p.artist_id

where cd.title = 'SUPERMARKET FANTASY'

order by t.track_no asc;
