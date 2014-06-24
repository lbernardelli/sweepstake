namespace :import_data do
    
    desc "Import teams data"
    task :import_teams => :environment do
        require 'unirest'
        require 'json'

        Rails.logger.info "initializing team importing"
        
        response = Unirest::get "https://diegurm-centraldacopa.p.mashape.com/selecoes/", 
                            headers: { "X-Mashape-Authorization" => "NJ7o6kaMZFJdk13stQE6t8Z06Z7lgrZs" }
        
        Team.delete_all

        data = JSON.parse(response.body.to_json)
        teams = data['selecoes'].map { |team| 
            t = Team.new(name: team['selecao'], acronym: team['sigla'])
            t.save
        }
    end

    desc "Import games data"
    task :import_games => :environment do 
        require 'unirest'
        require 'json'

        Rails.logger.info "initializing game importing"
        
        response = Unirest::get "https://diegurm-centraldacopa.p.mashape.com/jogos/", 
                            headers: { "X-Mashape-Authorization" => "NJ7o6kaMZFJdk13stQE6t8Z06Z7lgrZs" }
        
        data = JSON.parse(response.body.to_json)
        games = data['jogos'].map { |game| 
            date = game['data']

            if Date.parse(date) <= Date.today
                visitor = Team.where(acronym: game['visitante']).first
                principal = Team.where(acronym: game['mandante']).first
                
                if Game.where(visitor: visitor, principal: principal).size == 0
                    g = Game.new(principal: principal, visitor: visitor, principalScore: game['mandanteresultado'], visitorScore: game['vistanteresultado'], date: date, hour: game['hora'], fuso: game['fusohorario'])
                    g.save
                else
                    Rails.logger.info "Already imported #{game['data']} #{game['mandante']} vs #{game['visitante']}"
                end
            else
                Rails.logger.info "Scaping game not started yet: #{game['data']} #{game['mandante']} vs #{game['visitante']}"
            end
        }       
    end
end