#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <ctype.h> 

// Making a dnd dice roller
// added multiple rolls, no modifiers yet 
// main --> tree --> rolld
int die,mult;
char input[40];

int rolld(int max, int mult) {
  
  int roll=0;

  if (max == 0){ printf("no such thing as a d0\n");}
  else {
  for(int i = 1; i<mult+1; i++){
    int x = (rand() % max) + 1;
    printf("roll #%d: %d\n", i, x);
    roll += x; 
  }
  printf("total: %d\n", roll);
  } 
}

int get_int_len (int value){
  int l=1;
  while(value>9){ l++; value/=10; }
  return l;
}

void tree(){
  
  printf("!>");
  scanf("%s", &input);
  if (isdigit(input[0]) > 0){
    if(input[get_int_len(atoi(input))] == 'd' && isdigit(input[get_int_len(atoi(input))+ 1]) > 0){
      mult = atoi(strtok(input, "d"));
      die = atoi(strtok(NULL, "d"));
      rolld(die, mult);   
    }
    else {
      printf("not a command\n");
    }
  }
  else {
    //without multiplier
    if (input[0] == 'q') {
      exit(1);
    }
    else if (input[0] == 'd' && isdigit(input[1]) > 0){
      die = atoi(strtok(input, "d"));
      rolld(die, 1);
    }
    else {
      printf("not a command\n");
    }
  }
}

int main(int argc, char *argv[]){
  
  srand(time(NULL));
  while(1){tree();}  
  return 0;
}  
