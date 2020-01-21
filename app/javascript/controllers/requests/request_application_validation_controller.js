import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submit", "description", "role" ]

  connect() {
    this.submitTarget.setAttribute('disabled', '')
    this.update()
  }

  update(event) {
    let checked = false
    let description = false
    for(let i = 0; i < 3 ; i++) {
      if(this.roleTargets[i].checked){
        checked = true
      }
    }

    if(this.descriptionTarget.value.length !== 0 && this.descriptionTarget.value.length < 256) {
      description = true
    }

    if(checked && description) {
      this.submitTarget.removeAttribute('disabled')
    } else {
      this.submitTarget.setAttribute('disabled', '')
    }
  }

}
