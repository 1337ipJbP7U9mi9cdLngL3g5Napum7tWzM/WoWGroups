import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "password", "checkbox" ]

  connect() {}

  privateUrl(event) {
    if(event.target.checked) {
      this.passwordTarget.classList.remove('is-hidden')
    } else {
      this.passwordTarget.classList.add('is-hidden')
    }
  }

  privateUrlWindowLoad() {
    if(this.checkboxTarget.checked) {
      this.passwordTarget.classList.remove('is-hidden')
    } else {
      this.passwordTarget.classList.add('is-hidden')
    }
  }

}
