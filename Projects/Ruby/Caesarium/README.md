# Caesarium
#### Caesar cipher endcoder/decoder

###### Installation
1. Download [Ruby](https://www.ruby-lang.org)
1. Open project directory
1. Run `bundle install` in your terminal

###### CLI
```
ruby main.rb
```

###### Command Line Arguments
```
ruby main.rb <string> <shift>
```

- Shift "Hello There!" by 2

```
> ruby main.rb "Hello There!" 2
Jgnnq Vjgtg!

```

- Decoding

```
> ruby main.rb "Jgnnq Vjgtg!" -2
Hello There!

```