ActiveAdmin.register BeerType do
  menu :parent => "Beers"
  permit_params :name, :review, :appearance, :smell, :taste, :overall,
                :location, :brewery

  index do
    selectable_column
    id_column
    column :name
    column :review
    column :appearance
    column :smell
    column :taste
    column :overall
    column :location
    column :brewery
    actions
  end

  filter :name
  filter :appearance
  filter :smell
  filter :taste
  filter :overall
  filter :location
  filter :brewery

  form do |f|
    f.inputs "Beer Details" do
      f.input :name
      f.input :review
      f.input :appearance
      f.input :smell
      f.input :taste
      f.input :overall
      f.input :location
      f.input :brewery
    end
    f.actions
  end

end
