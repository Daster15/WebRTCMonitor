Rails.application.routes.draw do

  get :load_sip_params, to: 'stats#load_sip_params'
  get :load_sdp_params, to: 'stats#load_sdp_params'
  get :completed_tasks_range, to: 'stats#completed_tasks_range'


  end
  