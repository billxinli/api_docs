class ApiDocs::DocsController < ApiDocs.config.base_controller.to_s.constantize
  def index
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, fenced_code_blocks: true, disable_indented_code_blocks: true)
    @api_controllers = {}
    Dir.glob(ApiDocs.config.docs_path.join('*.yml')).each do |file_path|
      @api_controllers[File.basename(file_path, '.yml')] = YAML.load_file(file_path)
    end
  end
end
