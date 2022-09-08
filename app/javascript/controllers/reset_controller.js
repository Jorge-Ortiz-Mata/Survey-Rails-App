import { Controller } from "@hotwired/stimulus"

const restoreForm = (id) => {
  document.getElementById(`${id}`).reset();
}

export default class extends Controller {
  resetForm() {
    document.getElementById('modal').remove();
  }

  questionForm(){
    const formId = "new_question";
    const timer = setInterval(() => {
      restoreForm(formId);
      clearInterval(timer);
    }, 100)
  }

  optionForm(e){
    const formId = e.target.id;
    const timer = setInterval(() => {
      restoreForm(formId);
      clearInterval(timer);
    }, 100)
  }
}
