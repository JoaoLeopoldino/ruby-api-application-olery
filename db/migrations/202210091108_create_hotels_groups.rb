Sequel.migration do
  change do
    create_table(:hotel_groups) do
      primary_key :id
      foreign_key :group_id, :groups
      foreign_key :hotel_id, :hotels
    end
  end
end
