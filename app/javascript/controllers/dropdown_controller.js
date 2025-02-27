import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]
  
  connect() {
    // Add event listener to close dropdown when clicking outside
    document.addEventListener("click", this.outsideClickHandler.bind(this))
  }
  
  disconnect() {
    // Clean up event listener when controller is disconnected
    document.removeEventListener("click", this.outsideClickHandler.bind(this))
  }
  
  outsideClickHandler(event) {
    if (!this.element.contains(event.target) && this.isOpen()) {
      this.close()
    }
  }
  
  toggle(event) {
    event.stopPropagation()
    
    if (this.isOpen()) {
      this.close()
    } else {
      this.open()
    }
  }
  
  open() {
    this.menuTarget.classList.remove("hidden")
  }
  
  close() {
    this.menuTarget.classList.add("hidden")
  }
  
  isOpen() {
    return !this.menuTarget.classList.contains("hidden")
  }
}