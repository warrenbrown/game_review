class Article < ActiveRecord::Base
  validates :title, presence: true

  has_attached_file :article_img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://placehold.it/350x150"
  validates_attachment_content_type :article_img, content_type: /\Aimage\/.*\Z/
end
