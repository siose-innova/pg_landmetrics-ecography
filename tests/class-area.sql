
SET auto_explain.log_min_duration TO 1;

PREPARE class_area (text) AS
  SELECT gh.id AS id, gh.precision AS precision, c_totalarea(lulc.geom, lulc."class"::text)
  FROM gh_u as gh, polygons_u AS lulc
  WHERE gh.id = $1 AND st_intersects(gh.geom,lulc.geom) GROUP BY 1, 2;

DO $$
DECLARE 
  t_row gh_u%rowtype;
BEGIN
  FOR t_row in SELECT * FROM gh_u order by id LOOP
    EXECUTE format('EXECUTE class_area(%L);', t_row.id);
  END LOOP;
END
$$;

DEALLOCATE class_area;
