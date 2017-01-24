base = Dir.pwd

def tinypng(png,dir)
 full="#{Dir.pwd}/#{png.split(" ").join("\\ ").split("(").join("\\(").split(")").join("\\)")}"
 target="#{Dir.pwd}/StyleWe/Resources/#{File::basename(dir,'.imageset')}@2x.png"
 #%x(mv #{full} #{target.split(" ").join("\\ ").split("(").join("\\(").split(")").join("\\)})
 system "cp #{full} #{target.split(" ").join("\\ ")}"
end


def fzip(dir)
 Dir.foreach(dir) do |f|
  next unless f != "." && f != ".."
  file = "#{dir}/#{f}"
  if Dir.exists?(file)
   fzip(file) 
  else
   tinypng(file,dir) if file[/png$/] 
  end 
 end
end

Dir.foreach("#{base}") do |f|
 fn = "#{f}/Images.xcassets"
 fzip(fn) if Dir.exists?(fn)
end
