
namespace :db do
  desc "loads database configuration in for other tasks to run"
  task :load_config do
    ActiveRecord::Base.configurations = db_conf

    # drop and create need to be performed with a connection to the 'postgres' (system) database
    ActiveRecord::Base.establish_connection db_conf[env].merge('database' => 'postgres',
                                                                       'schema_search_path' => 'public')
  end

  desc "creates and migrates your database"
  task :setup => :load_config do
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
  end

  task :connect do
    puts "environment: #{env}"
    ActiveRecord::Base.configurations = db_conf
    ActiveRecord::Base.establish_connection db_conf[env]
  end

  desc "migrate your database"
  task :migrate => :connect do
    ActiveRecord::Migrator.migrate(
      ActiveRecord::Migrator.migrations_paths,
      ENV["VERSION"] ? ENV["VERSION"].to_i : nil
    )
  end

  desc 'Drops the database'
  task :drop => :load_config do
    ActiveRecord::Base.connection.drop_database db_conf[env]['database']
  end
  desc 'Creates the database'
  task :create => :load_config do
    ActiveRecord::Base.connection.create_database db_conf[env]['database']
  end

end

def env
  ENV['RACK_ENV'] ? ENV['RACK_ENV'] : 'development'
end

def db_conf
  config = YAML.load(ERB.new(File.read('config/database.yml')).result)
end