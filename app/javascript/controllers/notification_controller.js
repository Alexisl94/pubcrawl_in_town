import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["containerNotif", "message1", "message2", "message3"]
  static values = {
    url: String
  }


  connect() {
  }

  // addMessage() {
  //   this.message1Target.classList.remove("d-none")
  //   setInterval(() => {
  //     this.message2Target.classList.remove("d-none")
  //   }, 2000);
  //   setInterval(() => {
  //     this.message3Target.classList.remove("d-none")
  //   }, 4000);
  // }

  addMessage1() {
    this.message1Target.classList.remove("d-none")
  }
  addMessage2() {
    this.message2Target.classList.remove("d-none")
  }
  addMessage3() {
    this.message3Target.classList.remove("d-none")
  }
}
