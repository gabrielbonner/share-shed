class Tool < ActiveRecord::Base
  validates :abstract_tool, :owner, :base_price, presence: true
  validates :base_price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # just numericality: true

  belongs_to :abstract_tool

  has_many :line_items, dependent: :destroy
  belongs_to :owner, class_name: "User"

  has_many :tool_tags
  has_many :tags, through: :tool_tags

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def name
  	abstract_tool.name
  end

end
