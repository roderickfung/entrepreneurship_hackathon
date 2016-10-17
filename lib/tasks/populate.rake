namespace :db do
	desc "Erase and fill database"
	task populate: :environment do
		require 'faker'
		Rake::Task['db:reset'].invoke

  end
end
