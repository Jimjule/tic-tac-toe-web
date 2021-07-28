require 'sidekiq'

class AddGameWorker
  include Sidekiq::Worker

  def perform(collection, game)
    collection.insert_one(game).n.to_json
  end
end