<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width">
    <title>Index</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js"></script>
    <!-- <script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-MML-AM_CHTML"></script>
    <script src="/dist/evaluatex.min.js"></script> -->

</head>

<body onclick="convert(this.value)">
<div id="frame">
    <h2>Enter Format</h2>
    <c:forEach var="formula" items="${formulas}">
        <p>Formula: ${formula.getId()}</p>
        <input id="input" value="${formula.getFormula()}" />

        <div class="left">
            <input type="checkbox" id="display" visibility="" checked onchange="convert()"> <label for="display">Display style</label>
        </div>
        <div class="right">
            <button  id="render" value="${formula.getFormula()}" >Render TeX</button>
        </div>
        <br><hr>
    </c:forEach>

    <br clear="all" />

    <div id="output"></div>
    <div id="result"></div>

</div>


<script>

    function convert(params) {

        params = params || window.event;
        params = params.target || params.srcElement;

        console.log(params.value);

        var input = params.value;

        var display = document.getElementById("display");
        var button = document.getElementById("render");
        button.disabled = display.disabled = true;

        output = document.getElementById('output');
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
    }
</script>

</body>

</html>
