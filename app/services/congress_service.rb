class CongressService
  def self.members_of_house(state)
    get_url("/congress/v1/members/house/#{state}/current.json")
  end

  def self.members_of_senate(state)
    get_url("/congress/v1/senators/#{state}/current.json")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end
  end
end