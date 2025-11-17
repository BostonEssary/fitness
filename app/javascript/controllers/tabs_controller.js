import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["tab", "panel"]
  static values = {
    activeTab: Number
  }
  connect() {
  }

  selectTab(event) {
    event.preventDefault()
    this.removeActiveFromAllTabs()
    event.target.classList.add("active")
    const target = event.target.dataset.target
    this.removeActiveFromAllPanels()
    this.activeTabValue = parseInt(target)
    this.findActivePanel(target).classList.add("active")
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

  persistTabOnMorph(event) {
    event.preventDefault()
  }
}
