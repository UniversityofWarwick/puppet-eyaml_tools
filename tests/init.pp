# For these tests to work, a valid hiera.yaml will need to be set up with hiera-eyaml,
# and you'll also need both private and public keys. You can set hiera_config to
# spec/fixtures/hiera.yaml.

$encrypted = eyaml_tools::encrypt('foo')
$decrypted = eyaml_tools::decrypt($encrypted)

if ($decrypted != 'foo') {
  fail("Decrypted data should have been 'foo' but instead it was '$decrypted'!")
}
