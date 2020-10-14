# require modules here
require 'pry'
require 'yaml'


def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)

  final_emoticons = emoticons.each_with_object({}) do |(key,value), final_hash|
    value.each do |mixed_emoji|
      if !final_hash[key]
        final_hash[key] = { }
      end
      if !final_hash[mixed_emoji] && emoticons[key].find_index(mixed_emoji) < 1
        final_hash[key][:english] = mixed_emoji
      end
      if !final_hash[mixed_emoji] && emoticons[key].find_index(mixed_emoji) >= 1
        final_hash[key][:japanese] = mixed_emoji
      end
    end
  end
end


def get_english_meaning(file_path, japanese_emoticon)
  load_library = load_library(file_path)
emoji_array = []

load_library.each do |key, value|
  value.each do |language, emoji|
    emoji_array << load_library[key][:japanese]
  if value.has_value?(japanese_emoticon)
   translated_value = load_library.key(value)
   return translated_value
    end
  end
  end 
  
  if !emoji_array.include? japanese_emoticon
    return "Sorry, that emoticon was not found"
  end 
  
end

def get_japanese_emoticon(file_path, english_emoticon)
   load_library = load_library(file_path)
   emoji_array = []
   
   load_library.each do |key, value|
     value.each do |language, emoji|
       emoji_array << load_library[key][:english]
       if value.has_value?(english_emoticon)
         japanese_result = load_library[key][:japanese]
          return japanese_result
       end
 end
 end
 
    if !emoji_array.include? english_emoticon
    return "Sorry, that emoticon was not found"
  end
   
end

