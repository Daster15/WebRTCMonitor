import { Controller } from 'stimulus';

export default class extends Controller {
    static targets = ['userMenu', 'navMenu', 'lastActions', 'commits', 'searchMenu']

    toggleSearchMenuVisibility() {
        if (this.searchMenuTarget.classList.contains('hidden')) {
            this.searchMenuTarget.classList.remove('hidden');
        } else {
            this.searchMenuTarget.classList.add('hidden');
        }
    }

    toggleUserMenuVisibility() {
        if (this.userMenuTarget.classList.contains('hidden')) {
            this.userMenuTarget.classList.remove('hidden');
            this.lastActionsTarget.classList.add('hidden');
        } else {
            this.userMenuTarget.classList.add('hidden');
        }
    };

    toggleUserLastActionsVisibility() {
        if (this.lastActionsTarget.classList.contains('hidden')) {
            this.lastActionsTarget.classList.remove('hidden');
            this.userMenuTarget.classList.add('hidden');
            this.loadBranch()
        } else {
            this.lastActionsTarget.classList.add('hidden');
        }
    };

    toggleMainMenuVisibility() {
        if (this.navMenuTarget.classList.contains('hidden')) {
            this.navMenuTarget.classList.remove('hidden');
        } else {
            this.navMenuTarget.classList.add('hidden');
        }
    }

    loadBranch() {
        this.commitsTarget.innerHTML = `<li> Loading last actions </li>`
        var commitHTML = "";
        fetch(`${this.data.get("url")}`)
            .then(data => {
                console.log(data);
                return data.json();

            }).then(commits => {
                var commitsHTML = "";
                commits.forEach((commitJSON) => {
                    commitsHTML += commitTemplate(commitJSON);
                });
                this.commitsTarget.innerHTML = commitsHTML;
            });
    }
}

function commitTemplate(commit) {
    return ` 
            <a href="#" class="flex items-center px-4 py-3 border-t hover:bg-gray-100 -mx-2">
              <p class="text-gray-600 text-sm mx-2">
              <span class="font-bold" href="#">
              ${ commit.email }
              </span> 
              ${ commit.action } 
              <span class="font-bold text-blue-500" href="#">
              ${ commit.content }
              </span> 
              ${ formatDate(commit.created_at) }
             </p>
            </a>
        `;
}


function formatDate(v) {
    return v.replace(/T|Z/g, ' ')
}