require 'spec_helper'

describe 'eyaml_tools::encrypt' do
 it { is_expected.to run.with_params('foo').and_return(/ENC\[PKCS7,.+]/) }
end