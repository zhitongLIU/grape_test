#
module V1
  #
  class Base < Grape::API
    format :json
    prefix :api
    version 'v1', using: :path
    mount V1::Stocks

    add_swagger_documentation add_version: true, base_path: '/'
  end
end
