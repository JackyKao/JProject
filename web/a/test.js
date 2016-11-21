
 function IDS(){
  // var polygonDataI= 
  // [
  //   {"x":20,"y":0},{"x":30,"y":25},{"x":70,"y":25},{"x":40,"y":120},{"x":20,"y":120},{"x":0,"y":145},{"x":100,"y":140},
  //   {"x":90,"y":120},{"x":60,"y":120},{"x":90,"y":25},{"x":110,"y":25},{"x":130,"y":0},
  // ];

  // var polygonDataD1=
  // [
  //   {"x":140,"y":140},{"x":110,"y":140},{"x":100,"y":120},{"x":110,"y":100},{"x":140,"y":110},{"x":140,"y":0},{"x":170,"y":0},
  // ];

  // var polygonDataD2=[
  //   {"x":180,"y":0},{"x":150,"y":140},{"x":180,"y":140},{"x":180,"y":0},{"x":240,"y":40},{"x":240,"y":100},{"x":180,"y":140},
  //   {"x":180,"y":120},{"x":220,"y":90},{"x":220,"y":60},{"x":190,"y":40},{"x":180,"y":140},
  // ]

  // var polygonDataS=[
  //   {"x":280,"y":100},{"x":250,"y":40},{"x":260,"y":10},{"x":300,"y":0},{"x":320,"y":10},{"x":350,"y":0},{"x":335,"y":40},
  //   {"x":320,"y":70},{"x":300,"y":30},{"x":280,"y":40},{"x":290,"y":70},{"x":300,"y":65},{"x":320,"y":70},{"x":340,"y":80},
  //   {"x":340,"y":100},{"x":320,"y":140},{"x":300,"y":130},{"x":30,"y":150},{"x":250,"y":140},{"x":260,"y":110},{"x":280,"y":110},
  //   {"x":270,"y":120},{"x":310,"y":120},{"x":320,"y":90},{"x":300,"y":90},{"x":280,"y":100},
  // ]
    
  d3.csv("https://jackykao.github.io/JProject/polygonDataI.csv", function(data) {
    // console.log(data);

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
  pologonWord(data,"brown");
  // pologonWord(polygonDataD1,"black");
  // pologonWord(polygonDataD2,"purple");
  // pologonWord(polygonDataS,"purple");

});}
