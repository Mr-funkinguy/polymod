package polymod.fs;

import polymod.Polymod.ModMetadata;
import haxe.io.Bytes;

/**
 * A set of parameters used to initialize the Polymod file system.
 */
typedef PolymodFileSystemParams =
{
	/**
	 * The root directory which Polymod should read mods from.
	 * May not be applicable for file systems which dicatate the directory, or use no directory.
	 */
	?modRoot:String,
}

/**
 * A standard interface for the various file systems that Polymod supports.
 */
interface IFileSystem
{
	/**
	 * Returns whether the file or directory at the given path exists.
	 * @param path The path to check.
	 * @return Whether there is a file or directory there.
	 */
	public function exists(path:String):Bool;

	/**
	 * Returns whether the provided path is a directory.
	 * @param path The path to check.
	 * @return Whether the path is a directory.
	 */
	public function isDirectory(path:String):Bool;

	/**
	 * Returns a list of files and folders contained within the provided directory path.
	 * Does not return files in subfolders, use readDirectoryRecursive for that.
	 * @param path The path to check.
	 * @return An array of file paths and folder paths.
	 */
	public function readDirectory(path:String):Array<String>;

	/**
	 * Returns a list of files contained within the provided directory path.
	 * Checks all subfolders recursively. Returns only files.
	 * @param path The path to check.
	 * @return An array of file paths.
	 */
	public function readDirectoryRecursive(path:String):Array<String>;

	/**
	 * Returns the content of a given file as a string.
	 * Returns null if the file can't be found.
	 * @param path The file to read.
	 * @return The text content of the file.
	 */
	public function getFileContent(path:String):Null<String>;

	/**
	 * Returns the content of a given file as Bytes.
	 * Returns null if the file can't be found.
	 * @param path The file to read.
	 * @return The byte content of the file.
	 */
	public function getFileBytes(path:String):Null<Bytes>;

	/**
	 * Provide a list of valid mods for this file system to load.
	 * @return An array of mod IDs.
	 */
	public function scanMods():Array<String>;

	/**
	 * Provides the metadata for a given mod. Returns null if the mod does not exist.
	 * @param modId The ID of the mod.
	 * @return The mod metadata.
	 */
	public function getMetadata(modId:String):Null<ModMetadata>;
}
