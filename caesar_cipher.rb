def caesar_cipher(string_to_be_encoded, shift)
    # Getting the ascii values of each char
    ascii_values = string_to_be_encoded.each_byte.to_a

    # For each char, calculate its shift and return a new array
    new_shifted_string = ascii_values.map do |ascii|
        # Checking if it's a capitalized letter
        if ascii.between?(65, 90)
            # Checking if it's a left or a right shift
            if shift.positive?
                ascii + shift > 90 ? (ascii + shift) - 26 : (ascii + shift) # If it's positive and over 90, go back to 65
            else
                ascii + shift < 65 ? (ascii + shift) + 26 : (ascii + shift) # If it's negative and less than 65, go to 90
            end

        # Checking if it's a capitalized letter
        elsif ascii.between?(97, 122)
            if shift.positive?
                ascii + shift > 122 ? (ascii + shift) - 26 : (ascii + shift)
            else
                ascii + shift < 97 ? (ascii + shift) + 26 : (ascii + shift)
            end
        
        # If it's not a letter, do nothing
        else
            ascii
        end
    end

    # Convert back into characters and return a new string
    return new_shifted_string.map{|char| char.chr}.join('')
end

shifted_string = caesar_cipher('What a string!', -5)
puts shifted_string