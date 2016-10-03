DesafioProgramacao1b::Application.routes.draw do
  post "/data_upload", to: "home#create", as: "data_uploads"
  get "/sales/search" => "home#search", as: :search_sale
  root "home#index"
end
