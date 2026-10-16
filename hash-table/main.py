'''
Hash Table.
Storing a key-value pairs on its hashing index. The hashing index is the sum of the given key's (string) unicode value.
Example: 'fcc', as a key, has unicode of f (102), c(92), c(92). The sum is 300 will be stored as the hashing index.
The collection will be {300: {'fcc': [value]}}
'''
class HashTable:
    def __init__(self):
        self.collection = {}

    # hash method return the sum of each character unicode from the given string     
    def hash(self, string: str) -> int:
        # sum unicode of given string
        uni_sum = 0
        for char in string:
            uni_sum += ord(char)
        return uni_sum

    # add method is adding the key-value pairs to the collection as the value on the total hash unique key. 
    def add(self, key: str, value: str) -> None:
        # determine the hash value of the key
        key_hash = self.hash(key)

        # add key-value to an already existing hash key
        for index, hash_dict in self.collection.items():
            if index == key_hash:
                hash_dict.update({key: value})
                print(self.collection)
                return
        
        # add key-value to a new hash_key when its first added 
        self.collection[key_hash] = {key: value}
        print(self.collection)

    # removing the given key from the collection
    def remove(self, key: str) -> None:
        # determine the key_hash
        key_hash = self.hash(key)

        # check whether the key_hash is in the collection
        if not key_hash in self.collection:
            # print(f"key: {key_hash} is not found in the collection")
            return

        # Addition to return None when key is not found on key_hash. To pass the test settings.  
        term_second = False
        for i in self.collection[key_hash]:
            if i == key:
                term_second = True
        
        if not term_second:
            return None
        ########################

        # removing the key-value when there is > 1 key-value pairs on hash dict.
        if len(self.collection[key_hash]) > 1:
            self.collection[key_hash].pop(key, None)
            # print(self.collection)
            return
        
        # remove entire hash_key key when there is only 1 key-value pairs in hash_key value dict.
        self.collection.pop(key_hash, None)
        # print(self.collection)
            

    def lookup(self, key: str) -> None:
        # determine the hash_key of given key
        key_hash = self.hash(key)

        # return the value of the given key
        if not key_hash in self.collection:
            return None
        
        for key_i in self.collection[key_hash]:
            if key == key_i:
                return self.collection[key_hash][key]
        
        return None

        


# Main
first = HashTable()
first.add("fcc", "rose")
first.add("ccc", "eru")
first.add("cfc", "chemical")
first.add("rose", "flower")
first.add("ores", "power")
first.remove("rose")
print("------------")
first.remove("cfc")
print(first.collection)
print("------------")
print(first.hash('golf'))
print(first.lookup("ccc"))
