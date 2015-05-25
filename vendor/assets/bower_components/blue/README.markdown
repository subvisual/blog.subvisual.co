# Blue

Subvisual's UI Kit.

## Install

Create the submodule's directory:

```bash
$ git submodule add git@github.com:groupbuddies/blue.git
```

Add the submodule to sprockets (optional):

**Middleman**

```ruby
# config.rb
after_configuration do
  if File.exist? "blue"
    sprockets.append_path File.join "#{root}", "blue"
  end
end
```

## Usage

Regular git submodule usage. Learn about it [here](https://chrisjean.com/git-submodules-adding-using-removing-and-updating/).
