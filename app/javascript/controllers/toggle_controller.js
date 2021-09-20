import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["content"];

    toggle() {
        this.contentTarget.classList.toggle("hidden");
    }
}