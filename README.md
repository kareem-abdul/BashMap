# BashMap
Bash script's that lets you store data as key value pairs

#install
```
git clone https://github.com/kareem-abdul/BashMap.git
chmod +x ./BashMap/setup.sh
./BashMap/setup.sh
```

#uninstall
- cd into the directory
```
chmod +x ./uninstall.sh
./uninstall.sh
```

#usage
- after installing BashMap, following commands can be used to perform key value operations
	- `hget`
	- `hput`
	- `hdel`

#hput
- hput can be used to put key value pairs
eg:
```
hput myHash key1 value1
```
the above command creates a hashmap.myHash file in your /tmp folder and stores `key1 value1` in that file

#hget
- hget can be used to get 
	- values of a particular key
	 ie, `hget myHash key1` returns value1
	- keys in a map
	 ie, `hget myHash` returns `key1`
	- available maps
	 ie, `hget` returns `myHash`

#hdel
- hdel can be used to delete data
	- keys from a map
	 ie, `hdel myHash key1` deletes `key1` entry in myHash
	- all keys in a map
	 ie, `hdel myHash` deletes all the entries in myHash (it deletes the hashmap.myHash file)
	- all the maps
	 ie, `hdel` deletes all the maps


#Note
- This map stores the key value pairs in a file located on /tmp folder, So when the use of map is over dont forget to delete it either manually or via `hdel`

