import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "serverRegion", "serverIcon", "regionSelected" ]

  connect() {
    // console.log('hi')
  }

  regionSelect() {
    // Change to load Icon in server list until loaded
    this.serverIconTarget.classList.remove("fa-server")
    this.serverIconTarget.classList.add("fa-cog", "fa-spin")

    // Get the region_id and request the servers that correspond
    const region = this.regionSelectedTarget.value
    const url = `/servers?region=${region}`
    fetch(url)
      .then(response => response.text())
      .then(html => {
        this.serverRegionTarget.innerHTML = html

        // Change back from loading icon to regular server icon
        this.serverIconTarget.classList.remove("fa-cog", "fa-spin")
        this.serverIconTarget.classList.add("fa-server")
      })
  }

}
