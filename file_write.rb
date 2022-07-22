require 'humanize'
class FileWrite
    def write_words_to_new_file
        File.open("in.txt") do |f|
            out = File.open("out.txt", "w+")
            while record = f.gets()
                out.puts record.gsub(/\d+/) { |d| d.to_i.humanize }
            end
            out.close
        end
    end
end
fileWrite = FileWrite.new
fileWrite.write_words_to_new_file

