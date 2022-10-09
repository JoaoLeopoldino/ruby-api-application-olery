Sequel.migration do
  change do
    create_table(:group_subscriptions) do
      primary_key :id
      foreign_key :group_id, :groups
      foreign_key :contract_id, :contracts
    end
  end
end
