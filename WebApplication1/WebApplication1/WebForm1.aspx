<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"> 
   <head id="Head1" runat="server">
   <title></title>
</head>
<body>
   <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
   <script type="text/javascript">
       var long = 0;
       var lat = 0;
       window.onload = function () {
           var mapOptions = {
               center: new google.maps.LatLng(28.5355, 77.3910),
               zoom: 14,
               mapTypeId: google.maps.MapTypeId.ROADMAP
           };
           var infoWindow = new google.maps.InfoWindow();
           var latlngbounds = new google.maps.LatLngBounds();
           var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
           google.maps.event.addListener(map, 'click', function (e) {
               long = e.latLng.lng();
               lat = e.latLng.lat();
               document.getElementById("lat").value = lat;
               document.getElementById("lng").value = long;
               alert("Latitude: " + lat + "\r\nLongitude: " + long);
           });
       }
   </script>

<form id="myForm" runat="server">
   <div id="dvMap" style="width: 900px; height: 900px">
   </div>
   <asp:HiddenField ID="lat" runat="server" />
   <asp:HiddenField ID="lng" runat="server" />
   <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />


</form>
    </body>
</html>

