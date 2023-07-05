import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["containerNotif", "message1", "message2", "message3"]
  static values = {
    url: String,
    status: Number
  }


  connect() {
    this.initMessages()
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


  initMessages() {
    if (this.statusValue === 1) {
    } else if (this.statusValue === 2) {
      this.addMessage1()
      this.addMessage2()
    } else if (this.statusValue === 3) {
      this.addMessage1()
      this.addMessage2()
      this.addMessage3()
    }
  }

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
