app: datagrip
app: sequel_pro
-
select: "SELECT "
star: "* "
from: "FROM "
select star from: "SELECT * FROM "
where: "WHERE "
order by: "ORDER BY "
descending: " DESC"
ascending: " ASC"
is not null: " IS NOT NULL"
is null: " IS NULL"
inner join:
    insert("INNER JOIN  ON ")
    key(left)
    key(left)
    key(left)
    key(left)
join: insert("JOIN ")
on: insert("ON ")
using:
    insert("USING ()")
    key(left)
