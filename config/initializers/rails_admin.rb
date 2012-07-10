# RailsAdmin config file. Generated on July 07, 2012 18:51
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Ac Aregistration', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Category, Entry, Race, RaceEvent, RaceType, Rider]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Category, Entry, Race, RaceEvent, RaceType, Rider]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Category do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :cat_name, :string 
  #     configure :cat_number, :integer 
  #     configure :cat_lower_age, :integer 
  #     configure :cat_upper_age, :integer 
  #     configure :cat_age_based, :boolean 
  #     configure :cat_upper_age_control, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Entry do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :race_id, :integer 
  #     configure :rider_id, :integer 
  #     configure :signed_release?, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Race do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :women?, :boolean 
  #     configure :min_age, :integer 
  #     configure :max_age, :integer 
  #     configure :entry_fee, :decimal 
  #     configure :min_category, :integer 
  #     configure :max_category, :integer 
  #     configure :age_class?, :boolean 
  #     configure :all_categories?, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model RaceEvent do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :date, :date 
  #     configure :race_type_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model RaceType do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :type, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Rider do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :license_number, :string 
  #     configure :citizen, :boolean 
  #     configure :sex, :string 
  #     configure :state, :string 
  #     configure :racing_age, :integer 
  #     configure :rd_cat, :integer 
  #     configure :cx_cat, :integer 
  #     configure :dh_cat, :integer 
  #     configure :mx_ds_cat, :integer 
  #     configure :ot_cat, :integer 
  #     configure :rd_club, :string 
  #     configure :tk_club, :string 
  #     configure :cx_club, :string 
  #     configure :birthdate, :date 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
