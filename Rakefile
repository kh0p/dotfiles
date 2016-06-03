task default: %[update]

# Settings 
home    = "/home/USERNAME"            # your home directory
config  = "/home/USERNAME/.config"    # directory for your config files


desc "Build all configuration files."
task :build do
  system "mkdir " + config unless File.exist?(config) and File.directory?(config)
end

desc "Build awesome wm configuration files."
task :build_awesome do
  if File.exist?(config + "/awesome") and File.directory?(config + "/awesome")
    puts "'/home/pyoon/.config/awesome' directory exists"
  end
  
  if File.zero?(config + "/awesome")
    puts "'/home/pyoon/.config/awesome' directory is empty"
  end

  puts "Cloning awesome-copycats into directory with yours awesome config files"
  system "git clone --recursive https://github.com/copycat-killer/awesome-copycats.git " + config
  
  if File.exist?(config + "/awesome/rc.lua")
    puts "Removing old rc.lua file"
    system "rm " + config + "/awesome/rc.lua"
  end
  
  puts "Moving new rc.lua file into awesome config directory"
  system "mv awesome rc.lua"
  system "cp rc.lua " + config + "/awesome/rc.lua"
end
