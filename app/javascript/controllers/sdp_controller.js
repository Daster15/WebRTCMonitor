import { Controller } from "stimulus"

export default class extends Controller {

    static targets = ["option", "branch", "commits"]
    handle_id = this.data.get("url")
    start = this.data.get("start_t")
    stop = this.data.get("stop_t")
    connect() {
        this.loadBranch('http://acc-devel8-fs1.altar:3000/load_sdp_params?handle=' + this.handle_id + '&call_id=' + this.call_id + '&time_start=' + this.start + '&time_stop=' + this.stop)
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
                  <a href="#" class="font-medium text-gray-900 mr-2">SDP_MESSAGE</a>

                  <a href="#" class="my-0.5 relative inline-flex items-center bg-white rounded-full border border-gray-300 px-3 py-0.5 text-sm">
                    <div class="absolute flex-shrink-0 flex items-center justify-center">
                      <span class="h-1.5 w-1.5 rounded-full bg-green-500" aria-hidden="true"></span>
                    </div>
                    <div class="ml-3.5 font-medium text-gray-900">REMOTE: ${commit.remote}</div>
                    <div class="ml-3.5 font-medium text-gray-900">OFFER: ${commit.offer}</div>
                  </a>
                </div>
                <span class="whitespace-nowrap text-sm">${commit.timestamp}</span>
              </div>
              <div class="mt-2 text-gray-700">
                <p>${commit.sdp}</p>
              </div>
            </div>
          </div>
        </div>
      </li>
   `;
}
