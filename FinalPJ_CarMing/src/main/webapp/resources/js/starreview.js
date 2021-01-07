var locked = 0;
        
        function show(star){
            if(locked){
                return;
            }
            var i;
            var image;
            var el;
            
            for(i=1; i<=star; i++){
                image = 'image'+i;
                el = document.getElementById(image).src = "img/star.png";
            }
        }
        function noshow(star){
            if(locked){
                return;
            }
            var i;
            var image;
            var el;
            
            for(i=1; i<=star; i++){
                image = 'image'+i;
                el = document.getElementById(image).src = "img/nonstar.png";
            }
        }
        function lock(star){
            show(star);
            locked = 1;
            for(i=1; i<=star; i++){
                image = 'image'+i;
                el = document.getElementById(image).src = "img/star.png";
            }
        }
        function mark(star){
            lock(star);
            alert("선택2"+star);
        }