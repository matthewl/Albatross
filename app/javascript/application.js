// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import Alpine from "alpinejs"
window.Alpine = Alpine

document.addEventListener("DOMContentLoaded", function(event) {
  window.Alpine.start();
});