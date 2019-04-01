defprotocol Visualizations do

  @doc """
  Creates an intermediate representation of the data structure that gets
  passed in as the first parameter.

  `draw/1` should return a structure that provides details on how to render
  the data structure in an abstract format.
  """
  def draw(data_structure)
end
