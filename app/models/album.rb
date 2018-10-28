class Album
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :photos
  belongs_to :user

  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true
end
