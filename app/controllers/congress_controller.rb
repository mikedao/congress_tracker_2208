class CongressController < ApplicationController
    def search_state
      @facade = CongressFacade.new(params[:state])
      # @members = CongressFacade.members(params[:state])
      # @senators = CongressFacade.senators(params[:state])
    
      render "welcome/index"
    end
  end