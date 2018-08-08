$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')
require 'yaml'
require 'json'
require 'rake'
require 'rake/testtask'
require 'bundler'
require 'tofuwiki'

Bundler::GemHelper.install_tasks


desc "release and build and push new website"
task :push => [:release, :web]

desc "Bumps version number up one and git commits"
task :bump do
  basefile = "lib/tofuwiki.rb"
  file = File.read(basefile)
  oldver = file[/VERSION = '(\d.\d.\d)'/, 1]
  newver_i = oldver.gsub(".", '').to_i + 1
  newver = ("%.3d" % newver_i).split(//).join('.')
  puts oldver
  puts newver
  puts "Bumping version: #{oldver} => #{newver}"
  newfile = file.gsub("VERSION = '#{oldver}'", "VERSION = '#{newver}'") 
  File.open(basefile, 'w') {|f| f.write newfile}
  `git commit -am 'Bump'`
end

desc "build and push website"
task :web => :build_webpage do
  puts "Building and pushing website"
  Dir.chdir "." do
    `scp out/tofuwiki.html root@aliceinwire.net:/var/www/public/software/`
    `rsync -avz out/images-tofuwiki root@aliceinwire.net:/var/www/public/software/`
    `rsync -avz out/stylesheets root@aliceinwire.net:/var/www/public/software/`
    `rsync -avz out/lightbox2 root@aliceinwire.net:/var/www/public/software/`
  end
  `open http://danielchoi.com/software/tofuwiki.html`
end

desc "build webpage"
task :build_webpage do
  `cp README.markdown ../project-webpages/src/tofuwiki.README.markdown`
  Dir.chdir "../project-webpages" do
    puts `ruby gen.rb tofuwiki #{tofuwiki::VERSION}`
    #`open out/tofuwiki.html`
  end
end

desc "Run tests"
task :test do 
  $:.unshift File.expand_path("test")
  MiniTest::Unit.autorun
end

task :default => :test


