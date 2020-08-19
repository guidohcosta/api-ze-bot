class TrackingEntity < BasicEntity
  ATTRS = %i[codigo host time eventos quantidade service ultimo].freeze

  ATTRS.each { |item| attr_reader item }

  def self.attributes
    ATTRS
  end

  def initialize(object)
    super(ATTRS, object)
    @eventos = @eventos.map do |event|
      TrackingEventEntity.new(event.symbolize_keys)
    end
  end

  def delivery_status
    eventos.first.status
  end
end
