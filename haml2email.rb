require 'premailer'

page = ARGF.argv.first

html = `haml views/#{page}.haml`

css = `sass views/#{page}.sass`

File.open("views/#{page}.css", "w") do |fout|
  fout.puts css
end

File.open("views/#{page}.html", "w") do |fout|
  fout.puts html
end

premailer = Premailer.new("views/#{page}.html", :warn_level => Premailer::Warnings::RISKY)

File.open("tmp/output.txt", "w") do |fout|
  fout.puts premailer.to_plain_text
end

File.open("tmp/output.html", "w") do |fout|
  fout.puts premailer.to_inline_css
end

haml = `html2haml tmp/output.html`

File.open("views/#{page}_email.haml", "w") do |fout|
  fout.puts haml
end

# Output any CSS warnings
premailer.warnings.each do |w|
  puts "#{w[:message]} (#{w[:level]}) may not render properly in #{w[:clients]}"
end

puts "---------------------------------------------\n\n"
puts haml
puts "\n---------------------------------------------"
