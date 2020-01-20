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
        //ignoreDelete();
        ignoreDelete();
    }
    private function ignoreDelete()
    {
        for (name in ["minorGems","OneLife","OneLifeData7"])
        {
            deleteDirectory("./" + name + "/.git");
        }
    }
    private function deleteRepos()
    {
        for (name in ["minorGems","OneLife","OneLifeData7"]) deleteDirectory(name);
    }
    private function deleteDirectory(path:String)
    {
        if (FileSystem.exists(path) && FileSystem.isDirectory(path))
        {
            for (name in FileSystem.readDirectory(path))
            {
                if (FileSystem.isDirectory(Path.join([path,name])))
                {
                    deleteDirectory(Path.join([path,name.addTrailingSlash()]));
                    FileSystem.deleteDirectory(Path.join([path,name]));
                }else{
                    FileSystem.deleteFile(Path.join([path,name]));
                }
            }
        }
    }
}