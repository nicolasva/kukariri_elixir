defmodule UploadFile do
  import Mogrify
  
  def upload_img(image) do
    image_filename = to_char_list(image.filename)
    image_file_name_to_save = file_name_for_save(to_string(image_filename))
    image_content_type = to_string(to_char_list(image.content_type))
    image_path = to_string(to_char_list(image.path))
    File.cp_r "#{image_path}", "/Users/nicolasvandenbogaerde/elixir_erlang/kukariri/priv/static/images/img_items/#{image_file_name_to_save}"
    merge_map(image_file_name_to_save, image_content_type, image_path)
  end

  defp file_name_for_save(file_name) do
    Regex.replace(~r/[&$+,\/:;=?@<>\[\]\{\}\|\\\^~%# ]/, file_name, "_")
  end

  defp merge_map(image_filename, image_content_type, image_path) do
    map = Map.new
    map = Map.merge(image_filename_hash(image_filename), image_content_type_hash(image_content_type))
    Map.merge(map, image_path_hash(image_path))
  end

  defp image_filename_hash(image_filename) do
    map_image_filename = Map.new
    Map.put(map_image_filename, :image_filename, image_filename)
  end

  defp image_content_type_hash(image_content_type) do
    map_image_content_type = Map.new
    Map.put(map_image_content_type, :image_content_type, image_content_type)
  end

  defp image_path_hash(image_path) do
    map_image_path = Map.new
    Map.put(map_image_path, :image_path, image_path)
  end
end
