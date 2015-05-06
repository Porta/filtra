require File.expand_path("../lib/filtra", File.dirname(__FILE__))


test "Filtra::Text should filter, stem and keep case some words" do
    filtro = Filtra.new(stem: true, keep_case: true)
    words = %w(Running fishes Among the coast line coast)
    result = filtro.call(words)
    assert_equal result, %w(Run fish Among the coast line)
end


test "Filtra::Text should filter, stem and downcase some words" do
    filtro = Filtra.new(stem: true)
    words = %w(Running fishes Among the Coast line coast)
    result = filtro.call(words)
    assert_equal result, %w(run fish among the coast line)
end


test "Filtra::Text should filter and downcase some words" do
    filtro = Filtra.new(keep_case: true)
    words = %w(Running fishes Among the Coast line coast)
    result = filtro.call(words)
    assert_equal result, %w(Running fishes Among the Coast line coast)
end


test "stopwords should stop words from being indexed" do
    filtro = Filtra.new(stopwords: %w(this that those there))
    words = %w(this can be a nice idea that might not work)
    result = filtro.call(words)
    assert_equal result, %w(can be a nice idea might not work)
end

test "stopwords from Filtra.stopwords" do
    filtro = Filtra.new(stopwords: Filtra.stopwords )
    words = %w(this can be a nice idea that might not work)
    result = filtro.call(words)
    assert_equal result, %w(can nice idea might work)
end

