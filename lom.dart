import 'dart:io';
import 'dart:convert';

int men=0;
int idc;
var ilt = new List(100);
var ilt1 = new List(100);
var ilt2 = new List(100);
int cnt=0;
int tt=0;

void main() 
{ 
 print("Enter the number of users:");  	//enter the number of users
 int app = int.parse(stdin.readLineSync());


for(int i=0; i<app ; i++)
{
   addStacks c = new addStacks();   	// creating object for addStack()
   c.m1(); 				//calling method m1()
}

print("Do you want to view the content of all users:[y/n]?");
 var db = stdin.readLineSync();


if( db == 'y')
{
for(int i=0;i<cnt;i++)
{
print("\n");
print("User number:");
print(i+1);
print("idcode:"); 
print(ilt[i]);
print("Name:");
print(ilt1[i]);
print("field:");
print(ilt2[i]);
print("\n");
}
print("Total time taken by the mentors is:");
print(tt);
}

} 


class addStacks 		//addStack() class
{ 
   void m1()
{
 print("What's your name?");  
 var name = stdin.readLineSync();  // enter your name
 ilt1[cnt]=name;

 print("Enter the field:");	//enter your field
 var field = stdin.readLineSync();
 ilt2[cnt]=field;


 setMentorOrLearner d = new setMentorOrLearner();    	// creating object for setMentorOrLearner()
   d.m2(); 						//calling method m2() 

} 
}  

class setMentorOrLearner extends addStacks 	//setMentorOrLearner() class
{
   void m2()
{


 print("Are you a Mentor(M) or Learner(L)?");
 var set = stdin.readLineSync();
print("NOTE:[mentor idc value is less than 100.If id code and mentor/learner field becomes mismatch then the applicat is not valid]");
 print("Enter the idcode:");		//mentor value less than 100 and learner value greater than or equal to 100

 idc = int.parse(stdin.readLineSync());
 ilt[cnt] = idc;

 

if( idc < 100 && set =='M' || idc < 100 && set =='m')
{

  men=men+1;
 cnt=cnt+1;

 setAvailableTime e= new setAvailableTime();   	// creating object for setAvailableTime ()
 e.m3(men);	 				//calling method m3()
} 
else if(idc >= 100 && set =='L' || idc >= 100 && set =='l')
{
 cnt=cnt+1;

 getMentor f = getMentor(); 	   	// creating object for getMentor() 
   f.m4(null,men);	 		//calling method m4()

}
else
{
print("Invalid data \n enter a valid idc !\n This applicant is terminated!");
ilt[cnt]='terminated';
ilt1[cnt]='terminated';
ilt2[cnt]='terminated';
cnt=cnt+1;
}
}
}
 
class setAvailableTime extends setMentorOrLearner		//setAvailableTime() class
{
void m3(int me) 
{
 print("Set your available time [in min]:");
 int time = int.parse(stdin.readLineSync());		//Enter your time in minutes
 tt=tt+time;

   getMentor f = getMentor(); 	   	//creating object for getMentor()
   f.m4(time,me);	 		//calling method m4()

}
}

class getMentor extends setAvailableTime		//getMentor() class
{
void m4(int t,int m)					// With time and stack as parameters
{
 print("currently available mentors are:");
print(m);
print("and your time is set as:");
print(t);
print("currently total time taken by mentors is:");
print(tt);
}
}
