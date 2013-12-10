require 'spec_helper'
require 'open-uri'

describe Movies::MoviesAPI do

  it 'shows list of movies, default limit is 20' do
    with_api(Movies::App) do
      get_request(:path => '/v1/movies') do |c|
        resp = JSON.parse(c.response)
        expect(resp.size).to eq 20
      end
    end
  end

  it 'list of movies supports limit' do
    with_api(Movies::App) do
      get_request(:path => '/v1/movies?limit=10') do |c|
        resp = JSON.parse(c.response)
        expect(resp.size).to eq 10
      end
    end
  end

  it 'movies supports limit and offset - movies after 100. position' do
    with_api(Movies::App) do
      get_request(:path => '/v1/movies?limit=10&offset=100') do |c|
        resp = JSON.parse(c.response)
        expect(resp.size).to eq 10
        expect(resp.first['title']).to eq 'Heavy Metal (1981)'
      end
    end
  end

  it 'shows list of movies, first one is Toy Story' do
    with_api(Movies::App) do
      get_request(:path => '/v1/movies') do |c|
        resp = JSON.parse(c.response)
        expect(resp.first['title']).to eq 'Toy Story (1995)'
      end
    end
  end

  it 'finds movie by id' do
    with_api(Movies::App) do
      get_request(:path => '/v1/movies/show/110') do |c|
        resp = JSON.parse(c.response)
        expect(resp['title']).to eq 'Operation Dumbo Drop (1995)'
      end
    end
  end

  it 'finds movie by genre' do
    with_api(Movies::App) do
      get_request(:path => '/v1/movies/genre/action') do |c|
        resp = JSON.parse(c.response)
        resp.size.should > 20
        resp.each do |m|
          expect(Movie.find(m['id']).is_genre?('action')).to eq true
        end
      end
    end
  end

  context 'search' do
    it 'finds Star Wars' do
      with_api(Movies::App) do
        get_request(:path => "/v1/movies/search/#{URI::encode('star wars')}") do |c|
          resp = JSON.parse(c.response)
          expect(resp.first['title']).to eq 'Star Wars (1977)'
        end
      end
    end

    it 'search for all Batman movies' do
      with_api(Movies::App) do
        get_request(:path => "/v1/movies/search/#{URI::encode('batman')}") do |c|
          resp = JSON.parse(c.response)
          movies = resp.map {|m| m['title']}
          expect(movies.include?('Batman Forever (1995)')).to eq true
          expect(movies.include?('Batman Returns (1992)')).to eq true
          expect(movies.include?('Batman & Robin (1997)')).to eq true
          expect(movies.include?('Batman (1989)')).to eq true
        end
      end
    end

    context 'ratings' do
      it 'knows Toy Story rating' do
        with_api(Movies::App) do
          get_request(:path => "/v1/movies/rating/1") do |c|
            resp = JSON.parse(c.response)
            expect(resp.first['title']).to eq 'Toy Story (1995)'
            expect(resp.first['rating_avg']).to eq '3.8929503916449086'
            expect(resp.first['movie_id']).to eq 1
          end
        end
      end

      it 'knows The Game rating' do
        with_api(Movies::App) do
          get_request(:path => "/v1/movies/rating/333") do |c|
            resp = JSON.parse(c.response)
            expect(resp.first['title']).to eq 'Game, The (1997)'
            expect(resp.first['rating_avg']).to eq '3.5893719806763285'
            expect(resp.first['movie_id']).to eq 333
          end
        end
      end
    end

    it 'top movies' do
      with_api(Movies::App) do
        get_request(:path => "/v1/movies/top?limit=8") do |c|
          resp = JSON.parse(c.response)
          movies = resp.map {|m| m['title']}
          expect(resp.size).to eq 8
          expect(movies.include?('Santa with Muscles (1996)')).to eq true
          expect(movies.include?("Someone Else's America (1995)")).to eq true
          expect(movies.include?("Saint of Fort Washington, The (1993)")).to eq true
          expect(movies.include?("Prefontaine (1997)")).to eq true
          expect(movies.include?('Marlene Dietrich: Shadow and Light (1996) ')).to eq true
          expect(movies.include?('Entertaining Angels: The Dorothy Day Story (1996)')).to eq true
          expect(movies.include?('They Made Me a Criminal (1939)')).to eq true
          expect(movies.include?('Star Kid (1997)')).to eq true
        end
      end
    end

  end
end
