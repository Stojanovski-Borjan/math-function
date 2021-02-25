<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width">
    <title>Index</title>
    <link href="lib/mathquill.css" rel="stylesheet">
    <link href="lib/matheditor.css" rel="stylesheet">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js"></script>
    <!-- <script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-MML-AM_CHTML"></script>
    <script src="/dist/evaluatex.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="lib/mathquill.min.js"></script>
    <script src="lib/matheditor.js"></script>
    <script src="evaluatex/dist/evaluatex.min.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>

<body>


<div class="container mt-3">
    <h2>Toggleable Tabs</h2>
    <br>
    <!-- Nav tabs -->
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#home">EDITOR</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#menu1">LATEX</a>
        </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div id="home" class="container tab-pane active"><br>
            <h3>EDITOR</h3>

            <div id="frame">
                <h2>Enter Format</h2>
                <div id="answer"></div>
                <br />
                <div class="left">
                    <input type="checkbox" id="display" checked onchange="convert()"> <label for="display">Display
                    style</label>
                </div>
                <div class="right">
                    <input type="button" value="Render TeX" id="render" onclick="convert()" />
                    <%-- <button type="submit" class="btn btn-primary">Submit</button>--%>
                </div>
                <%-- FORM--%>
                <form method="POST" action="/index">
                    <input type="text" hidden id="input" name="input">
                    <button type="submit" class="btn btn-primary">Submit</button>

                </form>
                <%-- FORM--%>

                <br clear="all" />

                <div id="output"></div>
                <div id="result"></div>
            </div>
        </div>
        <div id="menu1" class="container tab-pane fade"><br>
            <h3>LaTeX</h3>
            <div id="frame2">
                <h2>Enter Format</h2>
                <form method="POST" action="/index-latex">

                <textarea id="input2" name="input" rows="5" cols="40">
                </textarea>

                <br />

                <div class="left">
                    <input type="checkbox" id="display2" checked onchange="convert2()"> <label
                        for="display2">Display style</label>
                </div>
                <div class="right">
                    <input type="button" value="Render TeX" id="render2" onclick="convert2()" />
                    <button type="submit">Submit</button>
                </div>
                </form>

                <br clear="all" />

                <div id="output2"></div>
            </div>
            <div id="result2"></div>
        </div>
    </div>
</div>


<script>

    var me = new MathEditor('answer');
    me.setTemplate('floating-toolbar', 300, 300);

    function solveMath() {
        let fn = evaluatex(me.getValue(), {}, { latex: true });
        let result = fn();

        let resultDiv = document.getElementById("result");
        resultDiv.innerText = "result: " + result;
    }

    function solveMath2() {
        let inputForm = document.getElementById("input2").value;

        let fn = evaluatex(inputForm, {}, { latex: true });
        let result2 = fn();

        let resultShow = document.getElementById("result2");
        resultShow.innerText = "Result: " + result2;
    }

    function convert() {
        var inputPlace = document.getElementById("input");
        inputPlace.value = me.getValue();
        var input = me.getValue();

        // let inputForm = document.getElementById("input");

        var display = document.getElementById("display");
        var button = document.getElementById("render");
        button.disabled = display.disabled = true;

        output = document.getElementById('output');
        output.innerHTML = '';

        // let fn = evaluatex(inputForm, {}, { latex: true });
        // let result = fn();

        // let resultShow = document.getElementById("result");
        // // let mathTest = document.getElementById("mathTest");
        // resultShow.innerText = "result: " +  result;


        MathJax.texReset();
        var options = MathJax.getMetricsFor(output);
        options.display = display.checked;
        MathJax.tex2chtmlPromise(input, options).then(function (node) {

            output.appendChild(node);
            MathJax.startup.document.clear();
            MathJax.startup.document.updateDocument();
        }).catch(function (err) {
            output.appendChild(document.createElement('pre')).appendChild(document.createTextNode(err.message));
        }).then(function () {
            button.disabled = display.disabled = false;
        });

        solveMath();
    }

    function convert2() {

        var input = document.getElementById("input2").value.trim();
        // let inputForm = document.getElementById("input");

        var display = document.getElementById("display2");
        var button = document.getElementById("render2");
        button.disabled = display.disabled = true;

        output = document.getElementById('output2');
        output.innerHTML = '';


        MathJax.texReset();
        var options = MathJax.getMetricsFor(output);
        options.display = display.checked;
        MathJax.tex2chtmlPromise(input, options).then(function (node) {

            output.appendChild(node);
            MathJax.startup.document.clear();
            MathJax.startup.document.updateDocument();
        }).catch(function (err) {
            output.appendChild(document.createElement('pre')).appendChild(document.createTextNode(err.message));
        }).then(function () {
            button.disabled = display.disabled = false;
        });
        solveMath2();
    }

</script>

</body>

</html>
