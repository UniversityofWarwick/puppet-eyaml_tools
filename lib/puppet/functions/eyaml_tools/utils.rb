require 'hiera/backend/eyaml/options'

module EyamlTools
  module_function

  # Hiera will also set Eyaml::Options but only after it's been initialised, which
  # is done lazily on the first lookup. Probably best not to rely on a lookup happening
  # before one of our functions so let's ensure config is set.
  def ensure_config
    unless @config_done
      c = hiera_config
      raise Puppet::ParseError, 'no Hiera config found' unless c
      eyaml_config = c['defaults']['options']
      raise 'no defaults.options section found in Hiera config' unless eyaml_config
      eyaml_config.each do |key, value|
        Puppet.debug "EyamlTools: setting #{key} to #{value}"
        Hiera::Backend::Eyaml::Options[key.to_sym] = value
      end
      @config_done = true
    end
  end

  def hiera_config
    config_file = hiera_config_file
    if config_file
      YAML.load_file(config_file)
    end
  end

  def hiera_config_file
    environment = Puppet[:environment]
    environment_path = Puppet[:environmentpath]
    hiera_config = "#{environment_path}/#{environment}/hiera.yaml"
    if Puppet::FileSystem.exist?(hiera_config)
      hiera_config
    else
      Puppet.warning "EyamlTools: Config file #{hiera_config} not found"
      nil
    end
  end
end