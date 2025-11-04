import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="checklist"
export default class extends Controller {
  connect() {}

  toggle(event) {
    const checkbox = event.target
    const url = checkbox.dataset.completionUrl
    this.completeItem(checkbox, url)
    this.toggleStrikethrough(checkbox)
  }

  completeItem(checkbox, url) {
    const body = { completed_at: checkbox.checked ? new Date().toISOString() : "" }
    post(url, { body })
  }

  toggleStrikethrough(checkbox) {
    const label = checkbox.closest("label")
    label.classList.toggle("completed")
  }
}
