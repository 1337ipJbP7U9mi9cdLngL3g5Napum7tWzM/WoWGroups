import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  connect() {

  }

  update() {
    if (typeof(this.element.datetime) === 'undefined') {
      this.element.now()
    }
    this.inputTarget.value = this.element.datetime
  }

}
