require 'tk'
require 'yaml'

class Person
  attr_accessor :name, :phonenumber
end

class PhoneBookDb
  def initialize(file='data.yaml')
    @file = file
    if File.exists? @file
      @database = open(@file, 'r') { |f| YAML.load(f) }
    else
      @database = {}
    end
  end
  def add_contact(key, phonenumber)
    @database[key] = Person.new(key, phonenumber)
  end
end

class PhoneBookGUI
  def initialize
    @db = PhoneBookDb.new
    @root = TkRoot.new {
    title 'PhoneBook'
    geometry '500x500'
    }
    TkLabel.new(@root) {
      text 'Nowy kontakt'
      pack
    }.grid(:row => 0, :column => 1, :columnspan => 2)

    TkLabel.new(@root) {
      text 'Nazwa'
      pack
    }.grid(:row => 1, :column => 1)
    @nazwa_entry = TkEntry.new(@root) {
      pack
    }.grid(:row => 1, :column => 2)
    TkLabel.new(@root) {
      text 'Numer telefonu:'
      pack
    }.grid(:row => 2, :column =>1)
    @numer_entry = TkEntry.new(@root) {
      pack
    }.grid(:row => 2, :column =>2)
    TkButton.new(@root){
      text 'Add'
      pack
    }.grid(:row => 4, :column=>2)
    # lista kontaktów
    TkLabel.new(@root) {
      text 'Lista kontaktow'
      pack
    }.grid(:row => 0)
    @listbox = TkListbox.new(@root) {
      pack
    }.grid(:row => 1, :rowspan => 4)
    # wyszukiwanie ludzi
    TkLabel.new(@root) {
      text 'Szukaj:'
      pack
    }.grid(:row=>5)
    @szukaj_entry = TkEntry.new(@root) {
    pack
    }.grid(:row => 5, :column => 1)
    TkButton.new(@root) {
      text 'Find'
      pack
    }.grid(:row => 5, :column => 2)
    @string = TkVariable.new
    @string.set_string('')
    TkLabel.new(@root) {
      textvariable @string
      pack
    }.grid(:row => 6, :column => 1)
    TkLabel.new(@root) {
      text 'Numer'
      pack
    }.grid(:row => 7, :column =>0 )
    @numer_var = TkVariable.new
    @numer_var.set_string('')
    TkLabel.new(@root) {
      textvariable @numer_var
      pack
    }.grid(:row => 7, :column => 1)
    Tk.mainloop
  end
end

PhoneBookGUI.new
