select
  DISTINCT name
from
  athletes
where
  id in (
    SELECT
      a.id
    from
      records r
      LEFT join games g on g.id = r.game_id
      LEFT join athletes a on a.id = r.athlete_id
      -- LEFT join teams t on t.id = r.team_id
    where
      medal is not null
      and g.year >= 2000
    group by
      1
    having
      count(DISTINCT team_id) >= 2
  )
order by
  1 asc
