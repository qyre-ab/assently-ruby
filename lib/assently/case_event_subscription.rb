module Assently
  class CaseEventSubscription
    # NOTE: The up-to-date event list is available at
    #   https://app.assently.com/api#CaseEventSubscription.
    EVENTS = %w[
      created
      sent
      recalled
      finished
      rejected
      expired
      deleted
      signatureadded
      approvalrequested
      reminded
      metadataupdated
      signed
      approvaladded
      rejectionadded
      finalapproval
    ].freeze

    attr_reader :events, :url

    def initialize(events, url)
      self.events = events
      @url = url
    end

    def events=(events)
      validate_events!(events)
      @events = events
    end

    private

    def validate_events!(events)
      unknown_events = events - self.class::EVENTS

      return unless unknown_events.any?

      raise ArgumentError, "Unknown events: #{unknown_events}. " \
        "Valid events are: #{self.class::EVENTS}"
    end
  end
end
