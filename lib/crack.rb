require_relative './date_key'
require_relative './decrypt'

class Crack
  attr_accessor :encrypted_filename, :output_filename, :date

  def initialize(encrypted_filename, output_filename, date)
    self.encrypted_filename = encrypted_filename
    self.output_filename = output_filename
    self.date = date
    @known_message = "..end.."
  end

  def crack
    10000.upto(99999) do |key|
      decrypt = Decrypt.new(encrypted_filename, output_filename, key, date)
      if decrypt.decrypted_message[-7..-1] == @known_message
        @cracked_key = key.to_s
        decrypt.write_decrypted_message
        break
      end
    end
    @cracked_key
  end

  def cracked_key
    @cracked_key
  end

end

if __FILE__ == $0
  # this will only run if the script was the main, not load'd or require'd
  crack = Crack.new(ARGV[0], ARGV[1], ARGV[2])
  if crack.crack != nil
    puts "Created '#{crack.output_filename}' with the cracked key #{crack.cracked_key} and date #{crack.date}"
  else
    puts "Could not crack."
  end
end

