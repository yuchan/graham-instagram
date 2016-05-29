require 'json'

module Graham
  module API
    module Connection 
      def post(url, option = nil)
        options                = prepareOption(option)
        res                    = config.conn.post(url, options)
        body                   = JSON.parse res.body
        yield(res, body) if block_given?
        res
      end

      def get(url, option = nil)
        options                = prepareOption(option)
        res                    = config.conn.get(url, options)
        body                   = JSON.parse res.body
        yield(res, body) if block_given?
        res
      end

      def delete(url, option = nil)
        options                = prepareOption(option)
        res                    = config.conn.delete(url, options)
        body                   = JSON.parse res.body
        yield(res, body) if block_given?
        res
      end
      
      private

      def prepareOption(option = nil)
        options                = {}
        options["access_token"] = config.access_token if config.access_token
        options["client_id"] = config.client_id unless config.access_token
        unless option.nil?
          option.each do |key, value|
            options[key]       = value
          end
        end
        options
      end
    end
  end
end
