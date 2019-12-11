import { Controller } from "stimulus"
import noUiSlider from 'nouislider';

export default class extends Controller {
  static targets = [ "size" ]

  connect() {
    const group_size = document.getElementById('group_size');
    noUiSlider.create(group_size, {
        start: 2,
        connect: "lower",
        range: {
            'min': 2,
            'max': 40
        },
        // pips: {mode: 'count', values: 5},
        step: 1,
        behaviour: 'tap-drag',
        tooltips: true,
        format: {
          to: (value) => {
            return value.toFixed(0)
          },
          from: (value) => {
            return Number(value)
          }
        }
    })

    group_size.noUiSlider.on('update', (group_size) => {this.update(event, group_size)});

  }

  update(event, group_size) {
    this.sizeTarget.value = group_size
  }

}
