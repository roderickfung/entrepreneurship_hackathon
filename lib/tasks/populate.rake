namespace :db do
	desc "Erase and fill database"
	task populate: :environment do
		require 'faker'
		Rake::Task['db:reset'].invoke

		@user = User.create!(
			first_name: 'Roderick',
			last_name: 'Fung',
			email: 'admin@admin.com',
			password: '123456',
			password_confirmation: '123456',
			admin: true,
			activated: true,
		)

		@event = Event.create!(
			title: 'Startup Hacks 2017',
			description: Faker::Lorem.paragraph(5),
			start_date: Date.today + 3.months,
			end_date: Date.today + 6.months
		)

		5.times do |x|
			@speaker = Speaker.create!(
				first_name: Faker::Name.first_name,
				last_name: Faker::Name.last_name,
				title: Faker::Name.title,
				email: Faker::Internet.email,
				description: Faker::Lorem.paragraph(3),
				event_id: 1
			)
		end

		6.times do |x|
			@sponsor = Sponsor.create!(
				company_name: Faker::Company.name,
				description: Faker::Lorem.paragraph(5),
				representative: Faker::Name.name,
				event_id: 1
			)
		end
  end
end
