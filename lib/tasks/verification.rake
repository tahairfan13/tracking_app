namespace :verification do
  puts "running migrations"
  task :secret => :environment do
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Driverapp_development', user_type: 0)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Driverapp_staging', user_type: 1)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Driverapp_production', user_type: 2)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Webapp_development', user_type: 3)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Webapp_staging', user_type: 4)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Webapp_production', user_type: 5)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Userapp_development', user_type: 6)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Userapp_staging', user_type: 7)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Userapp_production', user_type: 8)
  end
end