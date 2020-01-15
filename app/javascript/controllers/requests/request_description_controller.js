import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "length" ]

  connect() {
    const length = this.inputTarget.value.length
    if(length < 256) {
      this.lengthTarget.children[0].innerHTML = 255 - length
    } else {
      document.getElementById('submit').setAttribute('disabled', 'true')
    }
  }

  length(event) {
    const length = this.inputTarget.value.length
    if(length < 256) {
      this.lengthTarget.children[0].innerHTML = 255 - length
      if(document.getElementById('submit').hasAttribute('disabled')) {
        document.getElementById('submit').removeAttribute('disabled')
      }
    } else {
      document.getElementById('submit').setAttribute('disabled', 'true')
    }
  }
}
