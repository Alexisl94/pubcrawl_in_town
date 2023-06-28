import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
      this.initFlatpickr();
      this.addEventListeners();
    }

    initFlatpickr() {
      if (this.fp) {
        this.fp.destroy();
      }

      this.fp = flatpickr(this.element, {
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
