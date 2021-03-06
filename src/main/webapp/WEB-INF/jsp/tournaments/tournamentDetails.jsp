<%@ page session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>



<body onload="initMap()">
<petclinic:layout pageName="tournaments">

	<h2>Tournament Information</h2>


	<table class="table table-striped">
		<tr>
			<th>Name</th>
			<td><b><c:out value="${tournament.name}" /></b></td>
		</tr>
		<tr>
			<th>Date</th>
			<td><c:out value="${tournament.date}" /></td>
		</tr>
		<tr>
			<th>Capacity</th>
			<td><c:out value="${tournament.capacity}" /> spectators</td>
		</tr>
		<tr>
			<th>Breed Restriction</th>
			<td><c:out value="${tournament.breedRestriction.name}" /></td>
		</tr>
		<tr>
			<th>First Prize</th>
			<td><c:out value="${tournament.firstClassified}" /> EUR</td>
		</tr>
		<tr>
			<th>Second Prize</th>
			<td><c:out value="${tournament.secondClassified}" /> EUR</td>
		</tr>
		<tr>
			<th>Third Prize</th>
			<td><c:out value="${tournament.thirdClassified}" /> EUR</td>
		</tr>
		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Race'}">
		<tr>
			<th>Canodrome</th>
			<td><c:out value="${tournament.canodrome}"/></td>
		</tr>
		</c:if>
		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Beauty'}">
		<tr>
			<th>Place</th>
			<td><c:out value="${tournament.place}"/></td>
		</tr>
		</c:if>
		
		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Hability'}">
		<tr>
			<th>Circuit</th>
			<td><c:out value="${tournament.circuit}"/></td>
		</tr>
		</c:if>
		
	</table>
	
			<input id="lat" type="hidden" value="${lat}"> 
		<input id="lng" type="hidden" value="${lng}"> 
		
	<br />
	<spring:url value="{tournamentType}/{tournamentId}/edit" var="addUrl">
		<spring:param name="tournamentId" value="${tournament.id}" />
		

		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Hability'}">
				<spring:param name="tournamentType" value="hability" />
				<input id="circuit" type="hidden" value="${tournament.circuit}"> 
		</c:if>
		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Beauty'}">
				<spring:param name="tournamentType" value="beauty" />
				<input id="place" type="hidden" value="${tournament.place}"> 
		</c:if>
		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Race'}">
				<spring:param name="tournamentType" value="race" />
				<input id="canodrome" type="hidden" value="${tournament.canodrome}"> 
				
		</c:if>
	</spring:url>
	<a href="${fn:escapeXml(addUrl)}" class="btn btn-default">Edit this Tournament</a>
	
	<spring:url value="{tournamentType}/{tournamentId}/result" var="resultUrl">
		<spring:param name="tournamentId" value="${tournament.id}" />

		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Hability'}">
				<spring:param name="tournamentType" value="hability" />
				<input id="circuit" type="hidden" value="${tournament.circuit}"> 
		</c:if>
		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Beauty'}">
				<spring:param name="tournamentType" value="beauty" />
				<input id="place" type="hidden" value="${tournament.place}"> 
		</c:if>
		<c:if test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Race'}">
				<spring:param name="tournamentType" value="race" />
				<input id="canodrome" type="hidden" value="${tournament.canodrome}"> 
				
		</c:if>
	</spring:url>
	<a href="${fn:escapeXml(resultUrl)}" class="btn btn-default">Show results</a>

	<br />
	<br />

     
    <script type="text/javascript">
    
    function  writeErrorMap(){
  		document.getElementById('map').innerHTML='<h2>This location cannot be found in LocationIQ</h2> <br/><spring:url value="/resources/images/sad_dog.png" var="petsImage"/><img src="${petsImage}"/><br/> ';
  		}
   
    function initMap(){
    	var lat = document.getElementById('lat').value;
		var lng = document.getElementById('lng').value;
	
		if(lat == "" && lng ==""){
			writeErrorMap();
		}else{		
			// API token goes here
			var key = 'c79a116f8c3259';

			var Leaflet = L.noConflict();

			
			// Add layers that we need to the map
			var streets = L.tileLayer.Unwired({key: key, scheme: "streets"});

			// Initialize the map
			var map = L.map('map', {
			        center: [lat, lng], //map loads with this location as center
			        zoom: 14,
			        layers: [streets] // Show 'streets' by default
			});

			
			// Add the 'scale' control
			L.control.scale().addTo(map);
	
			// Add the 'layers' control
			L.control.layers({
			    "Streets": streets
			}).addTo(map);
			
			var marker = L.marker([lat, lng]).addTo(map);
	}
    }
    
    </script>
    
   
	<div id="map"></div>
	<br/>
	<br/>
	<br/>

	<h2>Participating Dogs</h2>


	<table class="table table-striped">
		<c:forEach var="pet" items="${tournament.pets}">
			<tr>
				<td valign="top">
					<dl class="dl-horizontal">
						<dt>Name</dt>
						<dd>
							<c:out value="${pet.name}" />
						</dd>
						<dt>Race</dt>
						<dd>
							<c:out value="${pet.type.name} " />
						</dd>
						<dt>Owner</dt>
						<dd>
							<c:out value="${pet.owner.firstName} ${pet.owner.lastName}" />
						</dd>
					</dl>
				</td>
					<td>
					
					
					
					
					<c:if test="${petHasResult[pet.id] == 0}">
					<spring:url
							value="/tournament/{tournamentType}/{tournamentId}/pet/{petId}/add_result"
							var="addUrl">
							<spring:param name="tournamentId" value="${tournament.id}" />
							<spring:param name="petId" value="${pet.id}" />
							

							<c:if
								test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Hability'}">
								<spring:param name="tournamentType" value="hability" />
								<input id="circuit" type="hidden" value="${tournament.circuit}">
							</c:if>
							<c:if
								test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Beauty'}">
								<spring:param name="tournamentType" value="beauty" />
								<input id="place" type="hidden" value="${tournament.place}">
							</c:if>
							<c:if
								test="${tournament['class']['name'] == 'org.springframework.samples.petclinic.model.Race'}">
								<spring:param name="tournamentType" value="race" />
								<input id="canodrome" type="hidden"
									value="${tournament.canodrome}">

							</c:if>
						</spring:url> <a href="${fn:escapeXml(addUrl)}" class="btn btn-default">Add Dog Result</a></td>
						</c:if>
				</tr>
		</c:forEach>
	</table>
	<c:if test="${tournament.status != 'FINISHED'}">
	<spring:url value="/pet/tournament/{tournamentId}" var="addUrl">
		<spring:param name="tournamentId" value="${tournament.id}" />
	</spring:url>

	<a href="${fn:escapeXml(addUrl)}" class="btn btn-default">Add New Dog</a>
	</c:if>
	<br />
	<br />
	<br />
	<h2>Sponsors</h2>

	<table class="table table-striped">
		<c:forEach var="sponsor" items="${tournament.sponsors}">
			<tr>
				<td valign="top">
					<dl class="dl-horizontal">
						<dt>Name</dt>
						<dd>
							<c:out value="${sponsor.name}" />
						</dd>
						<dt>Money</dt>
						<dd>
							<c:out value="${sponsor.money}" />
						</dd>
						<dt>URL</dt>
						<dd>
							<c:out value="${sponsor.url}" />
						</dd>
					</dl>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	

		<c:if test="${tournament.status != 'FINISHED'}">
	<spring:url value="{tournamentId}/sponsors/add" var="addUrl">
		<spring:param name="tournamentId" value="${tournament.id}" />
	</spring:url>
	<a href="${fn:escapeXml(addUrl)}" class="btn btn-default">Add New Sponsor</a>
	</c:if>

	<br />
	<br />
	<br />
	<h2>Judges</h2>

	<table class="table table-striped">
		<c:forEach var="judge" items="${tournament.judges}">
			<tr>
				<td valign="top">
					<dl class="dl-horizontal">
						<dt>Name</dt>
						<dd>
							<c:out value="${judge.firstName} ${judge.lastName}" />
						</dd>
						<dt>Contact</dt>
						<dd>
							<c:out value="${judge.contact} " />
						</dd>
               			<dt>City</dt>
						<dd>
							<c:out value="${judge.city} " />
						</dd>
					</dl>
				</td>
			</tr>
		</c:forEach>
	</table>
	<c:if test="${tournament.status != 'FINISHED'}">
	<spring:url value="/judge/tournament/{tournamentId}" var="addUrl">
		<spring:param name="tournamentId" value="${tournament.id}" />
	</spring:url>
	<a href="${fn:escapeXml(addUrl)}" class="btn btn-default">Add New Judge</a>
	</c:if>

</petclinic:layout>
</body>
