module Graham
  module API
    module Connection 
      def post(url, option          = nil)
        options                     = prepareOption(option)
        config.conn.post(url, options)
      end

      def get(url, option           = nil)
        options                     = prepareOption(option)
        config.conn.get(url, options)
      end

      def delete(url, option = nil)
        options = prepareOption(option)
        config.conn.delete(url, options)
      end
      
      private

      def prepareOption(option      = nil)
        options                     = { access_token: config.access_token }
        unless option.nil?
          option.each do |key, value|
            options[key]            = value
          end
        end
        options
      end
    end
  end
end