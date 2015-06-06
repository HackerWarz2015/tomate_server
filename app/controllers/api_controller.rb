class ApiController < ApplicationController
  load_and_authorize_resource
  respond_to :json
  layout nil
end
