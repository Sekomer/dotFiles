#!/usr/bin/env ruby

array = ARGV

__package__ = array.first 
v2_execute = "pip2 install #{__package__}"
v3_execute = "pip3 install #{__package__}"

exe_arr = [v2_execute, v3_execute]

if array.size > 1
	puts "[!ERROR!]"
	puts "Too many arguments !"
elsif array.size < 1
	puts "[!ERROR!]"
	puts "Enter the package name !"
else
	(0..2).each do |n|
		puts "Downloading for Python#{n + 2}\n"
		
		3.times {`printf "."`}
		
		puts ""
		puts `#{exe_arr[n]}`
		puts ""	
	end
end		
	
	
