module Webtractor::Filters
  class DefaultFilter < FilterGroup
    def filters
      [
        RemoveScripts.new,
        RemoveStyles.new,
        RemoveImages.new,
        RemoveForms.new,
        RemoveTables.new,
        RemoveComments.new,
        RemoveNoncontent.new,
        RemoveMenus.new,
        RemoveFooter.new,
        RemoveEmbeds.new,
        RemoveSmallest.new,
        RemoveEmpty.new,
        RemoveAttrs.new,
        BiggestBlock.new,
      ]
    end
  end
end
