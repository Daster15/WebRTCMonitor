class CrudHistoryJob < ApplicationJob
  queue_as :default

  def perform(user_id,action,content)
    CrudHistoryService.new(user_id: user_id, action: action, content: content ).save_action
  end
end
