namespace :verification do
  puts "running migrations"
  task :secret => :environment do
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Driver App', user_type: 0)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'Web App', user_type: 1)
    Auth::Project.create(secret_key: SecureRandom.hex(10), name: 'User App', user_type: 2)
  end
end