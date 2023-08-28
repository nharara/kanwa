import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  static targets = ['update']
  static values = {
    votes: String
  }

  connect() {
    console.log("i can vote");
  }

  upvote(){
    console.log(this.votesValue);
    this.votesValue = parseInt(this.votesValue) + 1
    this.updateTarget.innerHTML = this.votesValue.toString()
  }
}
