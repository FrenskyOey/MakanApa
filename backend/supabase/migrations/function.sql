-- ============================================================
-- Makan Apa - Function
-- query function
-- ============================================================

-- Enable Trigram extension for text similarity
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Create a function to search for multiple ingredients at once
CREATE OR REPLACE FUNCTION search_ingredients_fuzzy(ingredient_names text[])
RETURNS TABLE (
  searched_name text,
  found_id bigint,
  found_name text,
  found_unit unittype,
  found_is_hidden boolean,
  similarity real
) 
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    s.term AS searched_name,
    b.id AS found_id,
    b.name AS found_name,
    b.unit AS found_unit,
    b.basket_hidden AS found_is_hidden,
    -- Compare lowercase versions for scoring
    similarity(LOWER(b.name), LOWER(s.term)) AS similarity
  FROM 
    unnest(ingredient_names) AS s(term)
  LEFT JOIN LATERAL (
    SELECT id, name, unit , basket_hidden
    FROM food."Bahan"
    -- Compare lowercase versions for matching
    WHERE LOWER(name) % LOWER(s.term) 
    ORDER BY similarity(LOWER(name), LOWER(s.term)) DESC
    LIMIT 1
  ) b ON true;
END;
$$;



