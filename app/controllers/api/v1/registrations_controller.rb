class Api::V1::RegistrationsController < ApplicationController
    skip_before_action :verify_user
    def new
        @registration = Registration.new
    end

    def create
        my_password = BCrypt::Password.create(registration_params[:password])
        @registration = Registration.new(registration_params.merge(password_digest: my_password))
     if @registration.save
      render json: @registration, status: :created, location: api_v1_registration_url(@registration)
    else
      render json: @registration.errors, status: :unprocessable_entity
    end
    end
    private
    def registration_params
        params.permit(:name, :email, :password)
    end
end