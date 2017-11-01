# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  description      :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  author_id        :integer
#  published        :boolean          default(FALSE)
#  published_at     :datetime
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_slug       (slug) UNIQUE
#

class Post < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :author

  scope :most_recent, -> { order(id: :desc) }

  	def should_generate_new_friendly_id?
  		title_changed?
   	end

   	def display_day_published 
   		"Published #{created_at.strftime ('%-b %-d, %Y')}"
   	end
end

