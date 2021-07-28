require 'sidekiq'

class EchoWorker
  include Sidekiq::Worker

  def perform(echo)
    echo
  end
end