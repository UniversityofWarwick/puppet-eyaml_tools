# EYAML Tools

This is an unaffliated companion to [hiera-eyaml][1]. If you are already using hiera-eyaml to encrypt and decrypt secrets in your Hiera
data but want some plain Puppet functions to do the same encryption and decryption, then you've come to the right place.
These are Puppet 4.x functions so you'll need to either be on Puppet 4.x or using the future parser if on 3.x.

It attempts to use the same Hiera config, so it will use the same backend, keys etc.

What's that? These functions have nothing to do with YAML? You're absolutely right, but the encrypted `ENC[]` format 
used by hiera-eyaml doesn't have a name by itself so we've adopted the EYAML name.

## Usage

Assuming you are already using hiera-eyaml, simply use these two functions:

```ruby
$encrypted_data = eyaml_tools::encrypt($plain_data)

$decrypted_data = eyaml_tools::decrypt($encrypted_data)
```

That's all there is to it really. To configure different keys, encryptors etc. see the hiera-eyaml documentation. It has
 not been tested with different encryptors such as hiera-eyaml-gpg, but there's no particular reason why it shouldn't
 just work so let us know if you've tried it.
 
Note that there is no explicit dependency on hiera-eyaml in this module, so if you try to use it without that gem being
available it will fall over clumsily.
 
## No warranty

This project is for internal use. You're welcome to make use of it, but we're not responsible for any problems you might
encounter.

[1]: https://github.com/TomPoulton/hiera-eyaml