import { Controller } from "@hotwired/stimulus"
import CalHeatmap from 'cal-heatmap';

// Connects to data-controller="heatmap"
export default class extends Controller {
  connect() {
    const cal = new CalHeatmap();
    cal.paint({itemSelector: this.element, range: 3, width: 50, height: 50});
  }
}
