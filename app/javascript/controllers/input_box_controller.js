import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="input-box"
export default class extends Controller {
  static targets = ['situation', 'emotion', 'consequence', 'form', 'childEmotion', 'situationDetails']
  connect() {
    // console.log(this.textSituationTarget)
    // console.log(this.emotionTarget)
  }
  toggleOtherSituation() {

    this.situationDetailsTarget.style.display = 'block';
  }


  toggleOtherEmotion(event) {
    const selectedEmotion = event.currentTarget.value
    // console.log(event.currentTarget.value)
    const url = `/entries/new?query=${selectedEmotion}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.childEmotionTarget.innerHTML = data

        console.log(data)
      });
  }
}
