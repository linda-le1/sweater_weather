Timezone::Lookup.config(:google) do |c|
    c.api_key = "#{ENV['GEOCODE_API']}"
end