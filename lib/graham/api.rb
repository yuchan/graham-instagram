require "graham/api/connection"
require 'json'

module Graham
  module API
    include Connection
    
    def get_access_token(code)
      url = '/oauth/access_token'
      res = post(url, {
        client_id: config.client_id,
        client_secret: config.client_secret,
        grant_type: 'authorization_code',
        redirect_uri: config.redirect_uri,
        code: code
        })

      token = nil
      if res.success?
        body = JSON.parse res.body
        token = body["access_token"]
        config.access_token = token
      end
      yield(token) if block_given?
      token
    end

    def users(userid)
      url = "/v1/users/#{userid}"
      get(url) do |res, body|
        yield(res, body) if block_given?
      end
    end
  
    def users_recent(userid)
      url = "/v1/users/#{userid}/media/recent"
      get(url) do |res, body|
        yield(res, body) if block_given?
      end
    end
    
    def users_search(username)
      url = "/v1/users/search"
      get(url, {q: username}) do |res, body|
        yield(res, body) if block_given?
      end
    end

    def tags_info(tagname)
      url                         = "/v1/tags/#{tagname}"
      get(url) do |res, body|
        yield(res, body) if block_given?
      end      
    end

    def tags_recent(tagname, count = -1, min_tag_id = -1, max_tag_id = -1)
      url                         = "/v1/tags/#{tagname}/media/recent"
      options                     = {}
      options["count"]            = count if count >= 0
      options["min_tag_id"]       = min_tag_id if min_tag_id >= 0
      options["max_tag_id"]       = max_tag_id if max_tag_id >= 0
      get(url, options) do |res, body|
        yield(res, body) if block_given?
      end
    end

    def tags_search(tagname)
      url                         = "/v1/tags/search"
      get(url, {q: tagname}) do |res, body|
        yield(res, body) if block_given?
      end
    end

    def likes(media_id)
      url = "/v1/media/#{media_id}/likes"
      get(url) do |res, body|
        yield(res, body) if block_given?
      end
    end
    
    def add_like(media_id)
      url = "/v1/media/#{media_id}/likes"
      post(url) do |res, body|
        yield(res, body) if block_given?
      end
    end
    
    def delete_like(media_id, like_id)
      url = "/v1/media/#{media_id}/likes"
      delete(url) do |res, body|
        yield(res, body) if block_given?
      end
    end
        
    def comments(media_id)
      url = "/v1/media/#{media_id}/comments"
      get(url) do |res, body|
        yield(res, body) if block_given?
      end
    end
    
    def add_comment(media_id, comment_text)
      url = "/v1/media/#{media_id}/comments"
      encoded_text = URI.encode(comment_text)
      post(url, {text: encoded_text}) do |res, body|
        yield(res, body) if block_given?
      end
    end
    
    def delete_comment(media_id, comment_id)
      url = "/v1/media/#{media_id}/comments/#{comment_id}"
      delete(url) do |res, body|
        yield(res, body) if block_given?
      end
    end
    
    def locations_search_by_fb_place_id(location)
      url = "/v1/locations/search"
      get(url, {facebook_places_id: location}) do |res, body|
        yield(res, body) if block_given?
      end
    end

    def locations_search_by_lat_lng(lat, lng)
      url = "/v1/locations/search"
      get(url, {lat: lat, lng: lng}) do |res, body|
        yield(res, body) if block_given?
      end
    end
  end
end