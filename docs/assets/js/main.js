const loading = document.getElementById('loading');
const main = document.getElementById('wrapper');

imagesLoaded( 'main', { background: "main" }, function() {
  const msM = 1000;
  loading.style.transition = 'opacity ' + msM + 'ms';
  main.style.transition = 'opacity ' + msM + 'ms';
  
  const loadingOpacity = function(){ //透過させる関数を定義
    loading.style.opacity = 0;
  }
  const loadingDisplay = function(){ //非表示にする関数を定義
    loading.style.display = "none";
    main.style.opacity = 1;
  }
 
  setTimeout(loadingOpacity, 1500); //画像読み込み後、１秒後に透過を開始
  setTimeout(loadingDisplay, 1500 + msM); //画像読み込み後、２秒後に非表示
});
