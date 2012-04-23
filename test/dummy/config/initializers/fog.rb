CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJCZNAAND3GKZNIBA',       # required
    :aws_secret_access_key  => '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',       # required
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'esiphotos' 
end
