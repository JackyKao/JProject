 function IDS(){    
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
  
  d3.csv("https://jackykao.github.io/JProject/web/a/polygonDataI.csv", function(data) {
   pologonWord(data,"brown");
  // pologonWord(polygonDataD1,"black");
  // pologonWord(polygonDataD2,"purple");
  // pologonWord(polygonDataS,"purple");

  });
 
}
