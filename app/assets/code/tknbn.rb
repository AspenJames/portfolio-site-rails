def self.most_recently_updated
  self.all.sort do |a, b|
    b.items_most_recently_updated_at <=> a.items_most_recently_updated_at
  end
end

def items_most_recently_updated_at
  self.items.map(&:updated_at).max || self.updated_at
end

## Below as appears in the source, with sorbet type annotations

sig {returns(T::Array[Project])}
def self.most_recently_updated
  T.unsafe(self).all.sort do |a, b|
    b.items_most_recently_updated_at <=> a.items_most_recently_updated_at
  end
end

sig {returns(Time)}
def items_most_recently_updated_at
  T.unsafe(self).items.map(&:updated_at).max || T.unsafe(self).updated_at
end
