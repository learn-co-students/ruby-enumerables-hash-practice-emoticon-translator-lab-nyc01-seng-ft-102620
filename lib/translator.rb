# require modules here
require 'yaml'
require 'pry'



def load_library(file_path)
  file_path = YAML.load_file('lib/emoticons.yml')
  file_path.each_with_object({}) do |(key, value), final_array|
    if !final_array[key]
      final_array[key] = {:english => value[0], :japanese => value[1]}
      # binding.pry
    end 
  end 
end

def get_english_meaning(file_path, emoticon)
  emotions = load_library(file_path)
  emotions.each do |key, value|
    if emotions[key][:japanese] == emoticon 
      return key
    end
  end 
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, emoticon)
  emotions = load_library(file_path)
  # binding.pry
  emotions.each do |key, value| 
    if emotions[key][:english] == emoticon
      return emotions[key][:japanese]
    end 
  end 
  return "Sorry, that emoticon was not found"
end

