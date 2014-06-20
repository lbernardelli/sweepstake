namespace :import_data do
    
    desc "Import teams data"
    task :import_teams => :environment do
        require 'unirest'
        require 'json'

        puts "initializing team importing"
        
        response = Unirest::get "https://diegurm-centraldacopa.p.mashape.com/selecoes/", 
                            headers: { "X-Mashape-Authorization" => "NJ7o6kaMZFJdk13stQE6t8Z06Z7lgrZs" }
                            
        data = JSON.parse(response.body.to_json)
        teams = data['selecoes'].map { |team| Team.new(team['sigla'], team['selecao']) }
        
        teams.each do |team|
            puts "saving #{team.acronym}"
            puts "team #{team.name}"
            puts Team.inspect

            team.save!
        end
    end
    
end