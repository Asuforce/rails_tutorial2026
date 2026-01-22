class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Method
end
