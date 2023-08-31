import { Controller } from "@hotwired/stimulus"
import ApexCharts from 'apexcharts';

// Connects to data-controller="heatmap"
export default class extends Controller {
  static values = { yes: String, nots: String }

  static targets = ["barchart"]

  connect() {

  console.log('i am connected');

  const yes = parseInt(this.yesValue, 10)
  const no = parseInt(this.notsValue, 10)

  // const yesPercentage = parseInt((yes * 100) / (yes + no), 10)

  const yesPercentage = yes
  const noPercentage = 100 - yesPercentage

  console.log(noPercentage, yesPercentage);



  const options = {
    chart: {
      type: 'bar',
      height: 350,
      stacked: true,
      stackType: '100%'
    },
    plotOptions: {
      bar: {
        horizontal: true,
      },
    },
    series: [{
      name: "Yes",
      data:
        [yesPercentage]
      }, {
        name: "No",
        data:
       [noPercentage]
      }]
  };
  var barchart = new ApexCharts(document.querySelector("#barchart"), options);
  barchart.render();
}
}
