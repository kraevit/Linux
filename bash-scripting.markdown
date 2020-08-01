### SHEBANG
```bash
#!/bin/bash
```

### echo COMMAND
```bash
echo "Hello World"
```

### Variables
### Uppercase by convention
### Letters, numbers, underscores
```bash
MY_NAME="Horrow"
echo "My name is $MY_NAME"
echo "My name is ${MY_NAME}"
```

### User Input
```bash
read -p "Enter your name: " YOUR_NAME
echo "Hello ${YOUR_NAME}, nice to meet you!"
```

### Conditionals

### Simple If Statemnt
```bash
if [ "${MY_NAME}" == "Horrow" ]; then
	echo "Your name is Horrow"
fi
```

### If-Else
```bash
if [ "${MY_NAME}" == "Horrow" ]; then
	echo "Your name is Horrow"
else
	echo "Your name is not Horrow"
fi
```

### Else If (elif)
```bash
if [ "${MY_NAME}" == "Horrow" ]; then
	echo "Your name is Horrow"
elif [ "${MY_NAME}" == "Jack" ]; then
	echo "Your name is Jack"
else
	echo "Your name is not Horrow"
fi
```

### Comparison
```bash
NUM1=3
NUM2=5

if [ "${NUM1}" -gt "${NUM2}"]; then
	echo "${NUM1} is greater than ${$NUM2}"
else
	echo "${NUM1} is less than ${$NUM2}"
fi

###########
# val1 -eq val2 Returns true if the values are equal
# val1 -ne val2 Returns true if the values are not equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2 
# val1 -lt val2 Returns true if val1 is lower than val2
# val1 -le val2 Returns true if val1 is lower than or equal to val2s
###########
```

### File Conditions
```bash
FILE="text.txt"

if [ -f "${FILE}"]; then
	echo "${FILE} is a file"
else
	echo "${FILE} is NOT a file"
fi

###########
# -d file True if the file is a directory
# -e file True if the file exists ( note that this is not particularly portable, thus -f is genrally used )
# -f file True if the provided string is a file
# -r file True if the file is readble
# -s file True if the file has a non-zero size
# -u file True if the user id is set on a file
# -w file True if the file is writable
# -x file True if the file is an executable
###########
```

### Case Statement
```bash
read -p "Are you 21 or older? Y/N " ANSWER

case "${ANSWER}" in
	[yY] | [yY][eE][sS]) # | means OR
		echo "You can have a beer :)"
		;;
	[nN] | [nN][oO]) # | means OR
		echo "Sorry, no drinking"
		;;
	*) # DEFAULT CASE
		echo "Please enter y/yes or n/no"
		;;
esac
```

### Simple for Loop
```bash
NAMES="BRAD Kevin Alice MARK"
for NAME in $NAMES
	do
		echo "Hello $NAME"
done
```

### RENAMING FILES WITH FOR LOOP

```bash
touch 1.txt 2.txt 3.txt

FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES
	do
		echo "Renaming $FIlE to new-$FILE"
		mv $FILE $NEW-$FILE
done
```

### WHILE Loops: READ trough a file line by line
```bash
LINE=1
while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
		((LINE++))
done < "./new-1.txt"
```

### Functions
```bash
function sayHello() {
	echo "Hello Wolrd"
}

sayHello
```

### Function with Params
```bash
function greet() {
	echo "Hello, Iam $1 and im $2"
}

greet "Brad" "25"
```

### CREATE FOLDER AND WRITE TO A FILE
```bash
mkdir hello
touch "hello/world.txt"
echo "Hello World!" >> "hello/world.txt"
echo "Created hello/world.txt"
```
### END
