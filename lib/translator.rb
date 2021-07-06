require "yaml"
require "pry"
# require modules here

 # returns a hash 
  #  has a key for the name of each emoticon 
   # each key points to an inner hash 
    #the keys inside each inner hash are :english and :japanese 
  #  the :japanese key in each inner hash points to the respective Japanese emoticon
   # the :english key in each inner hash points to the respective English emoticon 
  #  the emoticons stored in :english and :japanese are the correct English/Japanese equivalents
 # angel:
  #- "O:)"      
  #- "☜(⌒▽⌒)☞"
#right now is key with 2 string, need to change to 
  # {
   #   'happy' => {
    #     :english => ":)",
     #    :japanese => "(＾ｖ＾)"
      #}}      
   
def load_library(data)
  emoticons = YAML.load_file(data)
  emoticon_language = {}
  emoticons.each do |key, value|
    emoticon_language[key] = {}
    #creates empty hash and inside an array with another hash so { [ {} ] } 
   # binding.pry
    emoticon_language[key][:english] = value[0]
    #creates a symbol enlglish nd assign a value to it 
    emoticon_language[key][:japanese] = value[1]
  end
  emoticon_language
end

def get_english_meaning(data, j_emoticon)
  check_emoticon = load_library(data)
 check_emoticon.each do |definition , emoticon_language|
    
    if emoticon_language[:japanese] == j_emoticon
      #binding.pry
      return definition
     end
   end
"Sorry, that emoticon was not found"
end

def get_japanese_emoticon(data, a_emoticon )
  check_emoticon = load_library(data)
   binding.pry
  check_emoticon.each do |definition, emoticon_language|
  
    if emoticon_language[:english] == a_emoticon
      return emoticon_language[:japanese]
    end
  end
 "Sorry, that emoticon was not found"
end
  