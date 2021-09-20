import { Controller } from "stimulus"
import Highcharts from 'highcharts';
import Exporting from 'highcharts/modules/exporting';
Exporting(Highcharts);

export default class extends Controller {
    handle_id = this.data.get("url")
    call_id = this.data.get("call_id")
    start = this.data.get("start_t")
    stop = this.data.get("stop_t")
    connect() {
        console.log('pobieram dane handle' + this.handle_id)
        console.log('pobieram dane call_id' + this.call_id)
        console.log('pobieram dane start' + this.start)
        console.log('pobieram dane stop' + this.stop)
        $.getJSON(
            'http://acc-devel8-fs1.altar:3000/completed_tasks_range?handle=' + this.handle_id + '&call_id=' + this.call_id + '&time_start=' + this.start + '&time_stop=' + this.stop,

            (data) => {
                var i;
                var processed_json = new Array();
                var processed_jsona = new Array();
                var processed_jsonb = new Array();
                var processed_jsonc = new Array();
                var processed_jsond = new Array();
                var processed_jsone = new Array();
                for (i = 0; i < data.length; i++) {
                    console.log(data[i].jitterremote)
                    processed_json.push([data[i].timestamp, data[i].jitterremote]);
                    processed_jsona.push([data[i].timestamp, data[i].jitterlocal]);
                    processed_jsonb.push([data[i].timestamp, data[i].bytessent]);
                    processed_jsonc.push([data[i].timestamp, data[i].bytesrecv]);
                    processed_jsond.push([data[i].timestamp, data[i].lostlocal]);
                    processed_jsone.push([data[i].timestamp, data[i].lostremote]);
                }

                Highcharts.chart(this.element, {
                    chart: {
                        zoomType: 'x'
                    },
                    title: {
                        text: 'Przebieg polaczenia WEB_RTC'
                    },
                    subtitle: {
                        text: document.ontouchstart === undefined ?
                            'Click and drag in the plot area to zoom in' : '...'
                    },
                    xAxis: {
                        type: 'timestamp'
                    },
                    yAxis: {
                        title: {
                            text: '...'
                        }
                    },
                    legend: {
                        enabled: true
                    },
                    plotOptions: {
                        area: {
                            fillColor: {
                                linearGradient: {
                                    x1: 0,
                                    y1: 0,
                                    x2: 0,
                                    y2: 1
                                },
                                stops: [
                                    [0, Highcharts.getOptions().colors[0]],
                                    [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                                ]
                            },
                            marker: {
                                radius: 2
                            },
                            lineWidth: 1,
                            states: {
                                hover: {
                                    lineWidth: 1
                                }
                            },
                            threshold: null
                        }
                    },

                    series: [{
                            type: 'line',
                            name: 'jitterremote',
                            data: processed_json
                        },
                        {
                            type: 'line',
                            name: 'jittrerlocal',
                            data: processed_jsona
                        },
                        {
                            type: 'line',
                            name: 'lostlocal',
                            data: processed_jsond
                        },
                        {
                            type: 'line',
                            name: 'lostremote',
                            data: processed_jsone
                        }
                    ]
                });
            }
        );
    }



}
