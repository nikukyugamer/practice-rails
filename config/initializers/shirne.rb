require 'shrine'
require 'shrine/storage/file_system'

Shrine.storages = {
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'),
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache')
}

Shrine.plugin :activerecord
