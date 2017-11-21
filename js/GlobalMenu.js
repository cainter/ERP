

/*
var GlobalMenuActive = Class.Create({
    initialize : function(){
        this.Ctrls     = [];
        this.NowCtrl   = null;

//        Do.AddListener( window, 'onresize', this.OnWinResize, this );
//        Do.AddListener( document, 'onclick', this.OnBodyClick, this );
    },
    RegCtrl : function( ctrl ){ this.Ctrls.push( ctrl ); },
//    OnWinResize : function(){ if( this.NowCtrl ) this.NowCtrl.Hidden(); },
//    OnBodyClick : function(){ if( this.NowCtrl ) this.NowCtrl.Unactive(); },
    Active : function( ctrl ){
        if( this.NowCtrl==ctrl ) reutnr this.NowCtrl.Show();    //return this._Show();

        if( this.NowCtrl ){
            this.NowCtrl.Unactive();    //this.Hidden();
        }
        this.NowCtrl = ctrl;
        this.NowCtrl.Active();          //this.Show();
    },
    Unactive : function( ctrl ){
        if( !this.NowCtrl ) return;
        if( this.NowCtrl==ctrl ){
            this.NowCtrl.Unactive();    //this.Hidden();
            this.NowCtrl = null;
        }
    },
__none:null});
*/



/* 全局菜单  功能
/* -------------------------------------------------------------------------------------------- */
var GlobalMenuMgr = Class.Create({
    initialize : function( rootElem, gmDatas, mainFrame ){
        this.RootElem  = rootElem;   // '<ul id="MainMenu" class="MainMenu ClearFix">'
        this.Data      = gmDatas;
        this.MainItems = {};
        this.GroupItems= {};
        this.NowItem   = null;
        this.MainFrame = mainFrame;
        
        this.ParseData( gmDatas );
        this.CreateElem();
    },
    ParseData : function( gmds ){
        for( var i=0; i<gmds.length; i++ ){
            var gmd = gmds[i];
            if( !gmd || !gmd.code ) continue;
            var mcode = gmd.code;
            if( mcode.length==2 ){
                var item = new GM_MainItem( gmd, this );
                //this.MainItems[ mcode ] = item;
                this.MainItems[ mcode-0 ] = item;//paul change[在chrome中,1x会跑到0x前,将0x转换成x]
            }
            else if( mcode.length==4 ){
                var pcode = mcode.substring( 0, 2 );  //alert(pcode);
                //var po = this.MainItems[ pcode ];
                var po = this.MainItems[ pcode-0 ];//paul change
                if( po ){
                    this.GroupItems[ mcode ] = new GM_Group( gmd, po );
                }
            }
            else if( mcode.length==6 ){
                var pc = mcode.substring( 0, 4 );  //alert(pcode);
                var po = this.GroupItems[ pc ];
                if( po ){
                    var mc = mcode.substring( 0, 2 );
                    var mo = this.MainItems[ mc-0 ];//paul change
                    var item = new GM_Link( gmd, mo, po, this.MainFrame );
                }
            }
        }
    },
    CreateElem : function(){
        var tab = 1;
        for( var c in this.MainItems ){
            var ret = this.MainItems[c].CreateElem( this.RootElem, tab, this.MainFrame );
            if( ret!==false ) tab++;
        }
    },
__none:null});


/* -------------------------------------------------------------------------------------------- */
var GM_MainItem = Class.Create({    // 主菜单项
    initialize : function( gmData, mgr ){
        this.Code   = gmData.code;
        this.Name   = gmData.name;
        this.Title  = gmData.title;
        this.Url    = gmData.url;
        this.Mgr    = mgr;
        this.Childs = {};
        this.ChildCount = 0;
        this.ChildShowCount = 0;
        this.IsNeedShow = false;
        
        this.Link = null;
        this.PBox = null;
        this.PWin = null;
        this.PCon = null;
        this.WinWidth = 0;
        this.WinLeft  = -40;
        this.IsShowed = false;
        this.IsPosOK  = false;
        
        this.OverTimer = 0;
        this.OutTimer = 0;
    },
    CreateElem : function( parElem, tabIndex, mainFrame ){
        if( !this.IsNeedShow ) return false;
        
        var href = this.Url;
        if( !href || href=='' || href=='#' ) href = 'href="javascript:;" ';
        else href = 'href="'+ href +'" target="'+ mainFrame.id +'" style="cursor:pointer;" ';
        var html = [
'<a tabindex="', tabIndex, '" ', href, 'class="MainLink" ><p></p><span>', this.Name, '</span><b></b></a>',
'<div class="PopMenuBox" ><div class="PopMenuWin" ><div class="PopMenuWarp" ></div></div></div>'];
        var li = document.createElement('LI');
        li.innerHTML = html.join('');           //alert( li.innerHTML+'              \n\n\n'+li.childNodes
        this.Link = li.childNodes[0];
        this.PBox = li.childNodes[1];
        this.PWin = this.PBox.firstChild;
        var dv    = this.PWin.firstChild;
        
        html = ['<table class="PopMenuCont" cellpadding="0" cellspacing="0">'];
        for( var i=0; i<this.ChildShowCount; i++ )
            html.push( '<tr><td></td><td></td><td></td></tr>' );
        html.push( '</table>' );
        dv.innerHTML = html.join('');
        this.PCon = dv.firstChild;
        this.PCon.firstChild.lastChild.className = 'NoBorder';
        
        i=0;
        for( var c in this.Childs ){    //alert( this.PCon.innerHTML );
            var tr = this.PCon.firstChild.childNodes[i];
            var td0 = tr.childNodes[0];
            var td1 = tr.childNodes[1];
            var td2 = tr.childNodes[2];
            if( this.Childs[c].IsColMerge ){
                CssClass.Append( tr, 'ColMerge' );
                tr.removeChild( td2 );
                td1.colSpan = 2;
                td2 = td1;
            }
            var ret = this.Childs[c].CreateElem( td0, td1, td2 );
            if( ret!==false ) i++;
        }
        
        parElem.appendChild( li );
        this.WinWidth = this.PCon.offsetWidth;          //alert( this.WinWidth);
        this.PWin.style.width = (this.WinWidth+8)+'px';
        
        Do.AddListener( this.Link, 'onclick', this.Link_OnClick, this );
        Do.AddListener( this.Link, 'onmouseover', this.OnMouseOver, this );
        Do.AddListener( this.PBox, 'onmouseover', this.OnMouseOver, this );
        Do.AddListener( this.Link, 'onmouseout', this.OnMouseOut, this );
        Do.AddListener( this.PBox, 'onmouseout', this.OnMouseOut, this );
        Do.AddListener( window, 'onresize', this.OnWinResize, this );
    },
    AppendChild : function( childObj ){
        if( !childObj || !childObj.Code ) return;
        var code  = childObj.Code;
        var pcode = code.substring( 0, 2 );
        if( this.Code == pcode ){
            this.Childs[code] = childObj;
            this.ChildCount ++ ;
            return this;
        }
    },
    NeedShow : function( childObj ){
        this.ChildShowCount++;  //alert( this.ChildShowCount +'    '+childObj.Code );
        this.IsNeedShow = true;
    },

    OnWinResize : function(){ this.IsPosOK = false; },
    Link_OnClick : function(){
        //CancelDefault();
        this.Show();
    },
    OnMouseOver : function(){
        if( !this.OverTimer ) this.OverTimer = setTimeout( this.Show.bind(this), 120 );
        this._Clear_OutTimer();
    },
    OnMouseOut : function(){
        if( !this.OutTimer ) this.OutTimer = setTimeout( this.Hidden.bind(this), 200 );
        this._Clear_OverTimer();
    },
    ComputePos : function(){
        if( this.IsPosOK===true ) return;

        var w  = this.WinWidth;
        var cw = document.documentElement.clientWidth;
        var rc = GetRect( this.Link );
        var ll = rc.left;
        var abl = -40;
        if( ll+w+abl>cw ) abl -= (ll+w+abl-cw+20);
        this.WinLeft = abl;
//        this.PBox.style.left = abl+'px';
//        this.PBox.style.top  = '25px';
        this.IsPosOK = true;
    },
    Close : function(){
        this.Hidden();
    },
    Show : function(){
        if( !this.IsShowed ){
            this.ComputePos();
            CssClass.Append( this.Link, 'Now' );
            this.PBox.style.top = '25px';
            this.PBox.style.left = this.WinLeft+'px'; //'-20px';
            this.IsShowed = true;
        }
        this._Clear_OverTimer();
    },
    Hidden : function(){
        if( this.IsShowed ){
            CssClass.Remove( this.Link, 'Now' );
            this.PBox.style.top = '-9999px';
            this.PBox.style.left = '-9999px';
            this.IsShowed = false;
        }
        this._Clear_OutTimer();
    },
    _Clear_OverTimer : function(){ clearTimeout( this.OverTimer ); this.OverTimer = 0; },
    _Clear_OutTimer :  function(){ clearTimeout( this.OutTimer );  this.OutTimer = 0; },
__none:null});



/* -------------------------------------------------------------------------------------------- */
var GM_Group = Class.Create({       // 菜单组
    initialize : function( gmData, parObj ){
        this.Code   = gmData.code;
        this.Name   = gmData.name;
        this.Title  = gmData.title;
        this.IsColMerge = gmData.isColMerge;
        
        this.ParentObj = parObj;    this.ParentObj.AppendChild( this );
        this.Childs = [];
        this.Childs[8] = [];    // Invalid Childs
        this.Childs[9] = [];    // Side Childs
        this.IsNeedShow = false;
    },
    CreateElem : function( td0, td1, td2 ){
        if( !this.IsNeedShow ) return false;
        
        var h2 = document.createElement('H2');
        h2.innerText = this.Name;
        td0.appendChild( h2 );
        
        var isRow = isFirst = false, c=0, htmlAr;
        var ul = document.createElement('UL');
        for( var i=0; i<=7; i++ ){
            if( !this.Childs[i] || this.Childs[i].length<1 ) continue;
            c = this.Childs[i].length;
            isFirst = true;
            isRow = false;
            var li = document.createElement('LI');
            for( var j=0; j<=9; j++ ){
                var lnk = this.Childs[i][j];
                if( !lnk ) continue;
                var type = lnk.CreateElem( li, isFirst );  //htmlAr, isFirst );
                if( type==2 ) isRow = true;
                if( isFirst ) isFirst = false;
            }
            if( isRow ) li.className = 'Row';
            ul.appendChild( li );
        }
        td1.appendChild( ul );

        if( this.Childs[9].length>0 ){
            var ul = document.createElement('UL');
            ul.className = 'side';
            appendLi( this.Childs[9], ul ); //htmlAr );
            td2.appendChild( ul );
        }
        if( this.Childs[8].length>0 ){
            var dv = document.createElement('DIV');
            dv.className = 'SidePanel';
            dv.innerHTML = '<h2>作废</h2><ul class="side"></ul>';
            var ul= dv.childNodes[1];
            appendLi( this.Childs[8], ul ); //htmlAr );
            td2.appendChild( dv );
        }
        
        function appendLi( cld, ul ){  //htmlAr ){
            for( var j=0; j<cld.length; j++ ){
                var lnk = cld[j];
                if( !lnk ) continue;
                var li = document.createElement('LI');
                lnk.CreateElem( li ); //htmlAr );
                ul.appendChild( li );
            }
        }
    },
    AppendChild : function( childObj ){
        if( !childObj || !childObj.Code ) return;
        var code  = childObj.Code;
        var pcode = code.substring( 0, 4 );
        var t = Value.ToInt( code.substring( 4, 5 ) );
        var l = Value.ToInt( code.substring( 5, 6 ) );
        if( this.Code != pcode ) return;
        
        if( t>=0 && t<=9 && l>=0 && l<=9 ){
            if( !(this.Childs[t]) ) this.Childs[t] = [];
            this.Childs[t][l] = childObj;
            
            this.NeedShow( childObj );
        }
    },
    NeedShow : function( childObj ){
        if( this.IsNeedShow==false ){
            this.IsNeedShow = true;
            this.ParentObj.NeedShow( this );
        }
   },
__none:null});



/* -------------------------------------------------------------------------------------------- */
var GM_Link = Class.Create({        // 菜单项
    initialize : function( gmData, mainMenuItem, parObj, mainFrame ){
        this.Code      = gmData.code;
        this.Type      = gmData.type;   //{code:'040112',type:2, name:'外协商登记', spareName:'', title:'', url:'' },
        this.Name      = gmData.name;
        this.SpareName = gmData.spareName || gmData.name;
        this.Title     = gmData.title;
        this.Url       = gmData.url;
        this.MainFrame = mainFrame;
        
        this.Link      = null;
        
        this.ParentObj = parObj;    this.ParentObj.AppendChild( this );
        this.MainMenuItem = mainMenuItem;
    },
    CreateElem : function( liElem, isFirst ){  //htmlAr, isFirst ){
        var name = this.Name;
        if( isFirst===true && this.Type==2  ){
            name = this.SpareName;
            this.Type = 0;
        }
        var cls = '';
        if( this.Type==0 )      cls = '';
        else if( this.Type==1 ) cls = 'Primary';
        else if( this.Type==2 ) cls = 'Else';
        else if( this.Type==3 ) cls = 'Weak';
        if( name.length>7 ) cls += ' Widen';
        
        var a = document.createElement('A');
        a.hideFocus  = true;
        a.innerText  = name;
        a.className  = cls;
        if( !this.Url || this.Url=='' || this.Url=='#' ){
            a.href   = 'javascript:;';
        } else if( this.Url.indexOf('javascript:')==0 ){
            a.href   = this.Url;
        } else{
            a.href   = this.Url;
            a.target = this.MainFrame.name;
        }
        if( this.Title )
            a.title  = this.Title;

        liElem.appendChild( a );
        
        this.Link = a;
        Do.AddListener( this.Link, 'onclick', this.Link_OnClick, this );
        return this.Type;
    },
    Link_OnClick : function(){
        this.MainMenuItem.Close();
    },
__none:null});
