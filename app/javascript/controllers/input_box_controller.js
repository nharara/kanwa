import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="input-box"
export default class extends Controller {
  static targets = ['situation', 'textSituation', 'emotion', 'consequence', 'form', 'childEmotion']
  connect() {
    // console.log(this.textSituationTarget)
    // console.log(this.emotionTarget)
  }
  toggleOtherSituation(event) {
    const selectedSituation = event.currentTarget.value;
    const textSituationTarget = this.textSituationTarget;
    // console.log(event.currentTarget.value)
    if (selectedSituation) {

      const inputField = document.createElement('input');
      inputField.setAttribute('class', 'form-control string required');
      inputField.setAttribute('type', 'text');
      inputField.setAttribute('name', 'entry[situation]');
      inputField.setAttribute('id', 'entry_situation');
      inputField.setAttribute('value', selectedSituation + ": ");

      textSituationTarget.innerHTML = '';
      textSituationTarget.appendChild(inputField);
    } else {

      textSituationTarget.innerHTML = '';
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
