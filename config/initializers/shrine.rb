require 'shrine'
require "shrine/storage/s3"

s3_options = {
  bucket:            ENV['S3_BUCKET_NAME'],
  access_key_id:     ENV['S3_ACCESS_KEY_ID'],
  secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
  region:            ENV['S3_REGION']
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: 'test/shrine/cache', **s3_options),
  store: Shrine::Storage::S3.new(prefix: 'test/shrine/store', **s3_options)
}

# require 'shrine/storage/file_system'

# Shrine.storages = {
#   store: Shrine::Storage::FileSystem.new('public', prefix: 'shrine/uploads/store'),
#   cache: Shrine::Storage::FileSystem.new('public', prefix: 'shrine/uploads/cache')
# }

Shrine.plugin :activerecord
