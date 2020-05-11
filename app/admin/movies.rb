ActiveAdmin.register Movie do
  permit_params :title, :url, :category


index do
  selectable_column
  id_column
  column :title
  column :url
  column :category
  actions
end

filter :title
filter :url
filter :category

form do |f|
  f.inputs do
    f.input :title
    f.input :url
    f.input :category
  end
  f.actions
end

end
