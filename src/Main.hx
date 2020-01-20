using haxe.io.Path;
import sys.io.File;
import sys.FileSystem;
import sys.io.FileOutput;
class Main
{
    public static function main()
    {
        trace("start processor");
        new Main();
    }
    public function new()
    {
        var ignore = File.getContent(".gitignore").split("\n");
        for (dir in ignore)
        {
            trace(dir + "\nexists: " + FileSystem.exists("./" + dir) + " dir: " + FileSystem.isDirectory("./" + dir) + "\n\n");
            deleteDirectory("./" + dir.addTrailingSlash());
        }
        trace("dir " + FileSystem.readDirectory("./"));
    }
    private function deleteDirectory(path:String)
    {
        if (FileSystem.exists(path) && FileSystem.isDirectory(path))
        {
            for (name in FileSystem.readDirectory(path))
            {
                if (FileSystem.isDirectory(path + name))
                {
                    deleteDirectory(path + name + "/");
                    FileSystem.deleteDirectory(path + name);
                }else{
                    FileSystem.deleteFile(path + name);
                }
            }
        }
    }
}