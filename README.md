Filtra
====

Filtra filters arrays of tokens to be indexed.

Description
-----------

Filtra filters arrays of tokens to be indexed by [Busca](https://github.com/Porta/busca), the simple redis search. The basic filtering options include downcasing and stemming (using [fast-stemmer](https://github.com/romanbsd/fast-stemmer))

## Installation

As usual, you can install it using rubygems.

```
$ gem install filtra
```

## Usage

The simplest usage is with default options:

```ruby
filtro = Filtra.new()
words = %w(Running fishes Among the Coast line coast)
result = filtro.call(words)
puts result.inspect
#=> ["running", "fishes", "among", "the", "coast", "line"]
```

With default options, the case was changed and the word **coast** appears only once. Not really exciting, uh?.

If, for some reason you want to keep the casing, then this happens:

```ruby
filtro = Filtra.new(keep_case: true)
words = %w(Running fishes Among the Coast line coast)
result = filtro.call(words)
puts result.inspect
#=> ["Running", "fishes", "Among", "the", "Coast", "line", "coast"]
```

Now you see the word **coast** appears two times. That's because the casing.

Now, let's add some stemming to the mix.

```ruby
filtro = Filtra.new(stem: true)
words = %w(Running run fishes Among the Coast line coast)
result = filtro.call(words)
puts result.inspect
#=> ["run", "fish", "among", "the", "coast", "line"]
```

Stemming makes this a bit more interesting, thinking in indexing this later, right?

Now, let's make this *really* fun. Let's add a list of stopwords.

```ruby
filtro = Filtra.new(stopwords: Filtra.stopwords )
words = %w(this can be a nice idea that might not work)
result = filtro.call(words)
puts result.inspect
#=> ["can", "nice", "idea", "might", "work"]
```

Bundled with Filtra there's a list of common stopwords, but you can just pass your own.

```ruby
filtro = Filtra.new(stopwords: %w(this that those there))
words = %w(this can be a nice idea that might not work)
result = filtro.call(words)
puts result.inspect
#=> ["can", "be", "a", "nice", "idea", "might", "not", "work"]
```


And that's pretty much it. The code is simple, go take a look. And drop a line to julian@porta.sh if you have something to say.

