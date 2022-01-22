/*--JS for DOM Parser--*/

var xmlDoc
var xmlFile = 'inv.xml'

//function to load xml doc
function loadXML()
{
    var xmlReq = new XMLHttpRequest;
    xmlReq.onreadystatechange = function()
    {
        console.log(xmlReq.readyState)
        if((xmlReq.readyState == 4) && (xmlReq.status == 200))
        {
            //xml doc successfully retrieved
            xmlDoc = xmlReq.responseXML
            displayTable()
        }
    }
    xmlReq.open('GET', xmlFile, true)
    xmlReq.send()
}

//function to display html table from xml data
function displayTable()
{
    var i;
    var table = "<tr><th>Product_ID</th><th>Name</th><th>Quantity</th><th>Price</th><th>Manufacture_Date</th></tr>"

    var x = xmlDoc.getElementsByTagName("Products")
    for (i = 0; i < x.length; i++)
    {
        table += "<tr><td>" +
            x[i].getElementsByTagName("product_id")[0].childNodes[0].nodeValue + "</td><td>" +
            x[i].getElementsByTagName("Name")[0].childNodes[0].nodeValue + "</td><td>" +
            x[i].getElementsByTagName("Quantity")[0].childNodes[0].nodeValue + "</td><td>" +
            x[i].getElementsByTagName("price")[0].childNodes[0].nodeValue + "</td><td>" +
            x[i].getElementsByTagName("mft_date")[0].childNodes[0].nodeValue + "</td><td>" +
            "<td><span class='material-icons' onclick='editRecord(" +i+ ")'>edit</span></td>" +
            "<td><span class='material-icons' onclick='deleteRecord(" +i+ ")'>delete</span></td></tr>"
    }
    document.getElementById("table").innerHTML = table
}

//function to delete record from XML
function deleteRecord(i)
{
    y = xmlDoc.getElementsByTagName("Products")[i]
    var name = y.getElementsByTagName("Name")[0].childNodes[0].nodeValue
    var reply = confirm("Do you want to delete record? \nName: " + name)
    if(reply == true)
    {
        xmlDoc.documentElement.removeChild(y)
        console.log("Record deleted: " + name)
        displayTable()
    }
}

//function to open form to add new record to xml
function openForm()
{
    document.getElementById("addRecordForm").style.display = "block"
}

//function to close form to add new record to xml
function closeForm()
{
    document.getElementById("addRecordForm").style.display = "none"
}

//function to add new record to xml
function addNewRecord()
{
    var i
    var pro = []
    var x = document.getElementById("addRecordForm")
    product = xmlDoc.createElement("Products")
    pro[0] = xmlDoc.createElement("product_id")
    pro[1] = xmlDoc.createElement("Name")
    pro[2] = xmlDoc.createElement("Quantity")
    pro[3] = xmlDoc.createElement("price")
    pro[4] = xmlDoc.createElement("mft_date")
    for(i = 0; i < 6; i++)
    {
        pro[i].appendChild(xmlDoc.createTextNode(x.elements[i].value))
        proloyee.appendChild(pro[i])
    }
    xmlDoc.documentElement.appendChild(product);
    console.log("Record added: " + x.elements[0].value)
    displayTable()
}