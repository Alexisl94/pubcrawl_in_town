import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["play","pause","circle__btn","circle__backone","circle__backtwo"]
  connect() {
   console.log("yoo")
  }
  playBtn(e) {
    e.preventDefault();
    this.pauseTarget.classList.toggle('visibility');
    this.playTarget.classList.toggle('visibility');
    this.circle__btnTarget.classList.toggle('shadow');
    this.circle__backone.classList.toggle('paused');
    this.circle__backtwo.classList.toggle('paused');
    };
}
