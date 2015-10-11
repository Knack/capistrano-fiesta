module Capistrano
  module Fiesta
    class Feature
      def initialize(pr)
        @pr = pr
      end

      def title
        @pr.title.sub(/\[Delivers #\d+\]\z/, '').strip
      end

      def images
        @pr.body.scan(/https?:\/\/\S*\.(?:png|jpg)/i)
      end
    end
  end
end