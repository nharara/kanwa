import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="input-box"
export default class extends Controller {
  static targets = ['situation', 'textSituation', 'emotion', 'consequence', 'form', 'childEmotion']
  connect() {
    // console.log(this.textSituationTarget)
    // console.log(this.emotionTarget)
  }
  toggleOtherSituation(event) {
    const selectedSituation = event.currentTarget.value
    // console.log(event.currentTarget.value)
    if (selectedSituation === 'other') {
      this.textSituationTarget.classList.remove("d-none")
    } else {
      this.textSituationTarget.classList.add("d-none")
    }
  }

  toggleOtherEmotion(event) {
    const selectedEmotion = event.currentTarget.value
    // console.log(event.currentTarget.value)
    const url = `/entries/new?query=${selectedEmotion}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.childEmotionTarget.innerHTML = data
        // this.emotionTarget.classList.add('d-none')
        console.log(data)
      })
  }
}
