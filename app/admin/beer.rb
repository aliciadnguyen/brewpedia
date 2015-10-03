ActiveAdmin.register Beer do
  permit_params :beer_style, :description

  index do
    selectable_column
    id_column
    column :beer_style
    column :description
    actions
  end

  filter :beer_style

  form do |f|
    f.inputs "Beer Details" do
      f.input :beer_style
      f.input :description
    end
    f.actions
  end

end
