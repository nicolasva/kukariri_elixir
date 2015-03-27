defmodule Kukariri.ContactsView do
  import Kukariri.Router
  use Kukariri.View

  def lent_item?(item_id) do
    Kukariri.Queries.lent_item?(item_id)
  end

  def lent_contact_item(contact_id, item_id) do
    Kukariri.Queries.contact_provided_date_lent?(contact_id, item_id)
  end
end
