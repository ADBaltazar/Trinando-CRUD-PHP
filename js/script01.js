
    var painetEtapa02 = window.document.getElementById("etapa002")
    var painetEtapa01 = window.document.getElementById("etapa001") 
    var painetEtapa03 = window.document.getElementById("etapa003") 
    var FormCurso = window.document.getElementById("FCurso") 

    var btpainel = window.document.getElementsByName("bt-001") 
   
    
    painetEtapa02.style.display="none" 
    painetEtapa03.style.display="none" 

    function encaminhar()
    { 
        painetEtapa01.style.display="none"
        painetEtapa02.style.display="block"
    }
    
    function reencaminhar()
    { 
        painetEtapa01.style.display="block"
        painetEtapa02.style.display="none"
    }
    function encaminharfinal()
    { 
        painetEtapa01.style.display="none"
        painetEtapa02.style.display="none"
        painetEtapa03.style.display="block"
    }

    function captura()
    {
      
        var txtnome = window.document.getElementsByName("nome")
        var txtapelido = window.document.getElementsByName("apelido")
        var txtgenero = window.document.getElementsByName("genero")
        
    }

    function abrirLog()
    {
        var login =window.document.getElementById("AbrirLogin")
        login.style.display="block"
    }
    function fecharLog()
    {
        var login =window.document.getElementById("AbrirLogin")
        login.style.display="none"
    }

    function cadastrar()
    {
        location.href ="Login.html"
    }