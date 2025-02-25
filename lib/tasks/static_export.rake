namespace :rails_static_export do
  desc "Export Rails app as a static site"
  task :export => :environment do
    # Create directory for static output
    FileUtils.mkdir_p("public/static")
    
    # Copy all compiled assets to static directory
    if File.directory?("public/assets")
      FileUtils.mkdir_p("public/static/assets")
      FileUtils.cp_r(Dir.glob("public/assets/*"), "public/static/assets/")
    end
    
    # Copy index file
    system("bundle exec rails runner 'File.write(\"public/static/index.html\", ApplicationController.render(template: \"home/index\"))'")
    
    # Fix asset paths in the generated HTML to remove leading slashes
    if File.exist?("public/static/index.html")
      content = File.read("public/static/index.html")
      # Replace /assets/ with assets/ in href and src attributes
      fixed_content = content.gsub(/(href|src)=["']\/assets\//, '\1="assets/')
      File.write("public/static/index.html", fixed_content)
    end
    
    puts "Static site exported to public/static directory with fixed asset paths"
  end
end