# C++ with Flex and Bison
Calculator grammar using Flex and Bison

To execute the sample run the `./run.sh` file.

```
$ ./run.sh 
evaluar(1+3);

 evaluation response:  4

 ```


 Instructions inside of the `run.sh` file:

 ```
 #!/bin/bash

flex calculator.l
bison -d calculator.y
gcc  calculator.tab.c lex.yy.c
./a.out
```