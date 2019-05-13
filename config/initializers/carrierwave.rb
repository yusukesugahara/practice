CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'#リージョンをUS以外にしたかたはそのリージョンに変更
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'practice-11'
        config.asset_host = 'https://s3.amazonaws.com/practice-11'
    when 'production'
        config.fog_directory  = 'practice-11'
        config.asset_host = 'https://s3.amazonaws.com/practice-11'
    end
end
