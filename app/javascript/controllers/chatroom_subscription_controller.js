import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number, currentUserNickname: String }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    // console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    // window.onload = () => {
    //   const scrollPosition = sessionStorage.getItem("scrollPosition");
    //   console.log(scrollPosition)
    //   if (scrollPosition) {
    //     this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight) = scrollPosition;
    //     console.log(this.messagesTarget.scrollHeight)
    //     console.log("hllo")
    //   }
    // };
  }

  resetForm(event) {
    // console.log("hello")
    event.target.reset()
    this.update()
    // this.saveScrollPosition()
    // // window.location.reload();
    // this.messagesTarget.scrollHeight = (sessionStorage.getItem("scrollPosition"))
    // this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  disconnect() {
    // console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  // saveScrollPosition() {
  //   sessionStorage.setItem("scrollPosition", this.messagesTarget.scrollHeight);
  //   console.log(this.messagesTarget.scrollHeight)
  // }
  // refresh() {
  //   window.location.reload()
  // }

  #insertMessageAndScrollDown(data) {
    // Logic to know if the sender is the current_user
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    const currentUserIsMaster =  data.sender_id === 1
    // Creating the whole message from the `data.message` String
    const messageElement = this.#buildMessageElement(currentUserIsSender, currentUserIsMaster, data.message)
    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    // this.messagesTarget.last
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, currentUserIsMaster, message) {
    if (currentUserIsMaster === true) {
      return`
      <div class="message-row d-flex justify-content-center">
        <div class="admin-style">
          ${message}
        </div>
      </div>
    `
    }
    else {
      return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }
}

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

}
