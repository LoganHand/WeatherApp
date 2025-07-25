Geocoder.configure(
  http_headers: { 'Accept-Encoding' => 'json' },
  lookup: :nominatim,
  http_headers: { "User-Agent" => "weatherapp" },
  timeout: 5,
  units: :km
)
