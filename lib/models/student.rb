class Student
  extend Persistable::ClassMethods

  ATTRIBUTES = {
    :id => "INTEGER PRIMARY KEY AUTOINCREMENT",
    :name => "TEXT"
  }

  def self.attributes
    ATTRIBUTES
  end

  def self.database
    @@db ||= SQLite3::Database.new('student.db')
  end

end
