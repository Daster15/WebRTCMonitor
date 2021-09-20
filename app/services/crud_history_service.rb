class CrudHistoryService

    def initialize(params)
        @user_id = params[:user_id]
        @action = params[:action]
        @content = params[:content]
    end

    def save_action
        Crudhistoryaction.create(save_attributes)
    end
    
    private

    attr_reader :user_id, :action, :content

    def save_attributes
        {
            user_id: user_id,
            action: action,
            content: content
        } 
    end

end