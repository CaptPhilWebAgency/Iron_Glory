RailsAdmin.config do |config|

  config.total_columns_width = 1000

   config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |email, password|
       User.find_by(email: email).try(:authenticate, password).try(:admin?)
     end
   end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.excluded_models << "Ordering"

  config.model 'User' do
    object_label_method :email
    list do
      exclude_fields :password_digest, :token
    end
    edit do
      exclude_fields :password_digest, :token
    end
    show do
      exclude_fields :password_digest, :token
    end
  end

  config.model 'Year' do
    object_label_method :yr
    visible false
  end

  config.model 'Address' do
    visible false
    object_label_method :street
  end

  config.model 'Category' do
    visible false
  end

  config.model 'Status' do
    visible false
  end

  #Add a sign-out link to the admin panel
  config.navigation_static_links = {
  'Return Home' => '/'
}

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
