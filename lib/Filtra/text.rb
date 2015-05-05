class Filtra
    module Text
        require 'fast-stemmer'

        def self.call(words, opts)
            out = []
            keep_case = opts[:keep_case] || false
            stem = opts[:stem] || false
            # keep case
            # stemm
            words.each do |word|
                word.downcase! unless keep_case                
                out.push( stem ? word.stem : word)
            end
            out.uniq
        end
    end
end