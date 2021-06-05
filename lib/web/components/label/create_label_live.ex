defmodule Bonfire.UI.ValueFlows.CreateLabelLive do
  use Bonfire.Web, :live_component


  def mount(socket) do

    {:ok, socket
    |> assign(
      label_search_results: [],
      label_search_phrase: ""
    )}
  end

    def handle_event("label_create", %{"label_input" => label_entered}, socket) do
    assigns = with {:ok, label} <- Bonfire.Classify.Categories.create(e(socket.assigns, :current_user, nil), %{name: label_entered}) do

      [
        label_search_results: [],
        label_search_phrase: "",
        chosen_labels: [Bonfire.Repo.preload(label, :profile)] ++ Map.get(socket.assigns, :chosen_labels, []),
      ]
    else e ->
      IO.inspect(error: e)
      []
    end

    {:noreply, assign(socket, assigns)}
  end

end
