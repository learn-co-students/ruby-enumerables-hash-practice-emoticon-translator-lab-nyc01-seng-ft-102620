require 'yaml'
require 'pry'


def load_library(file_path) 
  emos = YAML.load_file(file_path)
  new_hash = {}
  emos.each do |key, value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end
  new_hash
end



def get_english_meaning(file_path, jap_emo)
  library = load_library(file_path)
  emo_hash = library.select do |term, language|
    language[:japanese] == jap_emo
  end
  #binding.pry
  if (emo_hash.keys[0] == nil)
    "Sorry, that emoticon was not found"
  else
  emo_hash.keys[0]
end
end




def get_japanese_emoticon(file_path, eng_emo)
  library = load_library(file_path)
  match = library.select do |top, inner|
    inner[:english] == eng_emo
    end
  if match.keys[0] == nil
    "Sorry, that emoticon was not found"
  else
  match.values[0][:japanese]
end
end