class HomeController < ApplicationController
  def index

  	require 'unirest'
  	res = Unirest::get "https://diegurm-centraldacopa.p.mashape.com/jogos/", 
  		headers: { 
    		"X-Mashape-Authorization" => "NJ7o6kaMZFJdk13stQE6t8Z06Z7lgrZs"
 	 	}

 	 @response = res.body

 	 require 'json'

	data = JSON.parse(json_data)
	residents = data['Resident'].map { |rd| Resident.new(rd['phone'], rd['addr']) }


  end
end
