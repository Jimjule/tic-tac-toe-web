require 'sidekiq'

class GetGamesWorker
  include Sidekiq::Worker

  def perform(collection)
    collection.find({}, {board: true}).to_json
  end
end