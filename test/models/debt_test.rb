# == Schema Information
#
# Table name: debts
#
#  id         :integer          not null, primary key
#  amount     :decimal(, )
#  comment    :text
#  owner_id   :integer
#  payer_id   :integer
#  start_date :date
#  due_date   :date
#  paid_date  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  paid       :boolean          default(FALSE)
#

require 'test_helper'

class DebtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
