// var fontSize = d3.scale.log().range([10, 100])

// var layout = cloud()
//       .size([960, 600])
//       .timeInterval(10)
//       .text(function(d) { return d.key; })
//       .font("Impact")
//       .fontSize(function(d) { return fontSize(+d.value); })
//       .rotate(function(d) { return ~~(Math.random() * 5) * 30 - 60; })
//       .padding(1)
//       .on("word", progress)
//       .on("end", draw)
//       .words([])
//       // defint words
//       .start();


// var fill = d3.scale.category20();

// d3.layout.cloud().size([300, 300])
//   .words([
//     "Hello", "world", "normally", "you", "want", "more", "words",
//     "than", "this"].map(function(d) {
//     return {text: d, size: 10 + Math.random() * 90};
//   }))
//   .padding(5)
//   .rotate(function() { return ~~(Math.random() * 2) * 90; })
//   .font("Impact")
//   .fontSize(function(d) { return d.size; })
//   .on("end", draw)
//   .start();

// function draw(words) {
//   d3.select("body").append("svg")
//       .attr("width", 300)
//       .attr("height", 300)
//     .append("g")
//       .attr("transform", "translate(150,150)")
//     .selectAll("text")
//       .data(words)
//     .enter().append("text")
//       .style("font-size", function(d) { return d.size + "px"; })
//       .style("font-family", "Impact")
//       .style("fill", function(d, i) { return fill(i); })
//       .attr("text-anchor", "middle")
//       .attr("transform", function(d) {
//         return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
//       })
//       .text(function(d) { return d.text; });
// };

