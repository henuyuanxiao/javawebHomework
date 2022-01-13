package jdbcweb;

public class video {
        private int vid;
        private String Vname;
        private String Class;
        private int Owner;
        private String Path;
        private int WatchN=0;
        private int GoodN=0;
        private String Message;
        private String PicPath;
        public video() {
            this.vid = 0;
            this.Vname = null;
            this.Class = null;
            this.Owner = 0;
            this.Path = null;
            this.WatchN = 0;
            this.GoodN = 0;
            this.Message = null;
            this.PicPath = null;
        }
        public video(int vid,String Vname,String Class,int Owner,String Path,String Message,String PicPath) {
            this.vid=vid;
            this.Vname=Vname;
            this.Class=Class;
            this.Owner=Owner;
            this.Path=Path;
            this.WatchN=0;
            this.GoodN=0;
            this.Message=Message;
            this.PicPath = PicPath;
        }
        public void setVid(int vid) {
            this.vid=vid;
        }
        public void setVname(String Vname) {
            this.Vname=Vname;
        }
        public void setClass(String Class) {
            this.Class=Class;
        }
        public void setOwner(int Owner) {
            this.Owner=Owner;
        }
        public void setPath(String Path) {
            this.Path=Path;
        }
        public void setWatchN(int WatchN) {
            this.WatchN=WatchN;
        }
        public void setGoodN(int GoodN) {
            this.GoodN=GoodN;
        }
        public void setMessage(String Message) {
            this.Message=Message;
        }
        public void setPicPath(String PicPath) {
            this.PicPath=PicPath;
        }

        public int getVid() {
            return this.vid;
        }
        public String getVname() {
            return this.Vname;
        }
        public String getclass() {
            return this.Class;
        }
        public int getOwner() {
            return this.Owner;
        }
        public String getPath() {
            return this.Path;
        }
        public int getWatchN() {
            return this.WatchN;
        }
        public int getGoodN() {
            return this.GoodN;
        }
        public String getMessage() {
            return this.Message;
        }
        public String getPicPath() {
            return this.PicPath;
        }
    }

