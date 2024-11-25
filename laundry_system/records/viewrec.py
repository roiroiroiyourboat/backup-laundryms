try:
    filename = 'file1.txt'
    file = open(filename, "x")
    print(filename + " successfullt created.")
except: 
    print(filename + " already exists.")