function demo()
{
	x=document.getElementById('t1').value;
        if(x==0)
        {
           	document.getElementById('password').innerHTML="" 
        }
	else if(x.length<4)
	{
	document.getElementById('password').innerHTML="Weak"
	document.getElementById('password').style.color="red"
	document.getElementById('password').style.background="black"
	}
	else if(x.length<8)
	{
	document.getElementById('password').innerHTML="Medium"
	document.getElementById('password').style.color="Yellow"
	document.getElementById('password').style.background="black"
	}
	else
	{
	document.getElementById('password').innerHTML="Strong"
	document.getElementById('password').style.color="Green"
	document.getElementById('password').style.background="black"
	}
}

function demo1()
{
    x=document.getElementById()
}