import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {

  const inputElement = this.element;
  const disabledDates = JSON.parse(inputElement.dataset.value)

  connect() {
      this.initFlatpickr();
      this.addEventListeners();
    }

    initFlatpickr() {
      if (this.fp) {
        this.fp.destroy();
      }

      this.fp = flatpickr(this.element, {
        disable: disabledDates,
        minDate: "today",
        dateFormat: "Y-m-d",
      });
    }

    addEventListeners() {
      window.addEventListener('resize', () => this.initFlatpickr());
      window.addEventListener('turbo:load', () => this.initFlatpickr());
    }

    disconnect() {
      this.fp.destroy()
    }
}
