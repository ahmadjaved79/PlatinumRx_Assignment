text = input("Enter string: ")

result = ""

for char in text:
    if char not in result:
        result = result + char

print("Output:", result)