Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "home/index"  
  root to: "home#index"

  get 'users',to: 'users#show'
  get 'users/logout',to: 'users#logout'

  # get  'deals/show_all',to: 'deals#index',as: 'all_deals'
  # get  'deals/add',to: 'deals#add_deal',as: 'add_deal'
  get  'deals/todays_deal',to: 'deals#todays_deal', as: 'todays_deal'
  # get  'deals/occupied_dates',to: 'deals#occupied_dates'
  # post 'deals/post_add',to: 'deals#create',as: 'deal_post_add'
  # post 'deals/post_user_deal',to: 'deals#create_user_deal'
	 


end
