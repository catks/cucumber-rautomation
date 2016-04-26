require 'rautomation'
Dado(/^que abro o bloco de notas$/) do
  spawn("notepad")
  @window = RAutomation::Window.new(:title => /Bloco de Notas/i)
  puts @window.title
end
Quando(/^escrevo "([^"]*)"$/) do |texto|
  @window.send_keys texto
end

Entao(/^vejo que o texto aparece no bloco de notas$/) do
  expect(@window.text_fields.first.value.empty?).to be false
end

Entao(/^salvo o arquivo e fecho o bloco de notas$/) do
  @window.send_keys :alt,'a'
  @window.send_keys 'r'
  save_as_window = RAutomation::Window.new(:title => /Salvar como/i)
  save_as_window.text_fields.first.send_keys "sucesso.txt"
  save_as_window.button(:value => "Sa&lvar").click
  @window.send_keys [:alt, 'a'] , "s" #sai do bloco de notas
end
