ActiveAdmin.register Beer do
  menu :parent => "BeerKind"
  permit_params :beer_kind_id, :name, :review, :appearance, :smell, :taste, :overall,
                :location, :brewery, :abv

  index do
    selectable_column
    id_column
    column :beer_kind_id
    column :name
    column :abv
    column :review
    column :appearance
    column :smell
    column :taste
    column :overall
    column :location
    column :brewery
    actions
  end

  filter :beer_kind_id
  filter :name
  filter :abv
  filter :appearance
  filter :smell
  filter :taste
  filter :overall
  filter :location
  filter :brewery

  form do |f|
    f.inputs "Beer Details" do
      f.input :beer_kind_id
      f.input :name
      f.input :abv
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
