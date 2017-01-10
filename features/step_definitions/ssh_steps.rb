require "net/ssh"

@ssh_encryption = nil

def ssh_options(port)
  options = {
    port: port.to_i,
    password: "passwords are ignored",
    auth_methods: ["publickey"],
  }
  if @ssh_encryption
    options.merge!({ encryption: @ssh_encryption })
  end
  options
end

Given(/^I try to SSH on ([^: ]+):(\d+) as ([^ ]+) using ([^ ]+) cipher$/) do |ip, port, username, cipher|
  @ssh_encryption = [cipher]
  steps %Q{
    Given I try to SSH on #{ip}:#{port} as #{username}
  }
end

Given(/^I try to SSH on ([^: ]+):(\d+) as ([^ ]+)$/) do |ip, port, username|
  @ssh_success = @ssh_failed = false
  begin
    Net::SSH.start(ip, username, ssh_options(port)) do
      @ssh_success = true
    end
  rescue Net::SSH::AuthenticationFailed => e
    @ssh_failed = e
  rescue Errno::ECONNREFUSED => e
    @ssh_failed = e
  rescue Net::SSH::Exception => e
    @ssh_failed = e
  end
end

Then(/^I should be able to SSH successfully$/) do
  expect(@ssh_success).to eq(true), "SSH failed with #{@ssh_failed}"
  expect(@ssh_failed).to eq(false), "SSH passed but also failed with #{@ssh_failed}"
end

Then(/^I should not be able to SSH successfully$/) do
  expect(@ssh_success).to_not eq(true), "SSH unexpectedly passed"
  expect(@ssh_failed).to_not eq(false), "SSH unexpectedly passed with #{@ssh_failed}"
end

Then(/^the SSH error should contain "([^"]*)"$/) do |message|
  expect(@ssh_failed.message).to include(message)
end
