class WelcomeController < ApplicationController
    def index
      if current_user.present?
        redirect_to current_user_categories_path
      end
    end
  
    def info
        if current_user.present?
            redirect_to current_user_categories_path
        end
    end
  
    def start
      if current_user.present?
        redirect_to current_user_categories_path
      end
    end
end