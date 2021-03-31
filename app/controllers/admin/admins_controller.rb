class Admin::AdminsController < ApplicationController
    http_basic_authenticate_with name: 'yugesh', password: '123456'

    def dashboard
    end 
end