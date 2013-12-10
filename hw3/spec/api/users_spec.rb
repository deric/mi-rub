require 'spec_helper'

describe Movies::UsersAPI do

  it 'shows list of users, default limit is 20' do
    with_api(Movies::App) do
      get_request(:path => '/v1/users') do |c|
        resp = JSON.parse(c.response)
        expect(resp.size).to eq 20
      end
    end
  end

  it 'list of users supports limit' do
    with_api(Movies::App) do
      get_request(:path => '/v1/users?limit=10') do |c|
        resp = JSON.parse(c.response)
        expect(resp.size).to eq 10
      end
    end
  end

  it 'users supports limit and offset - occupation after 20. position' do
    with_api(Movies::App) do
      get_request(:path => '/v1/users?limit=10&offset=30') do |c|
        resp = JSON.parse(c.response)
        expect(resp.size).to eq 10
        expect(resp.first['age']).to eq 24
        expect(resp.first['gender']).to eq 'M'
      end
    end
  end

  it 'finds user by an id' do
    with_api(Movies::App) do
      get_request(:path => '/v1/users/45') do |c|
        resp = JSON.parse(c.response)
        expect(resp['age']).to eq 29
        expect(resp['gender']).to eq 'M'
        expect(resp['zip']).to eq '50233'
      end
    end
  end

end