import { Controller } from "stimulus"
import PerfectScrollbar from 'perfect-scrollbar';

import '../../css/home_page/scrollbar.css'

export default class extends Controller {
  static targets = [  ]

  connect() {
    // const ps_left = new PerfectScrollbar(this.element, {
    //   minScrollbarLength: 60
    // });
  }

  scrollbarStart(event) {
    const windowHeight = window.innerHeight;
    const sectionHeight = this.element.offsetTop;

    this.element.style.height = windowHeight - sectionHeight + 'px';

    const ps_left = new PerfectScrollbar(this.element, {
      minScrollbarLength: 60
    });
  }

  resize(event) {
    const windowHeight = window.innerHeight;
    const sectionHeight = this.element.offsetTop;

    this.element.style.height = windowHeight - sectionHeight + 'px';
  }

}
