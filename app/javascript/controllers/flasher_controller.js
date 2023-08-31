import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flasher"
export default class extends Controller {
  connect() {
    console.log('connected');

    setTimeout(() => {
      this.element.classList.add("d-none")
    }, 100000000000);
  }
}
