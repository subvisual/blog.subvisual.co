# Blue

Subvisual's UI Kit.

## Install

### Via git submodule

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

### Via pre-compiled distributables

A pre-compiled version exists under `dist/`, with normal and minified versions of the CSS and JS libraries.

You can import them directly using the following URLs:

```
https://raw.githubusercontent.com/subvisual/blue/master/dist/blue.css
https://raw.githubusercontent.com/subvisual/blue/master/dist/blue.js
```

## Usage

Regular git submodule usage. Learn about it [here](https://chrisjean.com/git-submodules-adding-using-removing-and-updating/).

### Navbar Images

To load the logo in the navbar you need to setup the following variables before including blue.

```
$NavLogo-mobile-colored: image-path('blue/subvisual_logo_no_name.svg');
$NavLogo-mobile-mono: image-path('blue/subvisual_logo_mono_no_name.svg');
$NavLogo-desktop-colored: image-path('blue/subvisual_logo_with_name.svg');
$NavLogo-desktop-mono: image-path('blue/subvisual_logo_mono_with_name.svg');

@import 'blue';
```

Note the `image-path`, this is an example using sprockets. You must change the value to match your setup.
