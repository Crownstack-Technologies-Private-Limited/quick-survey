require "English"
module Extractor
  module HashTag
    def extract_hashtags(text, &) # :yields: hashtag_text
      hashtags = extract_hashtags_with_indices(text).pluck(:hashtag)
      hashtags.each(&) if block_given?
      hashtags
    end

    def extract_hashtags_with_indices(text, _options = { check_url_overlap: true }) # :yields: hashtag_text, start, end
      return [] unless text =~ /[#＃]/

      tags = []
      text.scan(Regex::Expression[:valid_hashtag]) do |_before, _hash, hash_text|
        match_data = $LAST_MATCH_INFO
        start_position = match_data.char_begin(2)
        end_position = match_data.char_end(3)
        after = ::Regexp.last_match.post_match
        unless after&.match?(Regex::Expression[:end_hashtag_match])
          tags << {
            hashtag: hash_text,
            indices: [start_position, end_position]
          }
        end
      end

      tags.each { |tag| yield tag[:hashtag], tag[:indices].first, tag[:indices].last } if block_given?
      tags
    end
  end
end

# Helper functions to return code point offsets instead of byte offsets.
class MatchData
  def char_begin(n)
    if string.respond_to? :codepoints
      self.begin(n)
    else
      string[0, self.begin(n)].codepoint_length
    end
  end

  def char_end(n)
    if string.respond_to? :codepoints
      self.end(n)
    else
      string[0, self.end(n)].codepoint_length
    end
  end
end
