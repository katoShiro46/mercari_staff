$(function(){
  function chart(){
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: gon.labels_names,
        datasets: [{
          label: gon.label,
          data: gon.data,
          backgroundColor: 'rgba(255, 99, 132, 1.0)',
          borderColor: 'rgba(255, 50, 132, 1.0)',
          fill: false
        }]
      },
      options: {
        title:  {
          display: true,
          text: gon.title
        }
      }
    });
  }
  chart()
  // // ajax通信を用いて項目ごとのグラフを作成
  // $(".graph").on('click',function(e){
  //   e.preventDefault();
  //   var category_id = $(this).attr('id');
  //   var url =$(this).attr('action');
  //   $.ajax({
  //     type: 'GET',
  //     url: url,
  //     data: {id:category_id},
  //     dataType: 'json'
  //   })
  //   .done(function(){
  //     console.log(category_id);
  //     // chart()
  //   })
  //   .fail(function(){
  //     alert('だめ');
  //   });
  // });
});
