class EventHome
  def initialize(params)
    @events = Event.all
    @params = params
  end

  def home
    filter_by_location if @params[:address].present?
    filter_by_date_start if @params[:date_start].present?

    @events
  end

  def result
    filter_by_location if @params[:address].present?
    filter_by_date_start if @params[:date_start].present?
    filter_by_category if @params[:category].present?

    @events
  end

  # def geocode_by
  #   @params[:address].present?
  #   @events
  # end

  private

  def filter_by_location
    # @events = @events.where(address: @params[:address])
    @events = @events.near(@params[:address], 20)
  end

  def filter_by_date_start
    @events = @events.where("date_start <= ? AND ? <= date_end", @params[:date_start].to_date, @params[:date_start].to_date)
    # (@params[:date_start]: (:date_start.midnight - 1.day)..date_end.midnight)
  end

  def filter_by_category
    @events = @events.where(category: @params[:category])
  end
end
