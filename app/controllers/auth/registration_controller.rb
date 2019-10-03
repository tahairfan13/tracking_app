class Auth::RegistrationController < ApplicationController
    
   def create
      number = rand 10000
      verification = Auth::Verification.new(secret_key: number)
      if verification.save
       render json: {status: 201, message: "Your Secret Key number is #{number}"}
      else
       render json: {status: 401, message: 'Sorry'}
      end
   end
end