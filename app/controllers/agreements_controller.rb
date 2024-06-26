class AgreementsController < ApplicationController
  def index
      id = params[:id]

      if id == nil
          redirect_to "/"
      end

      client = Client.new().create_client()
      uuid = SecureRandom.uuid
      redirect_url = request.base_url + Rails.application.routes.url_helpers.results_path
      init = client.init_session(redirect_url: redirect_url, institution_id: id, reference_id: uuid)
      puts init
      session[:requisition_id] = init["id"]
      redirect_to init["link"], allow_other_host: true
  end
end
