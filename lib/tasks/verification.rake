namespace :verification do
  puts "running migrations"
  task :secret => :environment do
    Auth::Verification.create(secret_key: 19936505, name: 'Driver App')
    Auth::Verification.create(secret_key: 19877588, name: 'Web App')
    Auth::Verification.create(secret_key: 18571947, name: 'User App')
  end
end