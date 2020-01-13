import { Controller } from "stimulus"
import noUiSlider from 'nouislider'

export default class extends Controller {
  static targets = [ "level" ]

  connect() {
    const level = document.getElementById('level');
    noUiSlider.create(level, {
        start: 1,
        connect: "lower",
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

    // level.noUiSlider.on('update', (level) => {this.update(event, level)});
  }

  update(event, level) {
    this.levelTarget.value = level
  }

}
