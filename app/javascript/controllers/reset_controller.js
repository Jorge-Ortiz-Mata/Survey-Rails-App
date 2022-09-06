import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  resetForm() {
    document.getElementById('modal').remove();
  }

  questionForm(){
    const timer = setInterval(() => {
      document.getElementById('new_question').reset();
      clearInterval(timer);
    }, 100)
  }
}