require "assently/case_event_subscription"
require "assently/api_mappers/case_event_subscription_mapper"

module Assently
  module ApiMappers
    RSpec.describe CaseEventSubscriptionMapper do
      describe ".to_api" do
        it "creates a hash that matches the api's expected format" do
          case_event_subscription = CaseEventSubscription.new(
            ["created", "sent"],
            "http://example.com"
          )

          expect(CaseEventSubscriptionMapper.to_api(case_event_subscription)).to eq({
            "Events" => ["created", "sent"],
            "Url" => "http://example.com"
          })
        end
      end
    end
  end
end
