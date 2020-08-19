class TrackingEventEntity < BasicEntity
  ATTRS = %i[data hora local status subStatus].freeze

  ATTRS.each { |item| attr_reader item }

  def self.attributes
    ATTRS
  end

  def initialize(object)
    super(ATTRS, object)
  end
end
