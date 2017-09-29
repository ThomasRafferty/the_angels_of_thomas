class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true


  has_many
end
