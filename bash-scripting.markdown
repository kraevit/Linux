### SHEBANG
```bash
#!/bin/bash
```

### echo COMMAND
```bash
echo "Hello World"
```

### Variables
#### Uppercase by Convention
#### Letters, Numbers, Underscores
```bash
FIRST_NAME="Krasimir"
echo "My Name is $FIRST_NAME" # Bash Syntax
echo "My Name is ${FIRST_NAME}"  # JacaSript like Syntax
```

### User Input
```bash
read -p "Enter Your Name: " YOUR_NAME
echo "Hello $YOUR_NAME, Nice to Meet You!"
```

### CONDITIONALS

### SIMPLE IF STATEMENT
```bash
if [[ "$YOUR_NAME" == "Pesho" ]]; then
  echo "Your Name is Pesho!"
fi
```

### IF-ELSE
```bash
if [[ "$MY_NAME" == "Horrow" ]]; then
  echo "Your Name is Horrow"
else
  echo "Your Name is NOT Horrow"
fi
```

### ELIF
```bash
if [[ "$YOUR_NAME" == "Pesho" ]]; then
  echo "Your Name is Pesho"
elif [[ "$YOUR_NAME" == "Lesho" ]]; then
  echo "Your Name is Lesho"
else
  echo "Your Name is not Horrow"
fi
```

### COMPARISON
```bash
NUM1=3
NUM2=5

if [[ "$NUM1" -gt "$NUM2" ]]; then
  echo "$NUM1 is Greater than $NUM2"
else
  echo "$NUM1 is Less than $NUM2"
fi

# val1 -eq val2 Returns true if the values are equal
# val1 -ne val2 Returns true if the values are not equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2 
# val1 -lt val2 Returns true if val1 is lower than val2
# val1 -le val2 Returns true if val1 is lower than or equal to val2s
```

### FILE CONDITIONS
```bash
FILE="text.txt"

if [[ -f "$FILE" ]]; then
  echo "$FILE is a File :)"
else
  echo "$FILE is NOT a File ;("
fi

# -d file True if the file is a directory
# -e file True if the file exists ( note that this is not particularly portable, thus -f is genrally used )
# -f file True if the provided string is a file
# -r file True if the file is readble
# -s file True if the file has a non-zero size
# -u file True if the user id is set on a file
# -w file True if the file is writable
# -x file True if the file is an executable
```

### CASE STATEMENT
```bash
read -p "Are You 18 or Older? Y/N " ANSWER
case "$ANSWER" in
  [yY] | [yY][eE][sS]) # yY OR yYeEsS
    echo "You can have a Beer!"
    ;; # Break
  [nN] | [nN][oO]) # nN OR nNoO
    echo "Sorry, NO Drinking!"
    ;; # Break
  *) # Default
    echo "Please Enter y/yes or n/no"
    ;; # Break
esac # THE END OF BLOCK
```

### SIMPLE FOR LOOP
```bash
NAMES="BRAD Kevin Alice MARK"
for NAME in $NAMES; do
  echo "Hello $NAME"
done
```

### RENAMING FILES WITH FOR LOOP

```bash
touch 1.txt 2.txt 3.txt

FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES; do
  echo "Renaming $FIlE to new-$FILE"
  mv $FILE $NEW-$FILE
done
```

### WHILE LOOPS - READ TROUGH A FILE LINE BY LINE
```bash
#
# ..................................../ :) :) :)
LINE=1
while read -r CURRENT_LINE; do
  echo "$LINE: $CURRENT_LINE"
  ((LINE++))
done < "./new-1.txt"
```

### FUNCTIONS
```bash
function sayHello() {
  echo "Hello Wolrd"
}

sayHello # Function Invocation! # Notice not using ();
```

### FUNCTION WITH PARAMETERS
```bash
function greet() {
  echo "Hello, Iam $1 and im $2" # Numbered Parameters
}

greet "Brad" "25" # Function Invocation! and Passing Parameters As Input / YES :D
```

### CREATE FOLDER AND WRITE TO A FILE
```bash
mkdir hello
touch "hello/world.txt"
echo "Hello World!" >> "hello/world.txt"
echo "Created hello/world.txt"
```
