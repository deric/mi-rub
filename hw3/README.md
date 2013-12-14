# Movie API


## Postgresql database

### Debian/Ubuntu

 * dev library:

```
    sudo apt-get install libpq-dev
```

 * database:

```
    sudo apt-get install postgresql
```

## Vytvoření databáze

    $ sudo -s
    $ su postgres
    $ psql
    psql (9.1.10)

    postgres=# CREATE USER movies WITH PASSWORD 'm0vi3zzrulezz!';
      CREATE ROLE
    postgres=#  ALTER USER movies CREATEDB;
      ALTER ROLE
    postgres=#  CREATE DATABASE movies_development;
      CREATE DATABASE
    postgres=# GRANT ALL PRIVILEGES ON DATABASE movies_development TO movies;

přihlašovací údaje k databázi naleznete v `config/database.yml`

V rámci tohoto úkolu budeme používat jenom databázi `movies_development`.

## Příprava projektu

Nejdříve je potřeba nainstalovat závislosti (ze složky projektu)

    $ bundle install

## Migrace databáze

Pro přístup k databázi používáme ActiveRecord (který je jednou z komponent z Rails, viz [dokumentace Rails](http://guides.rubyonrails.org/active_record_basics.html)). V tomto projektu nemáme k dispozici generátory (scaffold), takže budeme vytvářet migrace ručně.

V adresáři `db/migrate/` vytvořte soubory které začínají číselným id, např. `001_create_movies.rb`


Databázové typy v migracích

        |   Rails    |  postgresql  |
        |------------|:-------------|
        |:binary     | bytea        |
        |:boolean    | boolean      |
        |:date       | date         |
        |:datetime   | timestamp    |
        |:decimal    | decimal      |
        |:float      | float        |
        |:integer    | integer      |
        |:string     | *            |
        |:text       | text         |
        |:time       | time         |
        |:timestamp  | timestamp    |


Samotná migrace používá následující DSL, jedná se je třídu, která dědí od `ActiveRecord::Migration`

```ruby
class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      # kazdy radek je jeden sloupec v tabulce
    end
  end

end
```

Je potřeba vytvořit následující modely:

  * movie
  * occupation
  * user
  * rating

Do databáze budeme nahrávat data z [MovieLens datasetu](http://files.grouplens.org/datasets/movielens/ml-100k-README.txt)

    u.data     -- The full u data set, 100000 ratings by 943 users on 1682 items.
                  Each user has rated at least 20 movies.  Users and items are
                  numbered consecutively from 1.  The data is randomly
                  ordered. This is a tab separated list of
                 user id | item id | rating | timestamp.
                  The time stamps are unix seconds since 1/1/1970 UTC

    u.item     -- Information about the items (movies); this is a tab separated
                  list of
                  movie id | movie title | release date | video release date |
                  IMDb URL | unknown | Action | Adventure | Animation |
                  Children's | Comedy | Crime | Documentary | Drama | Fantasy |
                  Film-Noir | Horror | Musical | Mystery | Romance | Sci-Fi |
                  Thriller | War | Western |
                  The last 19 fields are the genres, a 1 indicates the movie
                  is of that genre, a 0 indicates it is not; movies can be in
                  several genres at once.
                  The movie ids are the ones used in the u.data data set.

    u.genre    -- A list of the genres.

    u.user     -- Demographic information about the users; this is a tab
                  separated list of
                  user id | age | gender | occupation | zip code
                  The user ids are the ones used in the u.data data set.



## Import dat


pokud máte správně nastavený přístup k databázi a vytvořené migrace, můžeme spustit aktualizovat databázi:

    $ bundle exec rake db:migrate


Pro import používáme `rake` úlohy, které naleznete v `lib/tasks/*`. Je potřeba doplnit načítání dat z textových souborů a ukládání záznamů do databáze.


Samotný import dat:

    $ bundle exec rake data:fetch

## Webserver

Webserver na otestování funkčnosti v prohlížeči spustíme pomocí příkazu:

    $ foreman start

Následně můžeme zkontrolovat naši aplikaci

    http://localhost:5000/status