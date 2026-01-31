def simpleCipher(encryptString: str, k: int):
    decryptString = ""

    for string in encryptString:
        current_odinal_number = ord(string) - ord('A')
        new_odinal_number     = (current_odinal_number - k) % 26
        new_string            = chr(new_odinal_number + ord('A'))
        decryptString        += new_string
        print(f'{current_odinal_number} => {new_odinal_number} => {new_string}')
    return decryptString

Encrypt_Data = str(input('Input encrypt data: ')).upper()
K_Value = int(input('Input K value: '))
Result_Value = simpleCipher(Encrypt_Data, K_Value)
print(Result_Value)