# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.
    #
    if current_user

      primary.item :loans_menu, "Loans", calculators_path do |menu|
        menu.item :calculator, "Loan Calculator", calculators_path
        menu.item :loans, "Loan Disbursement", new_loan_path
        menu.item :collection, "Collection", loans_path
      end

      primary.item :company_transcactions_menu, "Company Transactions", company_transactions_path do |menu|
        menu.item :new, "New", new_company_transaction_path
        menu.item :receipts, "Receipts", receipts_company_transactions_path
        menu.item :payments, "Payments", payments_company_transactions_path
        menu.item :repayments, "Repayments", repayments_company_transactions_path
        menu.item :disbursements, "Disbursements", disbursements_company_transactions_path
        menu.item :book_transfers, "Book Transfer", book_transfers_company_transactions_path
        menu.item :account_transfers, "Account Transfer", account_transfers_company_transactions_path
      end

      primary.item :backup_restore_menu, "Backup & Restore", backups_path do |menu|
        menu.item :backup, "Backup", backup_backups_path
        menu.item :restore, "Restore", backups_path
      end

      primary.item :settings_menu,        "Settings",   settings_root_path do |menu|
        menu.item :company_profile,       "Company Profile",              company_profiles_path
        menu.item :user_rights,           "User Rights",                  settings_user_rights_path
        menu.item :company_configuration, "Company Configuration",        company_configurations_path
        menu.item :client_details,        "Client Details Modification",  people_path do |sub2|
          sub2.item :new_person,            "New Person", new_person_path
        end
      end

      primary.item :reports_menu,         "Reports",   reports_root_path, :highlights_on => %r(/reports) do |menu|
        menu.item :for_submission,        "For Submission",             :reports_for_submission_root do |menu1|
          menu1.item :quarterly,          "Quarterly",                  :reports_for_submission_quarterly_root, :highlights_on => %r(/reports/for_submission/quarterly)
          menu1.item :mounthly,           "Monthly",                    :main_reports_for_submission_monthly
        end
        menu.item :for_records,           "For Records",                reports_for_records_root_path,  :highlights_on => %r(/reports/for_records) do |menu1|
        end
        menu.item :borrower_reports,      "Borrower Reports",           reports_borrowers_root_path do |menu1|
          menu1.item :borrower_list,      "Borrowers List",             :reports_borrowers_lists do |menu2|
            menu2.item :alpabet_borrower_list,      "Alphabet Borrowers List",    :alphabet_reports_borrowers_lists
            menu2.item :blacklisted_borrower_list,  "Blacklisted Borrowers List", :blacklisted_reports_borrowers_lists
          end
          menu1.item :borrower_statements, "Borrower Statements",       :reports_borrowers_root
          #menu1.item :borrower_history,   "Borrower History",           :reports_borrowers_borrower_history
        end
        menu.item :borrower_reports,      "Payments Due",               :reports_payment_due_root do |menu1|
          #menu1.item :due,                "Payments Due",               :reports_payment_due_root
          #menu1.item :daily,              "Daily",                      :reports_payment_due_daily
          #menu1.item :calendar_view,      "Calendar View",              :reports_payment_due_calendar_view
        end
        menu.item :book_statements,       "Book Statements",            :reports_book_statements_root
        menu.item :loan_status,           "Loan Status",                :reports_loan_status do |menu1|
          menu1.item :active,             "Active",                     :active_reports_loan_status
          menu1.item :closed,             "Closed",                     :closed_reports_loan_status
        end
        menu.item :payment_schedule,      "Payment Schedule",           reports_payment_schedules_path
      end

      if current_user.admin?
        primary.item :admin,              "Admin",                      admin_root_path, :highlights_on => %r(/admin) do |menu1|
          menu1.item :company_profiles,   "Companies",                  admin_company_profiles_path, :highlights_on => %r(/admin/company_profiles) do |menu2|
            menu2.item :new,              "New",                        new_admin_company_profile_path
          end
        end
      end

      primary.item :logout, "Logout", :logout
    else
      primary.item :login, "Login", :login
      #primary.item :register, "Register", :register
    end

    # Add an item which has a sub navigation (same params, but with block)
    #primary.item :key_2, 'name', url, options do |sub_nav|
    #  # Add an item to the sub navigation (same params again)
    #  sub_nav.item :key_2_1, 'name', url, options
    #end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    #primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
    #primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
