require 'rautomation'
require 'date'
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
  date = DateTime.now.strftime('%d%m%Y %H%M%S')
  page(NotepadScreen).save_as "super_sucesso-#{date}.txt"
  page(NotepadScreen).exit
end
