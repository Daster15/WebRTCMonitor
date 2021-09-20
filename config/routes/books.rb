Rails.application.routes.draw do

    get :details_show, to: 'books#inline_details_show'
    get :details_hide, to: 'books#inline_details_hide'
    resources :books 


  end
  