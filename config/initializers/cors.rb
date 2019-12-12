# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins 'example.com'
    origins 
            'http://apps.tomjmcnamee.com',
            'http://www.apps.tomjmcnamee.com'
            # 'https://apps.tomjmcnamee.com',
            # 'https://www.apps.tomjmcnamee.com',
            # 'http://tjm-apps.herokuapp.com',
            # 'https://tjm-apps.herokuapp.com',
            # 'http://www.tjm-apps.herokuapp.com',
            # 'https://www.tjm-apps.herokuapp.com'

            # 'localhost:3000'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch]
  end
end
