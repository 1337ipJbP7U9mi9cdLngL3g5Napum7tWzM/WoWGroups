import { Controller } from "stimulus"
import noUiSlider from 'nouislider';

export default class extends Controller {
  static targets = [ "levels" ]

  connect() {
    const levels = document.getElementById('levels');
    noUiSlider.create(levels, {
        start: [1, 60],
        connect: true,
        range: {
            'min': 1,
            'max': 60
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

    levels.noUiSlider.on('update', (levels) => {this.update(event, levels)});

  }

  update(event, levels) {
    this.levelsTarget.value = levels
  }


}
