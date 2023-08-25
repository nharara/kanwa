import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts';

// Connects to data-controller="heatmap"
export default class extends Controller {
  static values = { keys: Array, datas: Array, info: String }

  static targets = ["heatmap", "pie", "donut"]

  connect() {

    console.log(new Date().getDay());

    const info = JSON.parse(this.infoValue)
    const data = Array.from(Object.keys(info), (week) => {
      console.log(week);
      return {
        name: '',
        data: info[week]
      };
    })

    const weekday = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']

    const d = new Date()
    let day = weekday[d.getDay() - 1]

    console.log(day);

    var heatmapOptions = {
      series: data,
      chart: {
        height: 200,
        width: '60%',
        type: 'heatmap',
      },
      dataLabels: {
        enabled: false,
      },
      colors: ["#509cad"],
      annotations: {
        points: [
          {
            x: day,
            y: 3.5,
            marker: {
              size: 6,
              fillColor: "#fff",
              strokeColor: "#2698FF",
              radius: 2
            },
            label: {
              borderColor: "#FF4560",
              offsetY: 0,
              style: {
                color: "#fff",
                background: "#F07167"
              },

              text: "Today"
            }
          }
        ]
      }
    };


    var chart = new ApexCharts(document.querySelector("#chart"), heatmapOptions);
    chart.render();
  }
}
