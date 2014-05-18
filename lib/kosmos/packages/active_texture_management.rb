class ActiveTextureManagementBasic < Kosmos::Package
  title 'Active Texture Management - Basic'
  aliases 'Active Texture Management'

  url 'https://github.com/rbray89/ActiveTextureManagement/releases/download/3-1-basic/ActiveTextureManagement-Basic-3-1.zip'

  def install
    merge_directory '.'
  end
end

class ActiveTextureManagementAggressive < Kosmos::Package
  title 'Active Texture Management - Aggressive'

  url 'https://github.com/rbray89/ActiveTextureManagement/releases/download/3-1-aggressive/ActiveTextureManagement-3-1.zip'

  def install
    merge_directory '.'
  end
end
