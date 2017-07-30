require_relative 'spec_helper'
require_relative '../app/invoice'

RSpec.describe Invoice do
  let(:name) { 'Test invoice' }
  let(:instance) { described_class.new(name: name) }

  describe 'initial state' do
    subject { instance }

    it { is_expected.to have_state(:draft) }
  end

  describe 'archive' do
    subject { instance.archive }

    before { instance.aasm.current_state = :paid }

    it 'calls all needed methods' do
      expect(instance).to receive(:archive_data)
      expect(instance).to receive(:log_status_change)

      subject
    end
  end

  describe 'sent' do
    subject { instance.sent }

    before { instance.aasm.current_state = :unpaid }

    it 'calls all needed methods' do
      expect(instance).to receive(:send_invoice)
      expect(instance).to receive(:log_status_change)

      subject
    end
  end
end
