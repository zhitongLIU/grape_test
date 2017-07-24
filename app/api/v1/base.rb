#
module V1
  #
  class Base < Grape::API
    format :json
    prefix :api
    version 'v1', using: :path
    mount V1::Stocks

    add_swagger_documentation(
      base_path: '',
      api_version: '1.0',
      format: :json,
      hide_documentation_path: true,
      info: {
        title: 'API',
        description: 'API to expose informations',
        contact: 'jfrancois@synbioz.com',
        license: 'All Rights Reserved'
      }
    )
  end
end
