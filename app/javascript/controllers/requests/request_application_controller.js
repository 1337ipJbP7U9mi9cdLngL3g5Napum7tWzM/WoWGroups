import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal" ]

  connect() {

  }

  modalOpen(event) {
    this.modalTarget.classList.add('is-active')
  }

  modalClose(event) {
    this.modalTarget.classList.remove('is-active')
  }

}
