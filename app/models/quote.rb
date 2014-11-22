class Quote < ActiveRecord::Base

  def self.picker
    ids = Quote.all.pluck(:id)
    return nil if ids.empty?

    choice = ids[Time.now.to_i % ids.size]
    Quote.find(choice)
  end
end
