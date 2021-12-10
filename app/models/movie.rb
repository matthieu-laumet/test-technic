class Movie < ApplicationRecord
    # include AlgoliaSearch
  include PgSearch::Model

  # algoliasearch do
  #   attributes :title, :alternative_titles, :year, :score, :rating, :actors, :genre
  #   searchableAttributes ['title', 'alternative_titles', 'actors', 'genre', 'score', 'rating']
  # end

  pg_search_scope :global_search,
    against: [ :title, :alternative_titles, :year, :score, :rating, :actors, :genre ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
