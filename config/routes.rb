Rails.application.routes.draw do
  get 'rooms/posts',   to: 'rooms#posts'
  get 'rooms/search',  to: 'rooms#search'
  get 'users/account', to: 'users#account'

  resources :rooms
  resources :reservations

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',

    account: 'users/account'
    #今回は個別にaccount,profileのコントローラーを用意してuserに関する情報は全てuserモデルに詰め込んだが
    #情報を分けたprofileモデルを、usersにネストする必要や利点はあったか
    #viewファイルの位置がdeviseとusersで分かれるのが見にくいのがナンセンスとは感じます
    #(なるべく１つのページの為だけに後からモデルを増やして既にあるデータを移すのが面倒だった)
    #なんならcontrollerも増やさずにregistrationの中のアクションで済ませたかった。
    
  }

  root to: "home#index"
end
