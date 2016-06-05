task default: %[update]

# Settings 
home    = "/home/USERNAME"            # your home directory
config  = "/home/USERNAME/.config"    # directory for your config files


desc "Makes necessary initial actions."
task :init do
  system "mkdir " + config unless File.exist?(config) and File.directory?(config)
end

desc "Builds everything up. Use it if you are making first build"
task :build_all => [:init, build:dots, build:awesome, build:vim] do
  puts "Building has been finished."
end

# All specific build tasks
namespace :build do
  desc "Build awesome wm configuration files."
  task :awesome do
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
  
  desc "Doing things necessary to make vimrc work"
  task :vim do
    puts "Moving .vimirc to home (or prefered) directory"
    system "cp .vimrc " + home + "/.vimrc"
    
    unless File.exist?(home + "/vim/autoload/plug.vim")
      puts "Downloading plug.vim and putting it into autoload"
      system "curl -fLo " + home + "/.vim/autoload/plug.vim --create-dirs \
              http://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    end 
    
    puts "Starting up vim just to install packages!"
    system "vim"
  end
  
  desc "Copying dotfiles to the home directory"
  task :dots do
    dots=['.Xdefaults', '.gitconfig', '.bashrc']
    dots.each do |dot|
      puts "Moving " + dot + " to home directory"
      system "cp " + dot + " " + home + "/" + dot
    end
    puts "All dot files are copied"
  end
end

desc "Installation of ls++ (colorized ls on steroids)"
task :lsplusplus do
  puts "Running `cpan Term::ExtendedColor`"
  system "cpan Term::ExtendedColor"

  unless File.exist?(home + "/Repo/ls--") and File.directory?(home + "/Repo/ls--")
    puts "Cloning ls++ repository from github"
    system "git clone https://github.com/trapd00r/ls--.git"
  end

  puts "Entering the ls++ directory"
  system "cd " + home + "/Repo/ls--"

  puts "Executing Perl Makefile"
  system "perl Makefile.PL"

  puts "Final make of the ls++ (Requires root password)"
  system "make && su -c 'make install'"
  
  unless File.exist?(home + "/.ls++.conf")
    puts "Copying the ls++.conf file to home directory"
    system "cp ls++.conf " + home + "/.ls++.conf"
  end
end
