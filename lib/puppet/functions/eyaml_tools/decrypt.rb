require 'hiera/backend/eyaml/options'
require 'hiera/backend/eyaml/parser/parser'
require_relative 'utils'

Puppet::Functions.create_function(:'eyaml_tools::decrypt') do
  dispatch :decrypt do
    param 'String', :enc_data
  end

  def decrypt(enc_data)
    EyamlTools.ensure_config
    parser = Hiera::Backend::Eyaml::Parser::ParserFactory.encrypted_parser
    tokens = parser.parse(enc_data.gsub(/\s/,'')) # strip whitespace from ENC[] token
    decrypted = tokens.map{ |token|
      case token.class.name
        when /::EncToken$/
          token.plain_text
        else
          token.match
      end
    }
    decrypted.join
  end
end