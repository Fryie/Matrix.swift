require 'colored'
require 'open3'

guard :shell do
  directories %w(Sources Tests)

  watch /^(.*).swift$/ do |m|

    puts "Modified: #{m[1]}"
    puts "Running tests..."

    output = ""
    errors = ""
    exit_status = Open3.popen3("swift test") do |stdin, stdout, stderr, wait_thr|
      stdin.close
      output << stdout.read
      errors << stderr.read
      wait_thr.value
    end

    puts output.yellow

    if exit_status.success?
      puts errors.cyan
      puts "Passed".green
    else
      puts errors.red
      puts "Failed".red
    end
  end
end
