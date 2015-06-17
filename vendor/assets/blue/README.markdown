# Blue

Subvisual's UI Kit.

## Install

Create the submodule's directory:

```bash
$ git submodule add git@github.com:groupbuddies/blue.git vendor/blue
```

Add the submodule to sprockets (optional):

**Middleman**

```ruby
# config.rb
after_configuration do
  %w(javascripts stylesheets images).each do |dir|
    sprockets.append_path File.join "#{root}", "vendor/blue/#{dir}"
  end
end
```

**Rails**

```ruby
# config/initliazers/assets.rb

%w(javascripts stylesheets images).each do |dir|
  Rails.application.config.assets.paths << Rails.root.join('vendor, 'assets, 'blue', dir)
end
```

## Usage

Regular git submodule usage. Learn about it [here](https://chrisjean.com/git-submodules-adding-using-removing-and-updating/).

### Navbar Images

To load the logo in the navbar you need to setup the following variables before including blue.

```
$NavLogo-mobile-colored: image-path('subvisual_logo_no_name.svg');
$NavLogo-mobile-mono: image-path('subvisual_logo_mono_no_name.svg');
$NavLogo-desktop-colored: image-path('subvisual_logo_with_name.svg');
$NavLogo-desktop-mono: image-path('subvisual_logo_mono_with_name.svg');

@import 'blue';
```

Note the `image-path`, this is an example using sprockets. You must change the value to match your setup.
