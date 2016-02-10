require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'haml'
#require 'pony'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	haml :contacts
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	# хеш
	hh = { 	:username => 'Введите имя',
			:phone => 'Введите телефон',
			:datetime => 'Введите дату и время' }

	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ''
		return erb :visit
	end

	erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"

end

post '/contacts' do 
require 'pony'
Pony.mail(
  :name => params[:name],
  :mail => params[:mail],
  :body => params[:body],
  :to => 'drabada@gmail.com',
  :subject => params[:name] + " has contacted you",
  :body => params[:message],
  :port => '587',
  :via => :smtp,
  :via_options => { 
    :address              => 'smtp.gmail.com', 
    :port                 => '587', 
    :enable_starttls_auto => true, 
    :user_name            => 'drabada', 
    :password             => '31337q!@Q', 
    :authentication       => :plain, 
    :domain               => 'localhost.localdomain'
  })
redirect '/' 
end

# раздел контактс
# отправитть почту через gmail 206 http://stackoverflow.com/questions/2068148/contact-form-in-ruby-sinatra-and-haml