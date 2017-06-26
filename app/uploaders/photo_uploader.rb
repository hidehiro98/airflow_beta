class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  process convert: 'jpg'

  version :bright_face do
    cloudinary_transformation width: 48, height: 48,
      crop: :thumb, gravity: :face
  end

end
