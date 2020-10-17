# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  # code goes here
  library = YAML.load_file(file)
  new_library = {}
  library.each do |translation, value|
    new_library[translation] = {"english": value[0], 
    "japanese": value[1]}
    end 
  new_library
end

def get_english_meaning(file, emoticon)
  # code goes here
  new_library = load_library(file)
  library = YAML.load_file(file)
  new_library = {"meaning" => {},
                 "emoticon" => {}}
   library.each do |translation, value| 
     new_library["meaning"][value[1]] = translation 
     new_library["emoticon"][value[0]] = value[1]
   end 
     english = new_library["meaning"][emoticon]
     english ? english : "Sorry, that emoticon was not found"
end 

def get_japanese_emoticon(file, emoticon)
  # code goes here 
  new_library = load_library(file)
  library = YAML.load_file(file)
  new_library = {"meaning" => {},
                 "emoticon" => {}}
   library.each do |translation, value| 
     new_library["meaning"][value[1]] = translation 
     new_library["emoticon"][value[0]] = value[1]
   end 
     japanese = new_library["emoticon"][emoticon]
     japanese ? japanese : "Sorry, that emoticon was not found"
 end