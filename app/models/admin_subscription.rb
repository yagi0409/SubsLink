class AdminSubscription < Subscription
  belongs_to :company
  belongs_to :group
  has_many :subscribes
  has_many :users, through: :subscribes

  scope :no_overlap, -> { uniq{ |n| n.group_id } }
  scope :same_group, -> (subsc){ where(group_id: subsc.group_id).where.not(id: subsc.id) }

  def subscribe_day(user)
    return nil if (subscribes == nil)
    return nil if (user == nil)
    subscribes.find_by(user_id: user.id).contract_day
  end
end
