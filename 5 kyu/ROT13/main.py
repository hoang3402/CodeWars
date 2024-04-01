def rot13(message):
    return ''.join(
        chr((ord(char) - 65 + 13) % 26 + 65) if char.isupper() else
        chr((ord(char) - 97 + 13) % 26 + 97) if char.islower() else
        char for char in message
    )

# 

def rot13(message):
    def decode(c):
        if 'a' <= c <= 'z':
            base = 'a'
        elif 'A' <= c <= 'Z':
            base = 'A'
        else:
            return c
        return chr((ord(c) - ord(base) + 13) % 26 + ord(base))
    return "".join(decode(c) for c in message)

# 

def rot13(message):
    first = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    trance = 'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm'
    return message.translate(string.maketrans(first, trance))  

# Chúa tể

def rot13(message):
    import codecs
    return codecs.encode(message, 'rot_13')