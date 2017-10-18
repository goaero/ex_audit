defmodule ExAudit.Test.Version do
  use Ecto.Schema
  import Ecto.Changeset

  schema "versions" do
    field :patch, ExAudit.Type.Patch
    field :entity_id, :integer
    field :entity_schema, :string
    field :action, ExAudit.Type.Action
    field :recorded_at, :utc_datetime

    # custom fields
    has_one :actor, Test.User
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:patch, :entity_id, :entity_schema, :action, :recorded_at])
    |> cast(params, [:actor_id]) # custom fields
  end
end