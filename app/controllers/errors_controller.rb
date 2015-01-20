class ErrorsController < ApplicationController

  def error
    @error = error_code
  end

  protected

  def error_code
    errors = {
      "404" => {
        code: 404,
        text: "Page not found!"
      },
      "422" => {
        code: 422,
        text: "The change you wanted was rejected!"
      },
      "500" => {
        code: 500,
        text: "Sorry, something went wrong!"
      },
    }
    errors.default = errors["500"]
    errors[params[:code]]
  end

end
