require 'sqlite3'
require 'sinatra/base'
require './lib/models/student.rb'


# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base
    get '/' do
      "hello world!"
    end

    get '/students' do
      @students = Student.all
      erb :students
    end


    get '/students/:id' do
      @student = Student.find(params[:id])
      erb :profile, :layout => false
    end

    # Student.all.each do |student|
    #   get "/students/#{student.name.gsub(" ","")}" do
    #     @student = student
    #     erb :profile, :layout => false
    #   end
    # end

  end
end

