class UserDecorator < Draper::Decorator
    delegate_all
    def form_url(url_method)
        url_method=='login' ? h.sessions_url : h.users_url 
    end

    def submit_form(url_method)
        url_method=='login' ? 'Login!' : 'Sign Up'
    end


end