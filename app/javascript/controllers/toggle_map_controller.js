import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-map"
export default class extends Controller {
  static targets = ["map", "list", "button"]

  connect() {
  }

  displayMap() {
    this.listTarget.classList.toggle("d-none")
    this.buttonTarget.classList.toggle("border-bottom")
    this.mapTarget.classList.toggle("d-none")
  }
}
