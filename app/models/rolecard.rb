class Rolecard < ActiveRecord::Base
	has_many :messagekeys
	has_many :messages
end
