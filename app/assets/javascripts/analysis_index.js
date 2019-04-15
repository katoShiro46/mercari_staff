$(function(){
  // チャートの新規作成
  function chart(labels_names,label,data,title){
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: labels_names,
        datasets: [{
          label: label,
          data: data,
          backgroundColor: 'rgba(255, 99, 132, 1.0)',
          borderColor: 'rgba(255, 50, 132, 1.0)',
          fill: false,
        }]
      },
      options: {
        title:  {
          display: true,
          text: title,
        }
      }
    });
    $(".radio-input").on('click',function(){
      var param_1 = $('#graph_update [name=option_1]:checked').val();
      var param_2 = $('#graph_update [name=option_2]:checked').val();
      var param_3 = $('#graph_update [name=option_3]:checked').val();
      var category_select = $('#graph_update [name=option_l_category]:checked')
      if(category_select){
        param_l_category = category_select
      }
      var param_l_category = $('#graph_update [name=option_l_category]:checked').val();
      var url = $('#graph_update').attr('action');
      $.ajax({
        type: 'GET',
        url: url,
        data: {
          option_1: param_1,
          option_2: param_2,
          option_3: param_3,
          option_l_category: param_l_category},
          dataType: 'json',
          cache: false
        })
      .done(function(data){
        changeData(myChart,data.labels_names,data.label,data.data,data.title)
      })
      .fail(function(){
        alert('エラーが発生しました');
      });
    });
  }
  // チャートの値の更新
  function changeData(chart,labels_names,label,data,title) {
    chart.data.labels = labels_names;
    chart.data.datasets.forEach((dataset) => {
      dataset.label =label;
      dataset.data = data;
    });
    chart.options.title.text = title;
    chart.update();
  }

  $(document).ready(chart(gon.labels_names,gon.label,gon.data,gon.title))
});
