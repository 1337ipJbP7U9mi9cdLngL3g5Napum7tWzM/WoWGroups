import { Controller } from "stimulus"
import PerfectScrollbar from 'perfect-scrollbar';

import '../../css/home_page/scrollbar.css'

export default class extends Controller {
  static targets = [  ]

  connect() {console.log('hello world')}

  scrollbarStart(event) {
    const ps_left = new PerfectScrollbar(this.element, {
      minScrollbarLength: 60
    });
  }

}
