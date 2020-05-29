class Background
    attr_reader :url, :id

    def initialize(info)
        @id = nil
        @url = if info['results'].empty?
                []
            else
                info['results'][0]['links']['html']
            end
    end
end