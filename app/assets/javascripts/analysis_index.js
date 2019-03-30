$(function(){
  var ctx = document.getElementById("myChart").getContext('2d');
  var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: gon.category_names,
          datasets: [{
              label: "サンプル",
              data: gon.category_count,
              backgroundColor: 'rgba(255, 99, 132, 1.0)',
              borderColor: 'rgba(255, 50, 132, 1.0)',
              fill: false
          }]
      },
      options: {
          title:  {
            display: true,
            text: "タイトル"
          }
      }
  });
});
