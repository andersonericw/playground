#!/usr/bin/ruby

before = Time.now
[0,1].each do |i|
  sleep 1
end
Process.waitall
after = Time.now
delta = (after - before) * 1000.0
puts "Single-threaded: #{delta} milliseconds"

before = Time.now
[0,1].each do |i|
  fork do
    sleep 1
  end

end
Process.waitall
after = Time.now
delta = (after - before) * 1000.0
puts "Multi-threaded: #{delta} milliseconds"
