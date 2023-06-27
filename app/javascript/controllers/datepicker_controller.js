import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {

    // const inputElement = this.element;
    // const disabledDates = JSON.parse(inputElement.dataset.value)

    flatpickr(this.element, {
      minDate: "today",
      dateFormat: "Y-m-d",
    })
  }
}
