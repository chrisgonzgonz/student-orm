module Persistable
  module ClassMethods

    def table_name
      "#{self.to_s.downcase}s"
    end

    def drop
      database.execute "DROP TABLE IF EXISTS #{table_name};"
    end

    def table_exists?(table_name)
      database.execute "SELECT * FROM sqlite_master WHERE type = 'table' AND name = ?", table_name
    end

    def create_table
      database.execute "CREATE TABLE IF NOT EXISTS #{table_name} (
        #{attributes_for_create}
      )"
    end

    def attributes_for_create
      self.attributes.collect{|k,v| [k,v]}.join(",")
    end
  end
end
