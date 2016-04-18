class Project < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :description
  validates_length_of :name, minimum: 3
  validates_length_of :description, minimum: 5
end
