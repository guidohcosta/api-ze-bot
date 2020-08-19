# frozen_string_literal: true

class BasicEntity
  def initialize(attrs, object)
    attrs.each { |key| instance_variable_set("@#{key}", object[key]) }
  end

  def self.build(entity, object)
    builder = {}
    attributes.each { |attr| builder[attr] = object.send(attr) }
    entity.new(builder)
  end
end
