json.array!(@zombies) do |zombie|
  json.extract! zombie, :id, :name, :age, :weapon_id
  json.url zombie_url(zombie, format: :json)
end
