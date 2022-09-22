import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  signout() {
    const itemSignOut = document.getElementById("sign_out_li");
    itemSignOut.classList.toggle("hidden");
  }
}
