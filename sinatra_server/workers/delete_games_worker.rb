require 'sidekiq'

class DeleteGamesWorker
  include Sidekiq::Worker

  def perform(collection)
    collection.delete_many({}).n.to_json
  end
end