import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts';

// Connects to data-controller="heatmap"
export default class extends Controller {
  static targets=["heatmap", "pie", "donut"]
  connect() {
    var heatmapOptions = {
      chart: {
        type: 'heatmap',
        // toolbar: {show:false}
      },
      series: [{
        name: 'sales',
        data: [30,40,35,50,49,60,70,91,125]
      }],
      xaxis: {
        categories: [1991,1992,1993,1994,1995,1996,1997, 1998,1999]
      }
    }
    var heatmap = new ApexCharts(this.heatmapTarget, heatmapOptions);
    heatmap.render();

    var pieOptions = {
      chart: {
        type: 'pie',
        // toolbar: {show:false}
      },
        series: [44, 55, 13, 33],
        labels: ['Apple', 'Mango', 'Orange', 'Watermelon']
      }
    var pie = new ApexCharts(this.pieTarget, pieOptions);
    pie.render();

    var donutOptions = {
      chart: {
        type: 'donut',
        // toolbar: {show:false}
      },
      series: [44, 55, 13, 33],
      labels: ['Apple', 'Mango', 'Orange', 'Watermelon']
    }
    var donut = new ApexCharts(this.donutTarget, donutOptions);
    donut.render();
  }
}
