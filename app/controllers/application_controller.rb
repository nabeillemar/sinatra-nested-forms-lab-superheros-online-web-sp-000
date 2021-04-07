require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }


    get '/' do
        erb :super_hero
    end

    post '/team' do

        @team = Team.new(params[:team])
        params[:team][:heroes].each do |details|
            Hero.new(details)
        end

        @heroes = Hero.all
        @first_hero = @heroes.first
        @second_hero = @heroes[1]
        @third_hero = @heroes.last

        erb :team


    end


end
