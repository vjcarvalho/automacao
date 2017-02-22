Dado(/^que estou no site walmart$/) do
  visit 'https://www.walmart.com.br'
  sleep 5
end

Quando(/^pesquiso por apple$/) do
	fill_in('ft', :with => 'apple')
	find('li.item.autocomplete-suggestion', :text => 'celular apple').click
	click_button('Procurar')
	sleep 5 
 end

Então(/^visualizo os produtos da apple$/) do
  expect(page.has_content?('apple')).to eq true
  sleep 5
end

Dado(/^que estou na pagina da apple$/) do
  visit 'https://www.walmart.com.br'
  fill_in('ft', :with => 'apple')
	find('li.item.autocomplete-suggestion', :text => 'celular apple').click
	click_button('Procurar')
	 expect(page.has_content?('apple')).to eq true
  sleep 5
end

Quando(/^clico no Iphone (\d+) dourado$/) do |arg1|
	#find('iphone 6s Apple 32GB Dourado MN112BR/A', match: :first).click
	click_link('iPhone 6s Apple 32GB Dourado MN112BR/A', match: :first)
  sleep 5
end

Então(/^vizualizo os dados para compra$/) do
  has_content?('Formas de pagamento?')

sleep 5
end

Dado(/^que selecionei o iphone dourado (\d+)s$/) do |arg1|
  visit 'https://www.walmart.com.br'
  fill_in('ft', :with => 'apple')
  find('li.item.autocomplete-suggestion', :text => 'celular apple').click
  click_button('Procurar')
  expect(page.has_content?('apple')).to eq true
  click_link('iPhone 6s Apple 32GB Dourado MN112BR/A', match: :first)
  # has_content?('Formas de pagamento?')
end

Quando(/^clico em Calcular frete$/) do
   fill_in('estimate-shipping-txt-cep', :with => '04943080')
   click_button('Calcular frete')
   sleep 10
end

Então(/^vizualizo os valores e dias possiveis$/) do
  assert_text('Opções de frete para sua região')
  sleep 5
end


