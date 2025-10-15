function[x,n]=impulseSequence(n0,n1,n2)
 n=[n1:n2]; 
x=[(n-n0)==0];
 end
 ---------------------- 
n0=4;
 n1=1; 
n2=20;
 n=[n1:n2]; 
x=[n==n0]; 
stem(n,x);
 xlabel('n'); 
ylabel('Amplitude');
 title('Unit Impulse Sequence');



function[x,n]=StepSequence(n0,n1,n2) 
n=[n1:n2]; 
x=[(n-n0)>=0];
 end
 ------------------- 
n0=3; 
n1=1; 
n2=20; 
n=[n1:n2]; 
x=[(n-n0)>=0]; 
stem(n,x);
 xlabel('n'); 
ylabel('Amplitude');
 title('Unit Step Sequence');




function[x,n]=UnitRampSequence(n1,n2) 
n=[n1:n2];
x=n; 
end 
-------------------
 x=n; 
 n1=3; 
n2=20;
n=[n1:n2]; 
x=n; 
stem(n,x);
 xlabel('n'); 
ylabel('Amplitude');
 title('Unit Ramp Sequence');
