def getdata():
    with open('es/data.txt') as f:
        content = f.readlines()
        return content
