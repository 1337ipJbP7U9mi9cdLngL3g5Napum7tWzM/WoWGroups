import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "serverRegion", "serverIcon", "regionSelected" ]

  connect() {
    // console.log('hi')
  }

  regionSelect() {
    this.serverIconTarget.classList.remove("fa-server")
    this.serverIconTarget.classList.add("fa-cog", "fa-spin")
    const region = this.regionSelectedTarget.value
    const url = `/servers?region=${region}`
    fetch(url)
      .then(response => response.text())
      .then(html => {
        this.serverRegionTarget.innerHTML = html
        this.serverIconTarget.classList.remove("fa-cog", "fa-spin")
        this.serverIconTarget.classList.add("fa-server")
      })
  }

}
