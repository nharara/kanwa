import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts';

// Connects to data-controller="heatmap"
export default class extends Controller {
  static values={keys: Array, datas: Array, info: String}
  static targets=["heatmap", "pie", "donut"]
  connect() {
    const info = JSON.parse(this.infoValue)
    console.log(info)
    const data = Array.from(Object.keys(info), (week) => {
      return {
      name: week,
        data: info[week]
      };
    })
    console.log(data)
    var heatmapOptions = {
      series: data,
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

}
}
