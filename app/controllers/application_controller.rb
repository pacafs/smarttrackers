class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(user)
        gauges_path
    end
    
end
