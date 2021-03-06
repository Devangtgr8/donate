class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #http_basic_authenticate_with :name => "Devang", :password => "b12059"
  include SessionsHelper
  require 'will_paginate/array'

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :address, :bloodgroup, :phone, :zip, :availability, :lastdonated, :age, :city, :gender,
                                                :hospital_zip, :hospital_address, :hospital_name, :doctor_incharge, :hospital_city, :hospital_phone,
                                                :donor, :donated_to, :bloodgroup, :date ]
    devise_parameter_sanitizer.for(:account_update) << [:name, :address, :bloodgroup, :phone, :zip, :availability, :lastdonated, :age, :city, :gender,
                                                        :hospital_zip, :hospital_address, :hospital_name, :doctor_incharge, :hospital_city, :hospital_phone,
                                                        :donor, :donated_to, :bloodgroup, :date]
  end
end
