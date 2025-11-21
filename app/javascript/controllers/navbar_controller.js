import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.updateNavbar()
    window.addEventListener('scroll', () => this.updateNavbar())
  }

  updateNavbar() {
    const navbar = document.querySelector('.navbar-lewagon')
    
    if (window.scrollY > 50) {
      navbar.classList.add('scrolled')
    } else {
      navbar.classList.remove('scrolled')
    }
  }
}
