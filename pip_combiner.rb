#!/usr/bin/env ruby

array = ARGV

__package__ = array.first 
v2_execute = "pip2 install #{__package__}"
v3_execute = "pip3 install #{__package__}"

exe_arr = [v2_execute, v3_execute]

if array.size != 1
	if array.size > 1
		puts "[!ERROR!]"
		puts "Too many arguments !"
	else array.size < 1
		puts "[!ERROR!]"
		puts "Enter the package name !"
	end
else
	(0...2).each do |n|
		puts "Downloading for Python#{n + 2}\n"
		
		3.times {
			print '.'
			sleep(0.5)
		}
		
		puts ""
		puts `#{exe_arr[n]}`
		puts ""	
	end
end		
	
	
