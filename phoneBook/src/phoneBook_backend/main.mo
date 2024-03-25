// "mo:base/HashMap" kütüphanesinden harita veri yapısı oluşturmak için HashMap modülünü içe aktarır.
import Map "mo:base/HashMap";
// Import the Text module from the mo:base library for handling text data.
import Text "mo:base/Text";

// Define an actor.
actor TALHAs_PHONE_BOOK{

  // name ve phone için özel veri tiplerini tanımlar.
  type Name = Text;
  type Phone = Text;

  // Define a data type for an entry in the phone book.
  type Entry = {
    desc: Text;
    phone: Phone;
  };


  // phoneBook adında bir HashMap başlatır. Bu harita isim-kayıt ikililerini tutar.
  // The initial capacity is set to 0, and equality and hashing functions for Text types are specified.
  // Başlangıç kapasitesi 0 olarak ayarlanır.
  // Metin tipleri için equal ve hashing işlevi belirtilir.
  let phoneBook = Map.HashMap<Name, Entry>(0, Text.equal, Text.hash);

  // Define a public function 'insert'
  // Telefon rehberine yeni bir kayıt eklemek için
  // Bir Name ve bir Entry alır ve asenkron olarak çalışır.
  public func insert(name: Name, entry: Entry): async () {
    // Put the entry into the phone book map with the given name as the key.
    // Belirtilen Name'i anahtar olarak kullanarak entry'i telefon rehberine ekler.
    phoneBook.put(name, entry);
  };

  // Define a public query function 'lookup' to search for an entry in the phone book by name.
  // Bir isim alır ve asenkron olarak bir kayıt (opsiyonel olarak) döndürür.
  public query func lookup(name: Name): async ?Entry {
    // Get the entry associated with the given name from the phone book.
    // If the name is not found, it returns null... 
    // Telefon rehberinden belirtilen isimle ilişkilendirilen kaydı alır. isim bulunmazsa null değer döndürür.
    phoneBook.get(name);
  };

};
