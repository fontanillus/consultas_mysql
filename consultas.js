"use strict";

// El resaltado conserva el texto original de la consulta y solo añade etiquetas.
const sqlTokens = /(--[^\r\n]*)|('(?:''|[^'])*')|\b(\d+)\b|\b([A-Z_][A-Z_0-9]*)\b/gi;
const keywords = new Set("SELECT FROM AS DISTINCT ORDER BY ASC DESC LIMIT OFFSET USE WHERE NOT AND OR BETWEEN IN LIKE DESCRIBE YEAR IS NULL INTERVAL DAY INNER JOIN ON CREATE VIEW REPLACE DROP IF EXISTS SET INTO TABLE SHOW FULL TABLES UNION INTERSECT EXCEPT".split(" "));
const sqlFunctions = new Set("COUNT UPPER LOWER CONCAT LEFT TIMESTAMPDIFF CURDATE MONTH CHAR_LENGTH DATE_FORMAT ADDDATE DATEDIFF LPAD CONCAT_WS".split(" "));
const statusMessage = document.querySelector("#estado-copia");

function highlight(code, query) {
  const fragment = document.createDocumentFragment();
  let offset = 0;

  for (const match of query.matchAll(sqlTokens)) {
    const [token, comment, string, number, word] = match;
    const upperWord = word?.toUpperCase();
    const end = match.index + token.length;
    let kind;

    if (comment) kind = "comment";
    else if (string) kind = "string";
    else if (number) kind = "number";
    else if (keywords.has(upperWord)) kind = "keyword";
    else if (upperWord === "LEFT" && /^\s+JOIN\b/i.test(query.slice(end))) kind = "keyword";
    else if (sqlFunctions.has(upperWord) && /^\s*\(/.test(query.slice(end))) kind = "function";

    if (kind) {
      fragment.append(query.slice(offset, match.index));
      const span = document.createElement("span");
      span.className = `sql-${kind}`;
      span.textContent = token;
      fragment.append(span);
      offset = end;
    }
  }

  fragment.append(query.slice(offset));
  code.replaceChildren(fragment);
}

// La selección manual queda disponible si el navegador bloquea el portapapeles.
function selectQuery(code) {
  const range = document.createRange();
  range.selectNodeContents(code);
  const selection = window.getSelection();
  selection.removeAllRanges();
  selection.addRange(range);
}

for (const solution of document.querySelectorAll(".exercise-body")) {
  const code = solution.querySelector("code");
  const button = solution.querySelector(".copy-button");
  const query = code.textContent;
  const label = code.parentElement.getAttribute("aria-label");
  let resetTimer;

  highlight(code, query);
  button.hidden = false;
  button.addEventListener("click", async () => {
    clearTimeout(resetTimer);
    try {
      await navigator.clipboard.writeText(query);
      button.textContent = "Copiado";
      statusMessage.textContent = `${label} copiado.`;
    } catch {
      selectQuery(code);
      button.textContent = "SQL seleccionado";
      statusMessage.textContent = `${label} seleccionado. Usa el comando de copia del navegador.`;
    }
    resetTimer = setTimeout(() => {
      button.textContent = "Copiar SQL";
    }, 3000);
  });
}
