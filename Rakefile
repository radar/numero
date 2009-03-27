%w[rubygems rake hoe].each { |f| require f }

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.new('numero', "0.0.1") do |p|
  p.developer('Ryan Bigg', 'FIXME email')
  p.changes              = ""
  p.summary              = "Do more, write more"
end

require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# task :default => [:spec, :features]
