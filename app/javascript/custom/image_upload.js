document.addEventListener("turbo:load", function() {
  const imageUpload = document.querySelector('#micropost_image');
  const sizeError = document.querySelector('#size-error');

  if (imageUpload && sizeError) {
    imageUpload.addEventListener("change", function() {
      if (this.files.length > 0) {
        const sizeInMegabytes = this.files[0].size / 1024 / 1024;

        if (sizeInMegabytes > 5) {
          sizeError.style.display = "block";
          this.classList.add("is-invalid");
          this.value = "";
        } else {
          sizeError.style.display = "none";
          this.classList.remove("is-invalid");
        }
      }
    });
  }
});
