#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output_dir="${repo_root}/_site"
english_script="${repo_root}/en/language-switch.js"
spanish_script="${repo_root}/es/language-switch.js"

cleanup() {
  rm -f "${english_script}" "${spanish_script}"
}
trap cleanup EXIT

command -v quarto >/dev/null 2>&1 || {
  echo "Error: quarto is required to build this site." >&2
  exit 1
}

rm -rf "${output_dir}"
mkdir -p "${output_dir}/en" "${output_dir}/es"
cp "${repo_root}/shared/language-switch.js" "${english_script}"
cp "${repo_root}/shared/language-switch.js" "${spanish_script}"

quarto render "${repo_root}/en"
quarto render "${repo_root}/es"

cp -a "${repo_root}/en/_site/." "${output_dir}/en/"
cp -a "${repo_root}/es/_site/." "${output_dir}/es/"
cp "${repo_root}/landing/index.html" "${output_dir}/index.html"
touch "${output_dir}/.nojekyll"

echo "Built bilingual site in ${output_dir}"
