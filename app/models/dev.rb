class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  # accepts an item_name (string)
  # and returns true if any of the freebies associated with the
  # dev has that item_name, otherwise returns false
  def received_one?(item_name)
    if self.freebies.find_by item_name: item_name
      return true
    else
      return false
    end
  end

  # accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev;
  # your code should only make the change if the freebie belongs to the dev who's giving it away
  def give_away(dev, freebie)
    if self.received_one? freebie.item_name
      freebie.dev = dev
    else
      "This freebie does not belong to this dev"
    end
  end
end
