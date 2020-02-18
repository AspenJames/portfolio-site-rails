def self.most_recently_updated
  self.all.sort do |a, b|
    b.items_most_recently_updated_at <=> a.items_most_recently_updated_at
  end
end

def items_most_recently_updated_at
  self.items.map(&:updated_at).max || self.updated_at
end
