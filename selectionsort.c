#include <iostream>
#include <stdio.h>
#include <string.h>
#define MAX_LEN 1024

int main(){
  FILE *fp;
  char file_name[MAX_LEN];
  char whole[MAX_LEN]={0};
  char box;
  char temp;
  int i=0;
  int c=0;
  int plus=0;
  
  scanf("%s", file_name);
  
  fp = fopen(file_name, "r");
  if(fp == NULL){
    fprintf(stderr, "ERROR: file open has failed.");
    return -1;
  }
  
  while((box=fgetc(fp))!=EOF){
    whole[i]=box;
    i++;
  }
  
  for(int i=0; i<=MAX_LEN; i++){
    if(islower(whole[i])) whole[i]=toupper(whole[i]);
  }
  printf("%s",whole);
  for(int i=65; i<91; i++){
    for(int j=0; j<=MAX_LEN; j++){
    if(whole[j]==i)  c++;
    if(whole[j]=='.') continue;
  }
    temp=i;
    printf("%c: %d\n",temp,c);
    c=0;
  }
  for(int i=48; i<58; i++){
    for(int j=0; j<=MAX_LEN; j++){
    if(whole[j]==i)  c++;
  }
    temp=i;
    printf("%c: %d\n",temp,c);
    c=0;
  }
  fclose(fp);
  return 0;

}