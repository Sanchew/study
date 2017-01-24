#!/usr/bin/ruby

base = Dir.pwd


def fzip(dir)
 Dir.foreach(dir) do |f|
  next unless f != "." && f != ".."
  file = "#{dir}/#{f}"
  if Dir.exists?(file)
   fzip(file) 
  else
   puts "mv \"#{File::basename(file)}\" \"#{File::basename(dir,'.imageset')}@2x.png\"\n" if file[/png$/]
  end 
 end
end

Dir.foreach("#{base}") do |f|
 fn = "#{f}/Images.xcassets"
 fzip(fn) if Dir.exists?(fn)
end
