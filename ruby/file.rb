# 
def FindFile( fileName, rootPath)
	dirEntry = Dir.glob(rootPath + "/*")
	for entryName in dirEntry
		entryFileName = File.basename(entryName)
		if entryFileName == fileName then
			return true
		end
	end
	
	return false
end

