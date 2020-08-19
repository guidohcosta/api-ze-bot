# frozen_string_literal: true

class BasicRepository
  def self.build_entity(entity, hash)
    builder = {}
    entity.attributes.each do |attr|
      builder[attr] = hash.try(:[], attr)
    end
    entity.new(builder.compact)
  end
end
