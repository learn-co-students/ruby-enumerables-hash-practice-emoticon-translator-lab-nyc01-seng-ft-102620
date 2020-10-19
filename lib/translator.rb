require 'yaml'# require modules here
require 'pry'
def load_library (data)
  start = YAML.load_file('lib/emoticons.yml')
  final_results = start.each_with_object({}) do |(k,v), new_hash|
      new_hash[k] = {english: v[0], japanese: v[1]}
  end
end

def get_japanese_emoticon (file, emoji)
  #binding.pry
  data = load_library(file)
  data.each do |k, v|
    v.each do |ik, iv|
      if iv == emoji
        return data[k][:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_english_meaning (file, emoji)
  data = load_library(file)
  data.each do |k, v|
    v.each do |ik, iv|
      if iv == emoji
        return k
      end
    end
  end
  return "Sorry, that emoticon was not found"
end
