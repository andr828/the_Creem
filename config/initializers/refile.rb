
if Rails.env.test? || Rails.env.development?
  Refile.cache = Refile::Backend::FileSystem.new('tmp/refile')
  Refile.store = Refile::Backend::FileSystem.new('tmp/refile')
else
  require 'refile/s3'

  aws = {
    access_key_id: Settings.refile.aws.access_key_id,
    secret_access_key: Settings.refile.aws.access_key_secret,
    region: Settings.refile.aws.region,
    bucket: Settings.refile.aws.bucket
  }

  Refile.cache = Refile::S3.new(prefix: 'the_creem_cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'the_creem_store', **aws)

  Refile.cdn_host = Settings.refile.cdn_host if Settings.refile.cdn_host.present?
end
