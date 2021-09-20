import { Controller } from "stimulus"

export default class extends Controller {

    static targets = ["option", "branch", "commits"]
    handle_id = this.data.get("url")
    start = this.data.get("start_t")
    stop = this.data.get("stop_t")
    connect() {
        this.loadBranch('http://acc-devel8-fs1.altar:3000/load_sip_params?handle=' + this.handle_id + '&call_id=' + this.call_id + '&time_start=' + this.start + '&time_stop=' + this.stop)
    }
    loadBranch(branch) {
        this.commitsTarget.innerHTML = `<li>Loading SIP Messages</li>`
        var commitHTML = "";
        fetch(`${branch}`)
            .then(data => {
                return data.json();
            }).then(commits => {
                var commitsHTML = "";
                commits.forEach((commitJSON) => {
                    console.log(commitJSON)
                    commitsHTML += commitTemplate(commitJSON);
                });
                this.commitsTarget.innerHTML = commitsHTML;
            });
    }
}

function commitTemplate(commit) {
    return ` 
    <li>
        <div class="relative pb-8">
          <span class="absolute top-5 left-5 -ml-px h-full w-0.5 bg-gray-200" aria-hidden="true"></span>
          <div class="relative flex items-start space-x-3">
            <div>
              <div class="relative px-1">
                <div class="h-8 w-8 bg-blue-500 rounded-full ring-8 ring-white flex items-center justify-center">
                  <svg class="text-white h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                  </svg>
                </div>
              </div>
            </div>
            <div class="min-w-0 flex-1 py-0">
              <div class="text-md text-gray-500">
                <div>
                  <a href="#" class="font-medium text-gray-900 mr-2">SIP_MESSAGE</a>

                </div>
                <span class="whitespace-nowrap text-sm">${commit.timestamp}</span>
              </div>
              <div class="mt-2 text-gray-700">
                <p>${commit.event}</p>
              </div>
            </div>
          </div>
        </div>
      </li>
   `;
}
