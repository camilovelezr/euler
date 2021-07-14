with open('words.txt') as file:
    txt = file.read().replace("'\'", '').replace('"', '').split(',')

txt = [x + '\n' if x != txt[-1] else x for x in txt]

with open('words.txt', 'w') as file:
    file.writelines(txt)