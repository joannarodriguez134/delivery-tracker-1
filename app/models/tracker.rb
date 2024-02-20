# == Schema Information
#
# Table name: trackers
#
#  id                    :integer          not null, primary key
#  delivery_status       :boolean
#  description           :string
#  details               :text
#  supposed_to_arrive_on :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Tracker < ApplicationRecord
  belongs_to(:user)
end
