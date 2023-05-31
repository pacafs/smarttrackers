module ApplicationHelper

    def display_navbar?
        return true unless controller_name == 'home' || controller_name == 'sessions'
    end
    
end
