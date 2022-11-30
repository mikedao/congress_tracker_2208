class CongressController < ApplicationController
    def search_state
      state = params[:state]
      conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
        faraday.headers["X-API-KEY"] = ENV['govt_api_key']
      end
  
      response = conn.get("/congress/v1/members/house/#{state}/current.json")
  
      json = JSON.parse(response.body, symbolize_names: true)
  
      @house_members = json[:results]
      render "welcome/index"
    end
  end