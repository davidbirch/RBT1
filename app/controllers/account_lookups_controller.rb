class AccountLookupsController < ApplicationController
  
  # GET /account_lookups/new
  def new
    @account_lookup = AccountLookup.new
  end
  
end
