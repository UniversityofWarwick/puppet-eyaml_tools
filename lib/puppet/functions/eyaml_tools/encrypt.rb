require 'hiera/backend/eyaml/options'
require 'hiera/backend/eyaml/parser/parser'
require_relative 'utils'

Puppet::Functions.create_function(:'eyaml_tools::encrypt') do
  dispatch :encrypt do
    param 'String', :data
  end

  def encrypt(data)
    EyamlTools.ensure_config
    encryptor = Hiera::Backend::Eyaml::Encryptor.find
    ciphertext = encryptor.encode( encryptor.encrypt(data) )
    token = Hiera::Backend::Eyaml::Parser::EncToken.new(:block, data, encryptor, ciphertext, nil, '    ')
    token.to_encrypted :format => :string
  end
end