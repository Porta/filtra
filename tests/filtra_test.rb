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
