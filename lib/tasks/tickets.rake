namespace :tickets do
  desc 'Releases all tickets older tahn 15 minutes'
  task :release do
    Event.relase
  end
end
