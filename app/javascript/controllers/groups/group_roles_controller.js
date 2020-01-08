import { Controller } from "stimulus"
import noUiSlider from 'nouislider';

export default class extends Controller {
  static targets = [  ]

  connect() {}

  connectGroupSliders() {
    let sliders = document.getElementsByClassName('group_role_sliders');

    [].slice.call(sliders).forEach(function (slider, index) {
      noUiSlider.create(slider, {
          start: index === 2 ? 3 : 1,
          connect: [true, false],
          range: {
              'min': 0,
              '50%': 5,
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

      slider.noUiSlider.on('update', (event) => {
        slider.children[0].value = event[0]
        slider.nextElementSibling.children[0].innerHTML = event[0]
      });
    })
  }

}
