module Songify
  class GenreRepo

    def self.all(db)
      # Other code should not have to deal with the PG:Result.
      # Therefore, convert the results into a plain array.
      db.exec("SELECT * FROM genres").to_a
    end

    def self.find(db, genre_id)

      sql_all_albums_for_genre = %Q[
        SELECT
          a.id,
          a.title
        FROM album_genres ag
        JOIN albums a
        ON a.id = ag.album_id
        WHERE ag.genre_id = $1
      ]

      genre = db.exec("SELECT * FROM genres WHERE id=$1", [genre_id]).first
      return genre if genre.nil?

      genre['albums'] = db.exec(sql_all_albums_for_genre, [genre_id]).to_a
      genre
    end

    def self.save(db, genre_data)
      if genre_data['id']
        result = db.exec("UPDATE genres SET name = $2 WHERE id = $1", [genre_data['id'], genre_data['name']])
        self.find(db, genre_data['id'])
      else
        raise "name is required." if genre_data['name'].nil? || genre_data['name'] == ''

        result = db.exec("INSERT INTO genres (name) VALUES ($1) RETURNING id", [genre_data['name']])
        genre_data['id'] = result.entries.first['id']
        genre_data
      end
    end

    def self.destroy(db, genre_id)
      db.exec("DELETE FROM album_genres WHERE genre_id = $1", [genre_id])
      db.exec("DELETE FROM genres WHERE id = $1", [genre_id])
    end

  end
end
