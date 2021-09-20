import { Controller } from "stimulus"

export default class extends Controller {
    connect() {
        this.element[this.identifier] = this
    }

    name() {
        this.element.innerHTML = `I am ${this.element.dataset.name}.`
    }
}