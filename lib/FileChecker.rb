# frozen_string_literal: true
require 'json'

require_relative "FileChecker/version"

module FileChecker

  class Error < StandardError; end

  class FileChecker

    # Daniil Kubantsev
    def is_png?(filepath)
      begin
        text = File.open(filepath, "rb") { |file| file.read(8) }
        text == "\x89PNG\r\n\x1A\n".b and extencion = File.extname(filepath).delete('.').upcase == 'PNG'
      rescue Errno::ENOENT => e
        raise e.message
      end
    end

    # Daniil Kubantsev
    def is_pdf?(filepath)
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
      return false unless File.exist?(file_path)

      begin
        # Parse check
        JSON.parse(File.read(file_path))
        true
      rescue JSON::ParserError => e
        false
      end
    end

    # Leonid Krupnov
    def is_xml?(file_path)
      unless File.exist?(file_path)
        puts 'file doesnt exist'
      end

      # First line check
      File.open(file_path, "r") do |file|
        first_line = file.readline.strip
        return first_line.start_with?("<?xml")
      end
    end

    # Maxim Simonov
    def is_txt?(filepath)
      return false unless File.exist?(filepath)

      begin
        extension = File.extname(filepath).downcase
        if extension == '.txt'
          File.open(filepath, "r") do |file|
            content = file.read
            return true
          end
        else
          return false
        end
      end
    end

    # Maxim Simonov
    def is_html?(filepath)
      return false unless File.exist?(filepath)

      begin
        extension = File.extname(filepath).downcase
        if extension == '.html'
          File.open(filepath, "r") do |file|
            content = file.read
            if content.include?("<!DOCTYPE html>") && content.include?("</html>")
              return true
            end
            false
          end
        end
      end
    end

    # Artem Gadjimuradov
    def is_jpg?(filepath)
      begin
        text = File.open(filepath, "rb") { |f| f.read(10) }
        extencion = file.extname(filepath)
        expected = "ffd8ffe000104a464946"
        text.unpack('H*')[0] == expected && extencion == ".jpg"
      rescue Errno::ENOENT => e
        raise e.message
      end
    end

    # Artem Gadjimuradov
    def is_bin?(filepath)
      begin
        text = File.open(filepath, "rb") { |f| f.read(10) }
        extencion = file.extname(filepath)
        expected = "01234"
        text == expected && extencion == ".bin"
      rescue Errno::ENOENT => e
        raise e.message
      end

      # Fursova Alexsandra
      def is_docx?(filepath)
        return false unless File.exist?(filepath)

        begin
          doc = Docx::Document.open(filepath)
          doc.paragraphs.each do |paragraph|
            paragraph.text
          end
          true
        rescue
          false
        end
      end
    end
  end
end

