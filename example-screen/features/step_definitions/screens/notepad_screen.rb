
class NotepadScreen

  def initialize
    @w = RAutomation::Window.new(:title => /Bloco de Notas/i)
  end

  def texto=
    @w.send_keys texto
  end

  def save_as(name_file, override: true)
    @w.send_keys :alt,'a'
    @w.send_keys 'r'
    save_as_window = RAutomation::Window.new(:title => /Salvar como/i)
    save_as_window.text_fields.first.send_keys name_file
    save_as_window.send_keys :enter
  end

  def exit
    @w.send_keys [:alt, 'a'] , "s" #sai do bloco de notas
  end

end
