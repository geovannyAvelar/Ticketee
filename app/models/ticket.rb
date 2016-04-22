class Ticket < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :description
  validates_length_of :title, minimum: 3, maximum: 30
  validates_length_of :description, minimum: 5, maximum: 50

  belongs_to :project

end
