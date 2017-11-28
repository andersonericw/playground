#!/usr/bin/ruby

#Do a single threaded run, timing each iteration of the array [0,1], doing two iterations because of two elements
before = Time.now
[0,1].each do |i|
  sleep 1
end
after = Time.now
delta = (after - before) * 1000.0
puts "Single-threaded: #{delta} milliseconds" #Should be 1000 miliseconds X number of elements in the array (2)

#Do a multi threaded run, timing each iterationg of the array [0,1], doing two iterations because of the two elements
before = Time.now
[0,1].each do |i|
  fork do #Instead of running each operation sequentially, run each process in a different thread
    sleep 1
  end

end
Process.waitall
after = Time.now
delta = (after - before) * 1000.0
puts "Multi-threaded: #{delta} milliseconds" #Should be 1000 miliseconds X 1 while array length < CPU Core count
