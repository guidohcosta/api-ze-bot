# frozen_string_literal: true

class CorreiosRepository < BasicRepository
  class << self
    def track_order(code)
      tracking = CorreiosService.track(code)
      build_entity(TrackingEntity, tracking.symbolize_keys)
    end
  end
end
