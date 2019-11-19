function addFields(){
    var number = document.getElementById("member").value;
    var container = document.getElementById("container");
    while (container.hasChildNodes()) {
        container.removeChild(container.lastChild);
    }
    for (i=0;i<number;i++){
        container.appendChild(document.createTextNode("Member " + (i+1)));
        var input = document.createElement("input");
        input.type = "text";
        container.appendChild(input);
        container.appendChild(document.createElement("br"));
    }
}
