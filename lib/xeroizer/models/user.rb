module Xeroizer
  module Record

    class UserModel < BaseModel

      set_permissions :read

    end

    class User < Base

      USER_ROLE = {
        'READONLY' => 'Read only',
        'INVOICEONLY' => 'Invoice only',
        'STANDARD' => 'Standard',
        'FINANCIALADVISER' => 'Financial adviser',
        'MANAGEDCLIENT' => 'Managed client',
        'CASHBOOKCLIENT' => 'Cashbook client'
      } unless defined?(USER_ROLE)

      set_primary_key :user_id

      guid :user_id
      string :first_name
      string :last_name
      datetime :updated_date_utc, :api_name => 'UpdatedDateUTC'
      boolean :is_subscriber
      string :organisation_role

      validates_inclusion_of :organisation_role, :in => USER_ROLE.keys, :allow_blanks => true

    end
  end
end
