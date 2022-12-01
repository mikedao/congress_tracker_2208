class CongressFacade
  def initialize(state)
    @state = state
    # @service = CongressService.new
  end

  def members
    service.members_of_house(@state)[:results].map do |member_data|
      Member.new(member_data)
    end
  end

  def senators
    service.members_of_senate(@state)[:results].map do |senator_data|
      Senator.new(senator_data)
    end
  end

  def user 
    User.find(params[:id])
  end

  def commments
    Comment.all
  end

  def service
    @_service ||= CongressService.new
  end
end