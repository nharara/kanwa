import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  static targets = ["input", "form", "list"];

  connect() {
    console.log('hello, i am connected');

  }

  update() {
    // console.log(this.inputTarget.value);
    const url = `${this.formTarget.action}?title=${this.inputTarget.value}`;

    // console.log(url);
    fetch(url, { headers: { Accept: "text/plain" } })
      .then((response) => response.text())
      .then((data) => {
        // console.log(data);
        this.listTarget.innerHTML = data;
      });
  }
}
