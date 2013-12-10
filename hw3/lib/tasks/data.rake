

def download(url, dest)
  File.open(dest, 'wb') do |fo|
    fo.write open(url).read
  end
  puts "downloaded #{url}"
end

def mkdir(dir)
  Dir.mkdir(dir) unless File.exists?(dir)
end

def extract(target, tmp)
  puts "target: #{target}"
  temp_dir = File.expand_path File.join(File.dirname(__FILE__), tmp)
  if File.exists?(target)
    Zip::File.open(target) do |zf|
      zf.each do |e|
        zf.extract(e.name, File.join(temp_dir.to_s, e.name))
      end
    end
  else
    exit("file #{target} not found")
  end
end

def invoke(task, *args)
  Rake::Task[task].invoke(*args)
end

def read_content(path, file)
  data = "#{path}/#{file}"
  IO.read(data).force_encoding("ISO-8859-1").encode("utf-8", replace: nil)
end

def import_data(data, model, mapping, separator)
  data.split("\n").each do |line|
    row = line.split(separator)
    t = model.new
    mapping.each_with_index do |key, idx|
      t.send("#{key}=", row[idx])
    end
    t.save!
  end
  import_msg(model)
end

def import_msg(model)
  puts "imported #{model.count} #{model.to_s.downcase.pluralize}"
end

namespace :data do
  desc 'downloads basic 100k dabaset'
  task :fetch do
    dir, dataset = 'tmp', 'ml-100k'
    Dir.mkdir(dir) unless File.exists?(dir)
    target = 'tmp/data.zip'
    download "http://files.grouplens.org/datasets/movielens/#{dataset}.zip", target unless File.exists?(target)
    extract(target, tmp) unless Dir.exists?("#{dir}/#{dataset}")
    invoke('data:import')
  end

  desc 'import data from tmp dir'
  task :import do
    dir, dataset = 'tmp', 'ml-100k'
    invoke('db:connect')
    path = "#{dir}/#{dataset}"
    ['movie', 'occupation', 'user', 'rating'].each do |table|
      invoke("data:#{table.pluralize}", path) unless table.capitalize.constantize.count > 0
    end
  end

  task :movies, :path  do |t, args|
    content = read_content(args[:path], 'u.item')
    # TODO parse content and import to database
  end

  task :occupations, :path  do |t, args|
    content = read_content(args[:path], 'u.occupation')
    # TODO parse content and import to database
  end

  task :users, :path  do |t, args|
    content = read_content(args[:path], 'u.user')
    # TODO parse content and import to database
  end

  task :ratings, :path  do |t, args|
    content = read_content(args[:path], 'u1.base')
    # TODO parse content and import to database
  end
end
