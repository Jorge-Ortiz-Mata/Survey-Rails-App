import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  show(){
    document.getElementById("submit_answers").classList.toggle('hidden');
  }

  remove(){
    document.getElementById("submit_answers").classList.toggle('hidden');
  }
}
