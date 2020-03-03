class BackgroundSerializer
    include FastJsonapi::ObjectSerializer
    set_type :background
    attributes :url
end