import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="success"
export default class extends Controller {
  connect() {
    localStorage.removeItem("cart");
  }
}
