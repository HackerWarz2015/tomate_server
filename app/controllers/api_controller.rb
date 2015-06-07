require 'webrick'

module Api
  class InvalidParamsError < StandardError; end
  class ValidationError < StandardError; end
  class NotFoundError < StandardError; end
  class PermissionDeniedError < StandardError; end
end

class ApiController < ApplicationController
  load_and_authorize_resource
  respond_to :json
  layout nil

  rescue_from Api::InvalidParamsError do |e|
    render_error WEBrick::HTTPStatus::RC_BAD_REQUEST, e
  end

  rescue_from Api::ValidationError do |e|
    render_error WEBrick::HTTPStatus::RC_EXPECTATION_FAILED, e
  end

  rescue_from Api::NotFoundError do |e|
    render_error WEBrick::HTTPStatus::RC_NOT_FOUND, e
  end

  rescue_from Api::PermissionDeniedError do |e|
    render_error WEBrick::HTTPStatus::RC_FORBIDDEN, e
  end

  protected

  def render_error(code, e)
    json = { status: WEBrick::HTTPStatus[code] }
    json.store(:detail, { error_type: e.class.name, message: e.message }) if Rails.env.development?
    render json: json, status: code
  end
end
