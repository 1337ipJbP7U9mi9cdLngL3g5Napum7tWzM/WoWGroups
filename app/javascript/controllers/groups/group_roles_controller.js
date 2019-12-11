import { Controller } from "stimulus"
import noUiSlider from 'nouislider';

export default class extends Controller {
  static targets = [ "groupRolesAmounts" ]

  connect() {
    const group_roles = document.getElementById('group_roles');
    noUiSlider.create(group_roles, {
        start: [1, 1, 3],
        connect: [ true, true, true, false],
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

    group_roles.noUiSlider.on('update', (group_roles) => {this.update(event, group_roles)});

  }

  update(event, group_roles) {
    this.groupRolesAmountsTarget.value = group_roles
  }

}
