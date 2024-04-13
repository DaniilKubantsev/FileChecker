# frozen_string_literal: true
require 'json'

require_relative "FileChecker/version"

module FileChecker
  class Error < StandardError; end

  class FileChecker

    # Daniil Kubantsev
    def self.is_png?(filepath)
      begin
        text = File.open(filepath,"rb"){ |file| file.read(8) }
        text == "\x89PNG\r\n\x1A\n".b and extencion = File.extname(filepath).delete('.').upcase == 'PNG'
      rescue Errno::ENOENT => e
        raise e.message
      end
    end

    # Daniil Kubantsev
    def self.is_pdf?(filepath)
      begin
        extencion = File.extname(filepath).delete('.').upcase
        first_line = File.open(filepath, "r").readline.slice(1, 3)
        first_line == extencion
      rescue Errno::ENOENT => e
        raise e.message
      end
    end
    
    # Leonid Krupnov
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
