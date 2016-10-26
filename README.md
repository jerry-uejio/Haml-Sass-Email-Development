Sinatra server for quick development of haml/sass emails.

To start server, run: ruby email_dev.rb

Create a folder named views for your haml and sass files.

Visit localhost:4567/view_name.html

Place images in a folder named public.

When you are ready, run: ruby haml2email.rb [name of haml file (without extension)]

You will find your email friendly inline styled haml file in views/[name of page]_email.haml
