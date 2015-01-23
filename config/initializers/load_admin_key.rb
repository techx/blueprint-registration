module Admin

  KEY = YAML.load(ERB.new(File.read("#{Rails.root}/config/admin_key.yml")).result)[Rails.env]['key']

end
