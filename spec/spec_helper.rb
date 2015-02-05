require "vips8"

puts "testing ruby-vips #{VIPS::VERSION}"
puts "linked against libvips #{VIPS::LIB_VERSION}"

require "rspec"

Dir["#{File.expand_path('../support', __FILE__)}/*.rb"].each do |file|
  require file
end

RSpec.configure do |config|
  config.include Spec::Path
  config.include Spec::Helpers

  config.before :all do
    reset_formats!
    reset_working!
  end

  config.before :each do
    reset_working!
  end

  config.filter_run_excluding :vips_lib_version => lambda{ |ver|
    return !Spec::Helpers.match_vips_version(ver)
  }

  # Use this to print vips debug info before exit
  # config.after :suite do
  #    GC.start
  #    Vips::print_all
  # end

end
