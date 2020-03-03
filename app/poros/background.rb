class Background
    attr_reader :url, :id

    def initialize(info)
        @id = nil
        @url = info['results'][0]['links']['html']
    end
end