import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "length" ]

  connect() {
    const length = this.inputTarget.value.length
    this.lengthTarget.children[0].innerHTML = 255 - length
  }

  length(event) {
    const length = this.inputTarget.value.length
    this.lengthTarget.children[0].innerHTML = 255 - length
  }

}
