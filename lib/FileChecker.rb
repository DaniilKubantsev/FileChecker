# frozen_string_literal: true
require 'json'

require_relative "FileChecker/version"

module FileChecker
  class Error < StandardError; end

  class FileChecker
    def is_png?()
      #TODO
    end

    def is_pdf?()
      #TODO
    end

    def is_json?(file_path)
      begin
        JSON.parse(File.read(file_path))
        true
      rescue JSON::ParserError => e
        false
      end
    end

  end

end
