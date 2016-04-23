#!/usr/bin/env ruby

require 'yaml'

#
# Converts hours and minutes as 'xh ym' to seconds.

def hm2s(hm)
  if hm =~ /\d+h +\d+m/
    h, m = /(\d+)h +(\d+)m/.match(hm).captures
    h.to_i * 60 * 60 + m.to_i * 60
  elsif hm =~ /\d+m/
    m = /(\d+)m/.match(hm).captures
    m[0].to_i * 60
  elsif hm =~ /\d+h/
    h = /(\d+)h/.match(hm).captures
    h[0].to_i * 60 * 60
  else
    raise "hm2s: illegal input #{hm}"
  end
end

##
# Get data from a YAML-formatted data file.

def get_data(data_file)
  begin
    YAML::load_file(data_file)
  rescue => e
    raise "Error reading #{data_file}: #{e}"
  end
end

##
# Process a list of data from a file.

def process(data_file)
  data = get_data(data_file)
  data['times'].each do |t|
    puts hm2s(t)
  end
end

if $0 == __FILE__
  raise ArgumentError, "Usage: #{$0} <filename>" unless ARGV.length == 1
  process(ARGV[0])
end
