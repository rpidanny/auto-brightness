
int current=0,previous=0;

void setup(){

Serial.begin(9600);  
  
}

void loop(){
    int sum=0,avg=0;
    for(int i=0;i<10;i++){
      sum+=analogRead(0);
      delay(40);
    }
    avg=sum/10;
    avg=constrain(avg,0,330);
    current=map(avg,0,320,0,10);
    
    if(current!=previous){
      Serial.println(current);
      previous=current;
    }
}
