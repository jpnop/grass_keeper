#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/* 
1. 시작-파일읽어오기0
2. 무한반복
 1)메뉴를선택
 2)메뉴로그인
 3)메뉴회원가입
 4)메뉴로그아웃
 5) 메뉴종료
3. 파일새로저장하고 끝  
*/
typedef struct login{
  char id[20];
  char password[20];
}LOGIN;
LOGIN* userlist[100]={0};
int ask_menu(int x);
void join();
void login();
void logout();
int count=0;
int is_login=0;

int main() {
  //데이터셋을 먼저 고민
  //메모리 절약을 위하여 효율적으로 포인트로 생성 //사용자목록
  FILE *fp=NULL;
  fp=fopen("member.txt","r");//read file
  if(fp==NULL){ printf("no file yet\n");}
  else{
    while(!feof(fp)){
    userlist[count]=(LOGIN*)malloc(sizeof(LOGIN));
    fscanf(fp,"%s\t%s\n", userlist[count]->id,userlist[count]->password);
    count ++;
  }
  fclose(fp);
}

 //로그인 여부 0 NO, 1 YES
 while(1){
    int menu_id=ask_menu(is_login);
    if(menu_id==1) join();
    else if (menu_id==2) login();
    else if (menu_id==3) logout();
    else break;
  }
  printf("Good bye~\n");
  fp=fopen("member.txt","w");
  for(int i=0; i<count; i++){
    fprintf(fp, "%s\t%s", userlist[i]->id, userlist[i]->password);
  }
  fclose(fp);
  fp=fopen("member.txt","w");
  for(int i=0; i<count; i++){
    fprintf(fp, "%s\t%s\n", userlist[i]->id,userlist[i]->password);
  }
  return 0;
}

int ask_menu(int x){
  int press;
  if(x==0) {
    
    printf("Join? input 1\nLogin? input 2\nExit this program? input 0\n");
    scanf("%d",&press);
    }
  else if(x==1){
    printf("Log out of here? input 3\nExit this program? input 0\n");
    scanf("%d", &press);
  }
  return press;
}


void join(){
 LOGIN* joinus=(LOGIN*)malloc(sizeof(LOGIN));
 int rep=0;
 do{
   rep=0;
 printf("Input id you want to make: less than 30 words\n");
 scanf("%s", joinus->id);
 for(int i=0; i<count; i++){
  if(!strcmp(userlist[i]->id,joinus->id)){
   printf("Try other id\n");
   rep=1;
  }
 }
 }while(rep==1);
    userlist[count]=(LOGIN*)malloc(sizeof(LOGIN));
    printf("Input password\n");
    scanf("%s",userlist[count]->password);
    strcpy(userlist[count]->id,joinus->id);
    count++;
    
}



void login(){
  int rep=0;
  
  LOGIN* want_login=(LOGIN*)malloc(sizeof(LOGIN));
  do{
  printf("What is your id?");
  scanf("%s",want_login->id);
  for(int i=0; i<count; i++){
    if(!strcmp(userlist[i]->id, want_login->id)){
      rep=1;
      do{
      printf("Input password:");
      scanf("%s",want_login->password);
      if(!strcmp(userlist[i]->password,want_login->password)) {
        printf("Say hello!\n");
        is_login=1;
      break;
    }
    else {
      printf("Does NOT match to your id. try again.\n");
      continue;
    }
    }while(is_login==0);
  }
  }
  if(is_login==1) break;
  printf("There is no such id. please try again.\n");
}while(rep==0);
}

void logout(){
  printf("LOG OUT~!\n");
  is_login=0;
}
