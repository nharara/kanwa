import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts';

// Connects to data-controller="heatmap"
export default class extends Controller {
  static values={keys: Array, datas: Array}
  static targets=["heatmap", "pie", "donut"]
  connect() {
    console.log(this.keysValue, this.datasValue)
    function generateData(count, yrange) {
      var i = 0;
      var series = [];
      while (i < count) {
        var x = (i + 1).toString();
        var y =
        Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min;

        series.push({
          x: x,
          y: y
        });
        i++;
      }
      return series;
      }
    // var heatmapOptions = {
    //   chart: {
    //     type: 'heatmap',
    //     // toolbar: {show:false}
    //   },
    //   series: [{
    //     name: 'sales',
    //     data: this.datasValue
    //   }],
    //   xaxis: {
    //     categories: this.keysValue
    //   }
    // }
    // var heatmap = new ApexCharts(this.heatmapTarget, heatmapOptions);
    // heatmap.render();

    var heatmapOptions = {
      series: [{
      name: 'M',
      data: generateData(6, {
        min: 0,
        max: 15
      })
    },
    {
      name: 'Tu',
      data: generateData(6, {
        min: 0,
        max: 15
      })
    },
    {
      name: 'We',
      data: generateData(6, {
        min: 0,
        max: 15
      })
    },
    {
      name: 'Thus',
      data: generateData(6, {
        min: 0,
        max: 15
      })
    },
    {
      name: 'Fri',
      data: generateData(6, {
        min: 0,
        max: 15
      })
    },
    ],
      chart: {
      height: 350,
      type: 'heatmap',
    },
    dataLabels: {
      enabled: false
    },
    colors: ["#008FFB"],
    title: {
      text: 'HeatMap Chart (Single color)'
    },
    };

    var chart = new ApexCharts(document.querySelector("#chart"), heatmapOptions);
    chart.render();
    // var pieOptions = {
    //   chart: {
    //     type: 'pie',
    //     // toolbar: {show:false}
    //   },
    //     series: [44, 55, 13, 33],
    //     labels: ['Apple', 'Mango', 'Orange', 'Watermelon']
    //   }
    // var pie = new ApexCharts(this.pieTarget, pieOptions);
    // pie.render();

    // var donutOptions = {
    //   chart: {
    //     type: 'donut',
    //     // toolbar: {show:false}
    //   },
    //   series: [44, 55, 13, 33],
    //   labels: ['Apple', 'Mango', 'Orange', 'Watermelon']
    // }
    // var donut = new ApexCharts(this.donutTarget, donutOptions);
    // donut.render();
  }
}
