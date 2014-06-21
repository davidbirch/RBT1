class AccountLookupsController < ApplicationController
    
  # GET /account_lookups
  def index
    @account_lookup = AccountLookup.new
  end

  # POST /account_lookups
  def create
    @account_lookup = AccountLookup.new(account_lookup_params)
    @account_lookup.update_details_from_twitter
    flash.now[:error] = @account_lookup.error_message unless @account_lookup.error_message.nil?
    render :index
  end
  
  private
    # Only allow a trusted parameter "white list" through.
    def account_lookup_params
      params.require(:account_lookup).permit(:screen_name)
    end
  
end
