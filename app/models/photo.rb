class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tagline, type: String
  field :image, type: String

  validates_uniqueness_of :tagline
  validates_presence_of :tagline
  validate :tagline_must_be_valid

  mount_uploader :image, ImageUploader

  belongs_to :album

  def tagline_must_be_valid
    validate_name(:tagline)
  end

  def validate_name(field_name)
    if send(field_name.to_s) && !(send(field_name.to_s) =~ /^[a-zA-Z,. ]+$/)
      errors.add(field_name, "must be valid.")
    end
  end

end
