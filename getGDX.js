// <!DOCTYPE html>
// <html>
// <head>
// <style type="text/css">
// .pathline {
// 	stroke-width: 3;
// 	fill: none;
// }
// #open {
// 	stroke: red;
// }
// #high {
// 	stroke: blue;
// }
// #low {
// 	stroke: green;
// }
// #close {
// 	stroke: black;
// }
// </style>
// <script src="https://d3js.org/d3.v4.min.js"></script>
// // </head>
// // <body>
// <script type="text/javascript">
function aaa(){
var width  = 1024;
var height = 768; 
d3.csv("https://jackykao.github.io/JProject/table.csv", function(data) {
	console.log(data);
	data.forEach(function(d) {
		console.log(d.Open);
	});
	var maxy = d3.max(data, function(d) { return d.Open; });

	var ln = data.length;
	var ctrl  = d3.select(".newsletter").append("svg").attr("width", width).attr("height", height);
	var lines = d3.line().
	x(function(d,i){ return i * (width/ln); }).
	y(function(d){ return d.Open * (height/maxy); });

	var lines1 = d3.line().
	x(function(d,i){ return i * (width/ln); }).
	y(function(d){ return d.High * (height/maxy); });	
	var lines2 = d3.line().
	x(function(d,i){ return i * (width/ln); }).
	y(function(d){ return d.Low * (height/maxy); });	
	var lines3 = d3.line().
	x(function(d,i){ return i * (width/ln); }).
	y(function(d){ return d.Close * (height/maxy); });

	ctrl.append("path").data([data]).
	attr("class", "pathline").
	attr("id", "open").
	attr("d", lines);

	ctrl.append("path").data([data]).
	attr("class", "pathline").
	attr("id", "high").
	attr("d", lines1);

	ctrl.append("path").data([data]).
	attr("class", "pathline").
	attr("id", "low").
	attr("d", lines2);

	ctrl.append("path").data([data]).
	attr("class", "pathline").
	attr("id", "close").
	attr("d", lines3);

});}