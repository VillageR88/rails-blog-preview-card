class StaticExporter
  def self.export_site
    # Create directory for static output
    FileUtils.mkdir_p("public/static")
    
    # Copy all compiled assets to static output directory
    if File.directory?("public/assets")
      FileUtils.mkdir_p("public/static/assets")
      FileUtils.cp_r(Dir.glob("public/assets/*"), "public/static/assets/")
    end
    
    # Write index page
    index_content = ApplicationController.render(template: "home/index")
    
    # Fix asset paths in the generated HTML to remove leading slashes
    index_content = index_content.gsub(/(href|src)=["']\/assets\//, '\1="assets/')
    
    File.write("public/static/index.html", index_content)
    
    puts "Static site exported to public/static directory with fixed asset paths"
  end
end
