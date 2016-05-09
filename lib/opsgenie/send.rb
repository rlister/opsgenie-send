require 'json'
require 'net/https'

module Opsgenie
  module Send
    def self.post(action, params)
      data = {'apiKey' => ENV['OPSGENIE_KEY']}.merge(params)
      request = Net::HTTP::Post.new("/v1/json/#{action}", 'Content-Type' =>'application/json')
      request.body = data.to_json
      response = Net::HTTP.new('api.opsgenie.com').request(request)
      response.body
    end

    def self.heartbeat(name, options = {})
      Opsgenie::Send.post('heartbeat/send', {name: name}.merge(options))
    end

    ## see options at https://www.opsgenie.com/docs/web-api/alert-api#createAlertRequest
    def self.alert(message, options = {})
      Opsgenie::Send.post('alert', {message: message}.merge(options))
    end

    ## need to pass either id or alias option
    def self.close(options = {})
      Opsgenie::Send.post('alert/close', options)
    end
  end
end