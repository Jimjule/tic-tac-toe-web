require 'sidekiq'

class CountGamesWorker
  include Sidekiq::Worker

  def perform(collection)
    collection.find({}, {board: true}).count.to_json
  end
end