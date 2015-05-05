# encoding: utf-8

Gem::Specification.new do |s|
  s.name              = "filtra"
  s.version           = "0.0.1"
  s.summary           = "Filtra filters an array of tokens to be indexed"
  s.description       = "Filtra filters an array of tokens or words so they can be indexed by Busca, the simple redis search"
  s.authors           = ["Julián Porta"]
  s.email             = ["julian@porta.sh"]
  s.homepage          = "https://github.com/Porta/filtra"
  s.files             = `git ls-files`.split("\n")
  s.license           = "MIT"
  s.add_development_dependency "cutest", '~>1.2'
  s.add_runtime_dependency "fast-stemmer", '~>1.0'
end
