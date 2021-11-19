#! /usr/bin/ruby

def words_from_string(string)
    string.downcase.scan(/[\w']+/)
end