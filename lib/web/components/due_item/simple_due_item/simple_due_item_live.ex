defmodule Bonfire.UI.ValueFlows.SimpleDueItemLive do
  use Bonfire.Web, :stateless_component
  alias Surface.Components.Form.DateInput

  prop date, :string, required: true
  prop is_editable, :boolean, default: false
end
