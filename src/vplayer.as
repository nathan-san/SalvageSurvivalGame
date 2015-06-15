package {     
    import flash.display.Sprite;     
    import flash.media.Video;     
    import flash.net.NetConnection;     
    import flash.net.NetStream;      
    import flash.events.Event;
    import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;

        public class vplayer extends Sprite{                 
            public var vid:Video = new Video(1920,1080);
            private var nc:NetConnection = new NetConnection();
            public var ns:NetStream;
            public var listener:Object = new Object();
            private var _duration:Number = 0; 

            public function vplayer():void {   
                addChild(vid);
                nc.connect(null);
                ns = new NetStream(nc);
                vid.attachNetStream(ns);
                listener.onMetaData = metaDataHandler;
                ns.client = listener;      
				ns.addEventListener(NetStatusEvent.NET_STATUS, loop);

                //customClient.onCuePoint = cuePointHandler;
				//playVideo00();
            }
            public function playVideo00():void{
                ns.play("../lib/bg.mp4");
				
            }
            public function stopVideo00():void{
                ns.close();
            }
            /*public function cuePointHandler(infoObject:Object):void {
                trace("cuePoint");
            }*/
            public function metaDataHandler(infoObject:Object):void {
                _duration = infoObject["duration"];
                trace (" Time:  " + infoObject["duration"]);
            }
            public function get duration00():Number {     
                return _duration; 
            }
			public function loop(event:NetStatusEvent):void{
				switch (event.info.code){
					case"NetStream.Play.Stop":
					ns.seek(0);
			}};

        } 
}