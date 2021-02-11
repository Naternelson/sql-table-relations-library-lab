def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books 
  WHERE series_id = (SELECT MIN(id) FROM series)
  ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
  ORDER BY motto
  LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) FROM characters
  GROUP BY species
  ORDER BY COUNT(species) DESC
  LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM series
  INNER JOIN subgenres ON subgenre_id = subgenres.id
  INNER JOIN authors ON author_id = authors.id"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM characteR_books
  INNER JOIN books ON book_id = books.id
  INNER JOIN characters ON character_id = characters.id
  INNER JOIN series ON series_id = series.id
  GROUP BY characters.species
  ORDER BY COUNT(characters.species)
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(book_id) FROM character_books
  INNER JOIN characters ON character_id = characters.id
  GROUP BY characters.name
  ORDER BY COUNT(book_id) DESC, characters.name;"
end
