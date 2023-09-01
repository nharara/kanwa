// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="hider"
// export default class extends Controller {
//   static targets = ['section', 'child']
//   static values = {}

//   connect() {
//     console.log('toggler connected');
//     this.index = 1
//   }

//   hide() {

//     console.log('click');
//     const child = document.getElementById('childEmo')
//     console.log(child);

//     const limit = this.sectionTargets.length

//     if (this.index < limit && this.index >= 1) {
//       this.sectionTargets.map(target => {
//         target.classList.add('d-none')
//       })

//       this.sectionTargets[this.index].classList.remove('d-none')

//       if (child) {
//         child.classList.add('d-none')
//       }
//       this.index += 1
//     }
//   }

//   show() {
//     console.log('click');

//     const child = document.getElementById('childEmo')

//     if (this.index >= 2) {

//       this.index -= 2
//       this.sectionTargets.map(target => {
//         target.classList.add('d-none')
//       })
//       this.sectionTargets[this.index].classList.remove('d-none')
//       if (child) {
//         child.classList.add('d-none')
//       }
//       this.index += 1
//     }
//   }
// }
