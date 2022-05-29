Class iris.lscalese.objectscript4gitlab.test Extends %CSP.Page
{

ClassMethod OnPreHTTP() As %Boolean
{
    Set %session.AppTimeout = 3600
    If $g(%request.Data("action",1))="save" {

        Set fName = "/home/irisowner/rouge/spec/visual/samples/objectscript"
        
        If '##class(%File).Exists(fName_".cbk") {
            Do ##class(%File).CopyFile(fName,fName_".cbk",1)
        }

        Set code = %request.Data("code",1), ^zcode = code
        Do ##class(%File).Delete(fName)

        Set stream=##class(%Stream.FileCharacter).%New()
        Set sc=stream.LinkToFile(fName)
        Do stream.Write(code)
        Do stream.%Save()

    } ElseIf $g(%request.Data("action",1))="reset" {
        Set fName = "/home/irisowner/rouge/spec/visual/samples/objectscript"

        If ##class(%File).Exists(fName_".cbk") {
            Do ##class(%File).CopyFile(fName_".cbk",fName,1)
        }
    }
    Quit 1
}

ClassMethod OnPage() As %Status
{
    &html<
        <!doctype html>
        <html lang="en">
        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <title>ObjectScript lexer for rouge</title>
        </head>
        <body onload="">
            <nav class="navbar navbar-dark bg-dark">
                <span class="navbar-brand mb-0 h1">Test ObjectScript lexer for Rouge</span>
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active">
                    <a class="nav-link" href="https://github.com/lscalese/rouge">Github</a>
                </li>
                </ul>   
                
            </nav>
            &nbsp;
            <br/>
            <div class="container">

                <button type="button" class="btn btn-primary" onclick="SetCOSCode();">Submit</button>
                <button type="button" class="btn btn-primary" onclick="Reset();">Reset</button>

                <div class="form-group">
                    &nbsp;<br/>
                    <label for="objectscript-txt">Objectscript</label>
                    <textarea class="form-control" id="objectscript-txt" rows="20" placeholder="*** Copy your Objectscript code here ***"></textarea>
                </div>
            </div>

            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    >
    Do ..writeJS()
    &html<
        </body>
        </html>
    >
    Return $$$OK
}

ClassMethod writeJS() As %Status
{
    Set tSc = $$$OK
    Write "<script type=""text/javascript"">"
    &js<

        function SetCOSCode() {
            jQuery.ajax({
                type: "POST",
                url: "./iris.lscalese.objectscript4gitlab.test.cls",
                async: true,
                data: {"action":"save","code":jQuery("#objectscript-txt").val()},
                success: function (data){
                    
                    window.open('http://localhost:9592/objectscript');
                },
                error: function(jqXHR, textStatus, errorThrown ) {
                    
                },
                beforeSend: function (xhr) {
                    
                }
            });
        }

        function Reset() {
            jQuery.ajax({
                type: "POST",
                url: "./iris.lscalese.objectscript4gitlab.test.cls",
                async: true,
                data: {"action":"reset"},
                success: function (data){
                    
                    window.open('http://localhost:9592/objectscript');
                },
                error: function(jqXHR, textStatus, errorThrown ) {
                    
                },
                beforeSend: function (xhr) {
                    
                }
            });
        }

    >
    Write "</script>"
    Return tSc
}

}
