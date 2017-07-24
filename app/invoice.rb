class Invoice < Sequel::Model
  include AASM

  aasm column: :state do
    after_all_transitions :log_status_change

    state :draft, initial: true
    state :unpaid
    state :sent
    state :paid
    state :archived

    event :draft do
      transitions from: :unpaid, to: :draft
    end

    event :confirm do
      transitions from: :draft, to: :unpaid
    end

    event :sent, after: :send_invoice do
      transitions from: :unpaid, to: :sent
    end

    event :pay do
      transitions from: :sent, to: :paid
    end

    event :archive, after: :archive_data do
      transitions from: [:upaid, :paid], to: :archived
    end
  end

  def send_invoice
    puts 'Sending an invoice...'
  end

  def archive_data
    puts 'Archiving data...'
  end

  def log_status_change
    puts "Changed from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end
end
