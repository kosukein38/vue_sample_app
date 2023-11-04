class ApplicationController < ActionController::API
  def test
    render json: { message: 'Railsサーバーからapi経由で送ったメッセージです' }
  end
end
