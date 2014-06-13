class Question < ActiveRecord::Base
has_many :answers

validates :title, presence: true, length: { minimum: 40, message: 'Not long enought!' }
validates :description, presence: true, length: { minimum: 150, message: 'Not long enought!' }
end
