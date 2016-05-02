require 'open-uri'
require 'rubygems'
# require 'rest-client'

wiki_url = 'http://en.wikipedia.org/'
wiki_file = "wiki-page.html"

# Exercise 1
# File.open(wiki_file, "w") {|wiki| wiki.write(RestClient.get(wiki_url).read)}

# Exercise 2
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
puts open(url).readline
local_fname = "hamlet.txt"
File.open(local_fname, "w") {|file| file.write(open(url).read)}

array = []
File.open(local_fname,"r") do |file|
  array = file.readlines
end

array.each_with_index do |line,index|
  puts line if (index+1) % 42 == 0
end


# Exercise 3
Dir.glob('../../../../Assignments/**/*.*').sort_by {|file_name| File.size(file_name)}.reverse[0..9].each { |name| puts "#{name}: #{File.size(name)}"}

# Exercise 4
hash = Dir.glob("../../../../Assignments/**/*.*").inject({}) do |hsh, fname|
   ext = File.basename(fname).split('.')[-1].to_s.downcase
   hsh[ext] ||= [0,0]
   hsh[ext][0] += 1
   hsh[ext][1] += File.size(fname)   
   hsh
end               
File.open("file-analysis.txt", "w") do |f|
   hash.each do |arr|
     txt = arr.flatten.join("\t")
      f.puts txt
      puts txt
   end
end


# .read takes in the information
# .write saves the information in a different file