// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const src = document.getElementsByClassName("source");
const dest = document.getElementById("dest");

for (let i = 0; i < src.length; i++) {
  src[i].addEventListener("click", e =>
    dest.value += "" + src[i].innerText
  );
}
