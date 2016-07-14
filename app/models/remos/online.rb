module Remos
  TOTAL = 50
  LIMIT = 20

  class Online < Redis::SortedSet
    def initialize(key)
      super(key, $redis)
    end

    def index(limit: LIMIT, previous_id: nil)
      if previous_id
        limit = limit.to_i

        limit = LIMIT if limit > LIMIT || limit <= 0
        result = revrangebyscore("(#{previous_id.to_i}", "-inf", {limit: limit, with_scores: true})
      else
        result = revrange(0, limit - 1, {with_scores: true})
      end

      onlines = []
      result.each do |res|
        online = { user: res.first, time: Time.at(res.last.to_i) }
        onlines << online
      end
      onlines
    end

    def appear(user)
      # content = { user: user, time: Time.now }
      add(user, Time.now.to_i)
    end

    def away(user)
      delete(user)
    end
  end
end