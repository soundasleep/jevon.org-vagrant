Given(/^I visit ([^: ]+):(\d+) with hostname ([^ ]+)$/) do |ip, port, hostname|
  @temp = # File.expand_path("temp.html")
  @temp = Tempfile.new(hostname).path
  File.unlink(@temp) if File.exist?(@temp)
  system("curl --fail --silent -H \"Host: #{hostname}\" http://#{ip}:#{port} > #{@temp}")
end

Then(/^I should receive "([^"]*)"$/) do |text|
  content = File.read(@temp)
  expect(content).to include(text)
end
