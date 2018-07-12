require 'json'
require 'net/https'

module Opsgenie
  module Send
    def self.post(action, params)
      data = params
      request = Net::HTTP::Post.new("/v2/#{action}", 'Content-Type' =>'application/json', 'Authorization' => "GenieKey #{ ENV['OPSGENIE_KEY']}")
      request.body = data.to_json
      response = Net::HTTP.new('api.opsgenie.com').request(request)
      response.body
    end

    def self.heartbeat(name, options = {})
      Opsgenie::Send.post("heartbeats/#{name}/ping", options)
    end

    ## see options at https://docs.opsgenie.com/docs/alert-api#get-alert
    def self.alerts(message, options = {})
      Opsgenie::Send.post('alerts', {message: message}.merge(options))
    end

    ## need to pass either id or alias option
    def self.close(id, options = {})
      Opsgenie::Send.post("alerts/#{id}/close", options)
    end
  end
end
