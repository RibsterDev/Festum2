import flatpickr from "flatpickr"
import { French } from "flatpickr/dist/l10n/fr.js"
import "flatpickr/dist/flatpickr.min.css";



flatpickr(".flatpikr", {
  "locale": French,
  altInput: true,
  dateFormat: "d-m-Y",
  altFormat: "j F, Y",



});
