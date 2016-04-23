#!/usr/bin/env ruby

##
# Converts hours and minutes to seconds.

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

if $0 == __FILE__
  raise ArgumentError, "Usage: #{$0} xh ym" unless ARGV.length > 0
  puts hm2s(ARGV.join(' '))
end
