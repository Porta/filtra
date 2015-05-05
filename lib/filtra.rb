class Filtra
    
    Dir[File.dirname(__FILE__) + '/Filtra/*.rb'].each {|file| require file }

    attr_reader :filtro

    def initialize(filtro = Filtra::Text, opts = {})
        if filtro.respond_to?(:call)
            @filtro = filtro
            @opts = opts
        else
            @filtro = Filtra::Text
            @opts = filtro
        end
    end

    def call(words)
        @filtro.call(words, @opts)
    end


end