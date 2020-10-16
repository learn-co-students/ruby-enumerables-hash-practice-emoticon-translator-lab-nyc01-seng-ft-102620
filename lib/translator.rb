require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_language = {}
  emoticons.each do |key, value|
    emoticon_language[key] ={}
    emoticon_language[key][:english] = value[0]
    emoticon_language[key][:japanese] = value[1]
  end
  emoticon_language
end

def get_english_meaning(path, emoticon)
  library_check = load_library(path)
  english_meaning = nil
  message = "Sorry, that emoticon was not found"
  library_check.each do |meaning, emoticon_language|
    emoticon_language.each do |language, face|
      if emoticon == face 
        english_meaning = meaning
      end
    end
  end
    if english_meaning == nil
        english_meaning = message
    end
  english_meaning
end 

def get_japanese_emoticon(path, emoticon)
  check_emoticon = load_library(path)
  japanese_emoticon = nil 
  message = "Sorry, that emoticon was not found"
  check_emoticon.each do |meaning, emoticon_language|
    emoticon_language.each do |language, face|
      if emoticon == face
        japanese_emoticon = emoticon_language[:japanese]
      end
    end 
  end
    if japanese_emoticon == nil
      japanese_emoticon = message
    end
  japanese_emoticon
end 