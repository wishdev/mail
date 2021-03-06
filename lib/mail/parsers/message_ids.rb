# Autogenerated from a Treetop grammar. Edits may be lost.


module Mail
  module MessageIds
    include Treetop::Runtime

    def root
      @root || :primary
    end

    include RFC2822

    module Primary0
      def message_ids
        [first_msg_id] + other_msg_ids.elements.map { |o| o.msg_id_value }
      end
    end

    def _nt_primary
      start_index = index
      if node_cache[:primary].has_key?(index)
        cached = node_cache[:primary][index]
        @index = cached.interval.end if cached
        return cached
      end

      r0 = _nt_message_ids
      r0.extend(Primary0)

      node_cache[:primary][start_index] = r0

      r0
    end

  end

  class MessageIdsParser < Treetop::Runtime::CompiledParser
    include MessageIds
  end

end