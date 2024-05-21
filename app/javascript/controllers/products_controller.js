import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="products"
export default class extends Controller {
  static values = { size: String, product: Object }

  addToCart() {
    console.log("product: ", this.productValue);
  }

  selectSize(event) {
    this.sizeValue = event.target.value;
    const selectedSizeEl = document.getElementById("selected-size");
    selectedSizeEl.innerText = `Selected Size: ${this.sizeValue}`;
  }
}
