class CompareProductsHooks < Spree::ThemeSupport::HookListener
  
  replace :taxon_products do
    if @taxon && @taxon.taxonomy.comparable? && @products.length > 1
      render('taxons/comparable_taxon')
    else
      render("shared/products.html.erb", :products => @products, :taxon => @taxon)
    end
  end
  
  insert_after :admin_inside_taxonomy_form, 'admin/taxonomies/comparable_field'

end
