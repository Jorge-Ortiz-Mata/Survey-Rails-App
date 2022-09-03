import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  resetForm() {
    document.getElementById('modal').remove();
  }
}