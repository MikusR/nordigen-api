class Client
  def create_client
    # Create client instance
    Nordigen::NordigenClient.new(
      secret_id: ENV["SECRET_ID"],
      secret_key: ENV["SECRET_KEY"]
    )
  end
end
