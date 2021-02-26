window.addEventListener('load', function (){
  const topStr = document.getElementById("top-str");

  topStr.addEventListener('mouseover', function(){
    document.getElementById("top-str").innerHTML="Welcome";
  })

  topStr.addEventListener('mouseout', function(){
    document.getElementById("top-str").innerHTML="MOTIVATE";
  })
})
