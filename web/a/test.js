 function IDS(){    
  var polygonDataI="https://jackykao.github.io/JProject/web/a/polygonDataI.csv";
  var polygonDataD1="https://jackykao.github.io/JProject/web/a/polygonDataD1.csv";
  var polygonDataD2="https://jackykao.github.io/JProject/web/a/polygonDataD2.csv";
  var polygonDataS="https://jackykao.github.io/JProject/web/a/polygonDataS.csv";
  function pologonWord(I,color)
  {
   //var svgrect = d3.select("body").append("svg")
       //.attr("height",320)
       //.attr("width",130);
   var polygonFunction = d3.line()
         .x(function(d) { return d.x; })
         .y(function(d) { return d.y; });
   var pologon = svgrect.append("path")
        .attr("d",polygonFunction(I))
        .attr("stroke","none")
        .attr("fill",color)
        .attr("stroke-width",1)
  }
  
  var svgrect = d3.select(".featured").append("svg")
       .attr("height",170)
       .attr("width",460);
  
  d3.csv(polygonDataI, function(data) {
   
   pologonWord(data,"brown");
   
  });
  
  d3.csv(polygonDataD1, function(data) {

    pologonWord(data,"black");

  });
  d3.csv(polygonDataD2, function(data) {

    pologonWord(data,"purple");

  });
  d3.csv(polygonDataS, function(data) {

    pologonWord(data,"purple");
  });
  
//    d3.csv(polygonDataI,polygonDataD1,polygonDataD2,polygonDataS, function(data,data1,data2,data3) {
   
//    pologonWord(data,"brown");
//     pologonWord(data1,"black");
//     pologonWord(data2,"purple");
//     pologonWord(data3,"purple");
   
//   });
  
 
}
