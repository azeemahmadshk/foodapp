CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     "AKIAIB5P2D5RI4KANBCQ",
    aws_secret_access_key: "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"
  }
  config.fog_directory  = "areal-app-prod"
end
