require "yaml"
require "pry"

def load_library(lib)
  emotlib = {}
  yaml = YAML.load_file(lib)
  yaml.map { |type, emots|
    emotlib[type] = {:english => emots[0], :japanese => emots[1]}
    #type = "angel"
    #emots = ["O:)", "☜(⌒▽⌒)☞"]
  }
  emotlib
  #{"angel"=>{:english=>"O:)", :japanese=>"☜(⌒▽⌒)☞"}, "angry"...
end

def get_japanese_emoticon(yaml, emot)
  #emot = "(￣ー￣)"
  lib = load_library(yaml)
  binding.pry
  lib.map { |type, emots|
    #type = "smile"
    #emots = {:english=>"=D", :japanese=>"(￣ー￣)"}
    emots.map { |lang, langemot|
      #lang = :english
      #langemot = "=D"
      return emots[:japanese] if emot === langemot
    }
  }
  return "Sorry, that emoticon was not found"
end

get_japanese_emoticon("lib/emoticons.yml", "=D")
#Should return "(￣ー￣)"

def get_english_meaning(yaml, emot)
  #emot = "☜(⌒▽⌒)☞"
  lib = load_library(yaml)
  lib.map { |type, emots|
    #type = "angel"
    #emots = ["O:)", "☜(⌒▽⌒)☞"]
    emots.map { |lang, langemot|
      #lang = :english
      #langemot = O:)
      return type if emot === langemot
    }
  }
  return "Sorry, that emoticon was not found"
end

