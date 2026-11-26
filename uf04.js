"use strict";

// Registra aquí las capturas originales por apartado. Cada entrada contiene src y descripción.
const capturas = {};
const dialog = document.querySelector("#captura-ampliada");
const enlargedImage = dialog.querySelector("img");

for (const container of document.querySelectorAll("[data-capturas]")) {
  const files = capturas[container.dataset.capturas];
  if (!files?.length) continue;

  container.replaceChildren();
  for (const { src, descripcion } of files) {
    const figure = document.createElement("figure");
    figure.className = "uf04-capture";
    const link = document.createElement("a");
    link.href = src;
    const thumbnail = document.createElement("img");
    thumbnail.src = src;
    thumbnail.alt = descripcion;
    thumbnail.loading = "lazy";
    link.append(thumbnail, "Ampliar captura");
    link.addEventListener("click", (event) => {
      if (typeof dialog.showModal !== "function" || event.ctrlKey || event.metaKey || event.shiftKey) return;
      event.preventDefault();
      enlargedImage.src = src;
      enlargedImage.alt = descripcion;
      enlargedImage.hidden = false;
      dialog.showModal();
    });
    figure.append(link);
    container.append(figure);
  }
}

function openLinkedExercise() {
  const id = window.location.hash.slice(1);
  const exercise = document.getElementById(id);
  if (exercise instanceof HTMLDetailsElement) exercise.open = true;
}

window.addEventListener("hashchange", openLinkedExercise);
document.querySelector(".uf04-index").addEventListener("click", (event) => {
  const link = event.target.closest('a[href^="#apartado-"]');
  if (link) document.getElementById(link.hash.slice(1)).open = true;
});
openLinkedExercise();
