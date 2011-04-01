first_run = true
def run_test_suite
  puts ("rspec spec/")
  result = %x[rspec --color spec/]
  send_growl_notification(result)
  puts result
end

def parse_results(result_string)
  error = false
  if result_hash = (result_string.match(/([1-9]+) example[s]*, ([0-9]+) failure[s]*/))
    result_hash = result_hash.captures
  else
    error = true
    result_hash = [0,0]
  end
  {:failures => result_hash[1], :number_tests => result_hash[0], :error => error}
end

def send_growl_notification(result_text)
  result_hash = parse_results(result_text)
  title = "Test Results"
  unless result_hash[:error]
    message = "#{result_hash[:number_tests]} examples, #{result_hash[:failures]} failures"
  else
    message = "An Error Occured in your code" 
  end
  system(%Q[growlnotify -t "#{title}" -m "#{message}"])
end

#watch the lib directory and if anything changes run the whole test suite
watch('lib/(.*)\.rb'){ run_test_suite} 
watch('spec/*') {run_test_suite}

#run the full test suite when watchr is first run
if first_run 
  run_test_suite
  first_run = false
end
