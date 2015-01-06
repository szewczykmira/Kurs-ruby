require 'tk'
require 'yaml'

class Person
  attr_accessor :name, :phonenumber
  def initialize(name, phone)
    @name = name
    @phonenumber = phone
  end
end

class PhoneBookDb
  attr_accessor :database, :add_contact, :save
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
    self.save
  end
  def delete_contact(key)
    @database.delete(key)
    self.save
  end
  def find_contact(key)
    @database.each do |ikey|
      if ikey == key
        @database[key]
      end
    end
  end
  def save
    open(@file, 'w') { |f| YAML.dump(@database,f)}
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
    @but = TkButton.new(@root){
      text 'Add'
      pack
    }.grid(:row => 4, :column=>2)
    @but.command { self.add }
    # lista kontaktów
    TkLabel.new(@root) {
      text 'Lista kontaktow'
      pack
    }.grid(:row => 0)
    @listbox = TkListbox.new(@root) {
      pack
    }.grid(:row => 1, :rowspan => 4)
    @db.database.each do |person,value|
      @listbox.insert 0, person
    end
    @listbox.bind '<ListboxSelect>', proc{onSelect}
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
    @nazwa_var = TkVariable.new()
    @nazwa_var.value = 'Siema'
    TkLabel.new(@root) {
      textvariable @nazwa_var
      pack
    }.grid(:row => 8, :column => 1)
    TkLabel.new(@root) {
      text 'Numer'
      pack
    }.grid(:row => 7, :column =>0 )
    @numer_var = TkVariable.new
    TkLabel.new(@root) {
      textvariable @numer_var
      pack
    }.grid(:row => 7, :column => 1)
    Tk.mainloop
  end
  def onSelect
    name = @listbox.curselection
    name = @listbox.get(name)
    @nazwa_var.value = name
    puts @nazwa_var.to_s
  end
  def add
    @db.add_contact(@nazwa_entry.value.to_s, @numer_entry.value.to_i)
    @listbox.insert 0, @nazwa_entry.value
  end
end

PhoneBookGUI.new
