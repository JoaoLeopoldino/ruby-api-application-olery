# frozen_string_literal: true

desc 'Seeds the db'

task :seed do
  require_relative '../config/application'

  puts 'Generating data..'
  ['Company 1', 'Company 2', 'Company 3'].each do |name|
    DB[:contracts].insert({ name: name, start_date: Time.now })
  end

  ['User 1', 'User 2', 'User 3'].each do |name|
    DB[:users].insert({ name: name, email: "#{name}@email.com", contract_id: DB[:contracts].all[rand(3)][:id] })
  end

  ['Group 1', 'Group 2', 'Group 3'].each do |name|
    DB[:groups].insert({ name: name })
  end

  ['Hilton', 'Victoria', 'Las Vegas'].each do |name|
    DB[:hotels].insert({ name: name })
  end

  DB[:group_subscriptions].insert({ group_id: DB[:groups].first[:id], contract_id: DB[:contracts].all.last[:id] })
  DB[:group_subscriptions].insert({ group_id: DB[:groups].all.last[:id], contract_id: DB[:contracts].first[:id] })
  DB[:group_subscriptions].insert({ group_id: DB[:groups].all.last[:id], contract_id: DB[:contracts].all.last[:id] })
  
  DB[:hotel_groups].insert({ hotel_id: DB[:hotels].first[:id], group_id: DB[:groups].all.first[:id] })
  DB[:hotel_groups].insert({ hotel_id: DB[:hotels].all.last[:id], group_id: DB[:groups].all.last[:id] })

end