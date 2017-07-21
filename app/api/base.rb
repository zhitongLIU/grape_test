#
class Base < Grape::API
  format :json
  prefix :api

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
