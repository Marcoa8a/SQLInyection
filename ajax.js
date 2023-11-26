function fetchData(option, container) {
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            container.innerHTML = this.responseText;
        }
    };

    xmlhttp.open("GET", "getData.php?option=" + option, true);
    xmlhttp.send();
}
