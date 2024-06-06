namespace :cad do
    desc "Criação de produtos no banco de dados"
    task product: :environment do
        puts 'Cadastrando Produtos...'
        Category.create(
            description: 'Laticineos'
        )
        10.times do
            Product.create(
                name: Faker::Commerce.product_name, 
                description: Faker::Commerce.product_name,
                price: Faker::Commerce.price(range: 10.0...100.0),
                category:  Category.find(1)
            )
        end
        puts 'Produto Cadastro com Sucesso!'
    end
end
