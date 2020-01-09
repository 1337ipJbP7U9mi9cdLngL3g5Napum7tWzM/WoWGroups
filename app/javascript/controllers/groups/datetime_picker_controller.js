import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "picker", "checkbox" ]

  connect() {

  }

  update() {
    if (typeof(this.pickerTarget.datetime) === 'undefined') {
      this.pickerTarget.now()
    }
    this.inputTarget.value = this.pickerTarget.datetime
  }

  datepickerHidden(event) {
    if(this.checkboxTarget.checked) {
      this.pickerTarget.classList.remove('is-hidden')
    } else {
      this.pickerTarget.classList.add('is-hidden')
    }
  }

}
