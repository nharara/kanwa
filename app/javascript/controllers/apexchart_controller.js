import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts';

// Connects to data-controller="heatmap"
export default class extends Controller {
  static values = { keys: Array, datas: Array, info: String, yes: String, nots: String }

  static targets = ["heatmap"]

  connect() {

    console.log(new Date().getDay());

    const info = JSON.parse(this.infoValue)
    const data = Array.from(Object.keys(info), (week) => {
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
        height: '100%',
        width: '100%',
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
            y: top,
            marker: {
              size: 6,
              fillColor: "#fff",
              strokeColor: "#2698FF",
              radius: 2
            },
            label: {
              borderColor: "#FF4560",
              offsetY: 300,
              style: {
                color: "#fff",
                background: "#F07167",
                fontSize: '9px'
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
