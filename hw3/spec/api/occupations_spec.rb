require 'spec_helper'

describe Movies::OccupationAPI do

  it 'shows list of occupations, default limit is 20' do
    with_api(Movies::App) do
      get_request(:path => '/v1/occupations') do |c|
        resp = JSON.parse(c.response)
        expect(resp.size).to eq 20
      end
    end
  end

  it 'list of occupations supports limit' do
    with_api(Movies::App) do
      get_request(:path => '/v1/occupations?limit=10') do |c|
        resp = JSON.parse(c.response)
        expect(resp.size).to eq 10
      end
    end
  end

  it 'occupations supports limit and offset - occupation after 20. position' do
    with_api(Movies::App) do
      get_request(:path => '/v1/occupations?limit=10&offset=20') do |c|
        resp = JSON.parse(c.response)
        expect(resp.first['title']).to eq 'writer'
      end
    end
  end

  it 'finds occupation by an id' do
    with_api(Movies::App) do
      get_request(:path => '/v1/occupations/21') do |c|
        resp = JSON.parse(c.response)
        expect(resp['title']).to eq 'writer'
      end
    end
  end

  it 'finds all users with given occupation -- artists' do
    with_api(Movies::App) do
      get_request(:path => '/v1/occupations/2/users') do |c|
        resp = JSON.parse(c.response)
        resp.size.should > 20
        resp.each do |o|
          expect(o['occupation_id']).to eq 2
        end
      end
    end
  end


end