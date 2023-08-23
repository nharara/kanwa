import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts';

// Connects to data-controller="heatmap"
export default class extends Controller {
  static values={keys: Array, datas: Array}
  static targets=["heatmap", "pie", "donut"]
  connect() {
    console.log(this.keysValue, this.datasValue)
    var heatmapOptions = {
      chart: {
        type: 'heatmap',
        // toolbar: {show:false}
      },
      series: [{
        name: 'sales',
        data: this.datasValue
      }],
      xaxis: {
        categories: this.keysValue
      }
    }
    var heatmap = new ApexCharts(this.heatmapTarget, heatmapOptions);
    heatmap.render();

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
