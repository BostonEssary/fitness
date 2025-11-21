import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["tab", "panel"]
  
  connect() {
  }

  selectTab(event) {
    this.removeActiveFromAllTabs()
    event.target.classList.add("active")
    const target = event.target.dataset.target
    this.removeActiveFromAllPanels()
    this.findActivePanel(target).classList.add("active")
  }

  persistActiveTab(event) {
    if (event.detail.attributeName === "class") {
      event.preventDefault()
    }
  }

  removeActiveFromAllTabs() {
    this.tabTargets.forEach(tab => {
      tab.classList.remove("active")
    })
  }

  removeActiveFromAllPanels() {
    this.panelTargets.forEach(panel => {
      panel.classList.remove("active")
    })
  }

  findActivePanel(target) {
    return this.panelTargets.find(panel => panel.dataset.target === target)
  }
}
