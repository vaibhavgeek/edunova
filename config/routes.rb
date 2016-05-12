Rails.application.routes.draw do

mathjax 'mathjax'
  get  'home/admin'
  get 'mentor/index'
  get 'profiles/intrests/:query' => 'profiles#intrests'
  get 'profiles/all_people/:query' => 'profiles#all_people'

  get 'notes/my_notes'
  get 'home/index'
  get 'home/about_us'
  put 'home/mark_as_read'
  get 'notes/openlibrary'
  get 'notes/search_results_videos'  
 
  get 'notes/new_note_change_exercise'

  # get 'notes/explore'
  # get 'notes/discover'
  # post 'notes/add_passion'
  get 'notes/add_quiz'
  get 'notes/help'
  get 'home/edunova_activity' => 'home#activity' , :as => 'home/edunova_activity'
  get 'feeds/index'
  get 'feeds/feedback'
  get 'feeds/newsfeed'
  get 'feeds/search_people'
  get 'feeds/invite_people'
  get 'feeds/following'
  get 'feeds/followers'
  get 'feeds/search_results' 
  get 'feeds/hall_of_fame'
  get 'comments/load_comments'

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" ,  registrations: "users/registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

   root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
     resources :profiles do
        member do 
          put 'follow_user'
          put 'destroy_follow_user'
          get 'all'
          get 'created'
          get 'played'
          get 'quizzed'
          get 'upvoted'
          get 'commented'  
          get 'all_activity'
          get 'following'
          get 'followers'
          get 'notes'
          get 'signup'
        end  
      end
      resources :feeds do
        member do 
          put 'follow_user'
          put 'destroy_follow_user'  
        end  
      end     
      resources :notes do
        get 'html_view'
        get 'game_view'
        post 'auto_save_note'
        get 'comment_view'
        get 'display_quiz'
        post 'display_quiz_result'
        get 'load_level/:query' , to: 'notes#load_level' , :as => 'button_top_level'
        put 'next_level/:query', to: 'notes#next_level' , :as => 'update_level'
        resources :comments
        resources :questions
          member do
            put "like", to: "notes#upvote"
            put "unlike", to: "notes#unvote"
          end
      end

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
