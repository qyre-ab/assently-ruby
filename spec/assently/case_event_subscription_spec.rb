require 'assently/case_event_subscription'

RSpec.describe Assently::CaseEventSubscription do
  describe '#initialize' do
    let(:case_event_subscription) { described_class.new(events, 'http://example.com') }
    let(:events) { [described_class::EVENTS.sample] }

    it 'accepts a known event' do
      expect(case_event_subscription.events).to eq(events)
    end

    context 'when one of the provided events is unknown' do
      let(:events) { %w[whatevs] }

      it 'raises the exception' do
        expect { case_event_subscription }.to raise_error(ArgumentError)
      end
    end
  end
end
