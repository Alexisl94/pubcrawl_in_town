import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["containerNotif"]

  connect() {
    console.log("hello")
    this.refresh()
  }

  refresh() {
    setInterval(() => {
      this.fetchNotificationMessage()
    }, 5000)
  }

  fetchNotificationMessage() {
    fetch("/notifications/check_message")
      .then(response => response.text())
      .then(text => {
        this.containerNotifTarget.innerHTML = text
      })
      .catch(error => {
        console.error(error)
      })
  }
}
