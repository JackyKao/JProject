function wc()
{
d3.csv("https://jackykao.github.io/JProject/IPDifFood1.csv", 
  function(data)
  {
    d3.wordcloud()
      .size([500, 300])
      .fill(d3.scale.ordinal().range(["#884400", "#448800", "#888800", "#444400"]))
      .words(data)
      .start();
  });
}
