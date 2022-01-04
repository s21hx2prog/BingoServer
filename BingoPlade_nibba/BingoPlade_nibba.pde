import processing.net.*;

Client myClient;
int dataIn;


int[] kolonne = new int[3];
int[][] bankoPlade = new int[9][3];

int loop = 0;

void setup(){
  size(850,600);
  textSize(60);
  textAlign(RIGHT);
  
  for (int i = 0; i<bankoPlade.length; i++){
  kolonne = genererKolonne(i);
  bankoPlade[i] = kolonne;
  println(kolonne);
 }
 
for(int g=0; g<3; g++){ 
  int[] b=new int[4];
  b= tilfaeldige4Tal();
  b = sorter(b);
 while(findEns(b)){
    b = tilfaeldige4Tal();
   
    b=sorter(b);
 }
 //printArray(b);
 for(int i=0; i<b.length; i++)
    bankoPlade[b[i]][g]=0;
 }
 
 bpViser(bankoPlade);
 
 println("Daniel,"+textConvert(bankoPlade));
 
 myClient = new Client(this,"10.130.152.241",42069);
   myClient.write("Daniel,"+textConvert(bankoPlade));
}


  int[] genererKolonne(int i){
  int[] k = new int[3];
  
    k = tilfaeldige3Tal(i);
    k = sorter(k);
  
    while(findEns(k)){
    k = tilfaeldige3Tal(i);
    k = sorter(k);
    }
    return k;
  }


void draw(){
}


int[] tilfaeldige3Tal(int t){
    int[] col = new int[3];  
    for(int i = 0 ; i<col.length ; i++){
       col[i] = (int)random(1,11)+t*10;
    }
    return col;
}

int[] tilfaeldige4Tal(){
    int[] col = new int[4];  
    for(int i = 0 ; i<col.length; i++){
       col[i] = (int)random(0,9);
    
    }
    return col;
}

//--------------------------------------ER TALLENE ENS---------------------------------
boolean findEns(int[] tal){
  boolean ikkeEns = false;
  for(int i =0; i<tal.length-1; i++){
      if(tal[i] == tal[i+1]){
        ikkeEns = true;
      }
  }
  return ikkeEns;
} 

//--------------------------------------TAL SORTERING---------------------------------
int[] sorter(int[] tal) {
  int i=0;
  //for (int i =0; i <tal.length-1; i++) {
  while (i<tal.length-1) {
    if (tal[i]>tal[i+1]) {
      int temp = tal[i];
      tal[i]=tal[i+1];
      tal[i+1]=temp;
      i=0;
    } else {
      i++;
    }
  }
  return tal;
}

//--------------------------------------Plade-Viser---------------------------------
void bpViser(int[][] bp){
  for(int i =0;i<bp.length;i++){
    for(int j=0; j<bp[i].length;j++){
      if(bp[i][j] !=0){
        text(bp[i][j], 80+i*90,60+j*60);
      }
    }
  }  
}

String textConvert(int[][] bp){
  String s = "";
  for(int i =0;i<bp.length;i++){
    for(int j=0; j<bp[i].length;j++){
        s = s + Integer.valueOf(bp[i][j])+",";
    }
  }  
return s;
}
