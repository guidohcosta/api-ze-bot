class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :client, :tracking, :status, :status_cd
end
