<%@ page contentType="text/html; charset=utf-8"%>

<%
		request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<style type="text/css">
		html {width:100%; height:100%;}
		body {width:100%; height:100%; margin:0px;}
		a {font:sans-serif; font-size:20px; text-decoration:none; padding:20px; top:10px;}
		
		#root {width:100%; height:100%;}
		#navbar {width:100%; height:5%; border-bottom:1px solid grey;}
		
		#navbar nav:first-child {float:left;}
		#navbar nav:first-child div {float:left;}
		#navbar nav:last-child {float:right;}
		#navbar nav:last-child div {float:right;}
		
		#topbar {width:100%; height:5%; border-bottom:1px solid grey; display:flex;}
			.search {width:30%; height:100%; border-right:1px solid grey;}
			.filter {width:70%; height:100%;}
		
		#contents {width:100%; height:90%; display:flex;}
			.items {width:30%; height:100%;}
				#map {width: 70%; height:100%;}
			
		ul {
				display: flex;
   				flex-wrap: wrap;
    			padding: 20px 30px 85px;
    			margin-left: -16px;
    			margin-top: -30px;
    			border-bottom: 1px solid rgb(221, 221, 221);
    			padding-inline-start: 12px;}
		li {
				flex: 0 0 auto;
    			margin-top: 30px;
    			margin-left: 32px;
    			list-style:none;
    			overflow:hidden;}
    			
    	.roomImg {
    		display: flex;
    		width: 180px;
    		height: 140px;
    		border-radius: 3px;}
			
		span {overflow:hidden; display:flex; width:180px; height:20px;}
		
 		@media only screen and (max-width: 768px) and (min-width: 300px) {
  			#navbar { display: none; }
  			#map {display:none;}
  			.items {width:100%;}
		}
	</style>
</head>
<body>
	<div id="root">
		<nav id="navbar">
			<nav>
				<div><a href="#">로고</a></div>
				<div><a href="#">중개사 페이지</a></div>
			</nav>
			<nav>
				<div><a href="#">관심물건</a></div>
				<div><a href="#">로그인</a></div>
				<div><a href="#">회원가입</a></div>
			</nav>
		</nav>
		<div id="topbar">
			<div class="search">검색</div>
			<div class="filter">필터</div>
		</div>
		<div id="contents">
			<div class="items">
				<ul>
					<li>
						<a href="#" class="listA">
							<img src="https://t1.daumcdn.net/cfile/tistory/99E7313B5C15D7C003" class="roomImg"></img>
							<span class="span1">확인매물 20.12.03</span>
							<span class="span2">원룸</span>
							<span class="span3">전세 5000</span>
							<span class="span4">뒷부분 ...으로 잘리는 메모aaaaaaaaaaaaaaaaa</span>
						</a></li>
					<li>
						<a href="#" class="listA">
							<img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxISEBUSERIVFRUQFRUVEBUVEBAVFxUWFRUXFhUVFhUYHSggGBolHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OFw8PFysfHR0rKy0rLS0tLSsrLS0tLS0rLS0rLS0tKy0tKy0tLSstLS0tLS04Ky0tLS0rLS0tLSstLf/AABEIAMIBAwMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAADAAECBAUGB//EAEMQAAIBAgMEBwUGBAQFBQAAAAECAAMRBBIhBTFBURMiMnGBkbEGYXKhwSNCUrLR8BQzgpIkU2LhFVSDosIXQ3Oz8f/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME/8QAIREBAQEBAAICAwADAAAAAAAAAAERAhIhMWEDQVETIoH/2gAMAwEAAhEDEQA/AJXj3lUVJNas87qsCPaDV4QGRTgSVohJAQI2j2krRWkEbR7SVorQI2j2krRWgRtHtJARWkDWitJWj2gRtHtJWitAjFaStHgRtHtHtHtAjaK0naPaBC0VpO0VoELRWk7RWgDIkSIUiMRACRBldZYIgwNYEwIpK0U2MZQDoDryNwfI6xzThDS4ESIpEbmI928eRvbwtCIaiFpVgeMYZuKg/Ccp/tOnzj4WhcMbffbfv4RgtIYUCVQhEItYjeJFWMsfLGp1QYUQB5YssNaLLIA2itDZY2WAPLFlhcsVpAO0QEJaK0CGWPlkrR7QIWj5ZPLHtChgR7SeWPlkELRZZMLHtKIZYssJaPaAPLFlhcsWWAHLGyw2WMVgV2WQVdZYZZBFiIa0aTIim0UMkXRw5WLLIoGSaOycNekT/rf1lTLN/wBn6N6H9b/mMsSqT4L3StUwM6NqEE1CXE1zD4MwRVhOnbDQL4McpMXXKU9sC9muLG3umjRxituImXidnHMdOJ3d8pHCEG4uO7SMHUqQZLLOapYyom/WaGH2uPvad8yrWyxZZCjiVbcZYFjAFliyw2WLLIA5YssNlj5IAbR8sLlklpk7hfuhQcsWWW1wjHh52EKuBb3QiiFj5ZorgOZ+UIuDXl84wZeWSWmeAmsuHHIeUJ0UYayBh25RPRI3zX6GDr4a6nzjDWSVjFJb6OI0oFB0gwsvvTleoukQVSIpIiKbQHfI2gwJK5kVK06X2bX/AA/9dT8xnMAmdT7Mn/Dj46n5jLEq+yQbJLBkCJplWNOMacsERisow6vs5UDZkdWBN8rhl362uI9XB0gLVsHVS296NXph3kPqPCdRTOkKAJcia4Rti0Kn8nE0yfwVQ1Fu4B9CfGUcd7NVqerUmt+IC6/3C4+c9DxGBp1O2it3qD85SXYaprQqVKPwVGy+KnQyeK680OCZdVuO6Ho4yqm/rfIzrvaVmoUGq4haVdFKBiaZo1TmcKPtKZHEic/g9oYKsbK1aibE2dRXpiwJ7S2fhxBmbys6Ph9rKe1p3/rNOhUVtxEqDZWf+UaVb/4qq57czTfK3gLwH/DsjWzGmx+66uh/tYC8njV1uphr8YdMIOV/GZFBq6cAw9xsfL/aamD2st7OLH3i3+0YLtLDL+EeUsdBLeGek43jx0hXwRG6XxTWctLSETDE7oZV0FxwEkF5RhpLs08SBJps4cye5YaniCN4vCHF+4nxt6Tecs+wl2ev4T4m3yhf4NPwyJxR/CPG5kDWb3DuAjeT2DiMNbdK/Ryy3vkCw5iYvtWZUw9iZE0ZfZlJsDrEacy1rJq0ZRxS2m7VpTI2ivWMQZpijkRpRUAkwsQEmBAGjKSQGBK9oBgSt91xwm/sDpBR6pQjO9lIYHtHe4J/LORwSn+IIyNkXpchKuFBdwz2zUhcE69sjkCLW7HYB+x/rf8ANLiVd6apxpA/BVDH/vVI38T+KnUX+kP8qRaGzRXlZAONpje2X4w1P84ELSqBtUYMOakH0kg0FVw6P20VviRW9RGi6jwytKqQgmtFoGSErCSDGXUZHt1Tz4Gop4tS/wDtWchsrZQyMANSjgeKGd1tvGvSoM62JGXQi41YA3HcZyTe16oftMLTN9LoChN9DqLyWrHLY7Z9VDob68bGbWysVjFRr1WZFRz0bZXU5UJAy1LgagTSpbQweJIBo1qZ5q6MBx1zay1hq+DsVXEgZlIs6EbwRqRccZFYeE9okJs+HyndeizUrf0HNT8lE11x1BjY1bGw6tZGQ6qGHXTMu4jeFjYLYFyWR6NQEm2Sqp+RtrrB7S9nHNcuaTWITXISNEUbx3Rg0KeH0zUybc6ZWoviaZYD+q0vYHHV1tYh1uBcbvHh6Tl9obH+1p5bi1MbiRrnflNrYmxlSor3OYMPvNz75nFdRh8VdQHXgNR3Q3QKdVP77pJKQIGn3R7uA5RLQAAtyE3jKmqVcxHV0hxhX4sPKQw9GqxJNW1iRYU18NTDthG41X8qY/8AGSQ1D+Bbi58BF/ADi7eYip4EHe9Q/wDUI9LQn/Dk45j31an6y+P0aH/AU+N/7jGejRG/L4mTfZtL8APfc+sVDAUwP5af2LGGqFStQBFnQHh1lvrpaR/jaZ3MD3XM16mHUDRVHcomOMKAAAOEz1MWVGli0aoqC9yeR4An6TI2oOue+bOGw4FVTyv+UzI2oOuZlYymikmEUKqgSYjLJiBl4IA4hiVYMA4N1rsLZ9LVHTIL6HKjDfqDl06rYjfZH439ZyuAoEVycjAXrWutst6gNy3RAsH1YXc79LjVem2Q3UPxv6zSNXNFmgQ0kGhBLx7wd44aBZQwqmcTWFUM5FesNWIArPYe4C+6CTE4j/maviyn1WTyXHfAyQM4WjjsV/zTf2Ufqkz/AGh9qMbhxTyVg2fPfNRons5bdlRzMvkmO+2woNBgd3V/MJwe0sIl/GZH/qDtC3apD39CL/M2+UkPb/HfeFBu+h+jRsV0+yMMJh0sCOkMHT9v8SN9DCn/AKLD0aRHtub3OBw1/wDTnT9Y2Da2jhbJSANtW3G3BZbwtOpTpEpUdSbWIdhpcTEo+2yVTlfAJ1dQVxVYb9+gHuE6PZu0lr02y0Oiy5denL3BO6xUW3DjAtuxJpmoxZujFyxuT13nYYVMqKOQF+/jOD2gX6akA7BejF1V2AJ6Spe9jytOoobWZmtlXUgaX4m3OWVmt1Jm4msysALWsLgjjfmDLoqTOxrXYHmB6yfkuT0vM9tDDrv74UiCoONbkb+YhTUXmPMTrGEaa75O0HTqLrqN/OT6QcxATiRpDSO1Qc5GnUFt8CVQaGZbCadSoLHu5GZt7iZ6WI0h1h4+hnPbU7RnRJ2vP0nPbT7RnOtxlkRSRikFUSQkRJiFYuysOgxNRwiXZqozKEDCzDMHC01C3NjfMxa4zcAOm2Ueq3xt6zNoVWL2LCwLAjQHQm2hAO4jUXHV43l/Zp6rfG0tRohpINAgyQaAbNHDQOaUKuLYV0UHqm+YWGvLWAKtT7X9X1lSlhyWC89T6zUqDRu4yngXAcE7tR8z+okUWphBkzKLEd/znM+2tO4o9z/+E7XFMFQ+/cPdpf0+c5H2pH8v3F/RIo5QUJNcPLgWTAkVUGGjnDS6LRmIkAdm4X7Q9w+s67DUPsHHMp6mc9skg1CPcPUzqy4p0GZlYi6WAYJrc8Srek1EopKr0V2UWp7i6g/zKm5b3M1sK3XHxr6zm8UQ9Si1iPshYFs1vtavGw9Jt4FuuPjX80qOvNYipltqR+/SUcYdR3L6wzk9OLDhz9zStjTqvcvrM/lv+pz8r9CtUuwRQdbm5tv/APyG6Wv/AJa/3D9ZXwtRlZiELA6ae6Wf40/5beR/SdZftk2Dd2UkBdSSb33w46Tknm36SrgKwVLNcG5+636Sz/Fp+L5Gal9fKUmNS25PNv0lPD4t8oC0yQugN14ac5bbFpbtjzlPAYtVWzXvc8Dzkt9/IlXxlQKb0iBuJ6vHTnKybh3CWsbi0amQDqbcDzEpruHdM1qJJv8AP0nP7T7Rm8m/z9Jg7S7RmasZpiiMUKqLJAyAkhMqrYYnpDu1Jv1XJ3v95iR90aCw36aaaOzjo3xt9JRS2cAMmhJyjtbm36nix5cZawB0b42+k0jQBj5oENJBpDBbzLrH/E0/H0M0bzKrH/E0/H6wLxBs1+Ga3vH79JRVLiwNuWsy8R7W0ldlsSVZgczAbjYwmB9pHqdnC1yOdNcw8yAPnLgtJRxGbcCOFlIHmYLaWxsTWy2CC2a+ZgN+XlflN3BuWF2Sonuc07+SMYWoluIXmTb6zOxcc3Q9iqx7damvwq7+uWaND2Jp/fru3wqieuaXjiEH/uMT/pzeo0hkx9ioyvZmVSWcC1yNbaxLP4lgNL2Swi9pXf4qrj8loWngMMpsMImm4tTzfNgZbbatP7oZ+Vl0Pcx0ipY521FML8TXPkuh85rYnsB6NA26pSxv1FRYfEYOg1Al2ZaYILMWQWsbDUi28yjjNsCmSK1cKR90ZRcW/Dq3lMPHua63Qkq69Qktc2Jsddd44zPXeLOW7tDZbFaRwYWqBoz56LELctoTYb2PnD4TAVw65qbAZ14X3MOU8xpVtGtocpueO5ZfwRZqgAaxJHWJPUvbrX4W3zj/AJvpvwd5ifaHH0qrg4e4DOARRrEFQeqQymxG7WZuP9rao1aiq2A3ioNwvxM19t7aekEbD1+kzkhg4pHS2/RRbx5xtn+0VZ6VR2yXpg6WNuzcG/HW4t85LZbZ5pP7jq9h1i9EOy5S9mK8iVBtNGZmx8WDTBdlDMFJ1A3qD6kzRVwdxB7iJ7ub6jjfkLDfe+Mw8r4U9r42+ksSz4RF9x7oHCoDTW4HZHAcoZ9x7oPB/wAtPhHpH7DVqK5T1RuP3RymOp0HdNuv2W7j6TBB0HdOf5Gomh63n6TD2h2jNmm3WHj6GY2P7RmGozjGjmKVVPLHyxwY4MyqqjnpNWOtxlKgWClrEG2o13f6t5tLOAOjfG30lWgD0hI7LFgbgX3tuI4dU+YlnBff+NvpLUXAZIGCvJZpNUS8rHDXqK9+zwhg0kGjRWw1AISadFFJN2YJTQknebgXNzzlmqamVjmGisRoSbgE8ZINGrHqN8DflMyC9DzZj42+QlHa9EFQqixN9QBcWy85oXlHatQhQRvsbd5sBLBTfaJBKJTZyvaCC+XkCdBf3Q9GsHyPdjdxodLWOoI3XnJ1do08rK2rkgUVKk3J3MBuBNwSTrrbcBNrZFclVzG5upY66lWZb3O/QLrxOs6XnJrM62qu0faxjfoqSrfixLHyFgPnOcr7axFQkPWe3JTkHdZbX8YLE1NPCZtOtrMSNNXDpO22aR0SAcAR/wBzTiMBUuZ1mAqhaYv7/UzNVm7V2ZVWvUZaZZH6wyDNa9r3A1GobhbWWPZvEBWJ6MsSVBW2ttCRlI1vqPCbWz8UWZ+kXKvVCcSe1e/mOEIds0cOKjvuVsw7N7BV3Emw1HEicfH36a30vYjZlJqbVFoPQ7GgqWvd1U2p6hRYnlwlilgkpjEoFuEW63u1mNC5IJuRqzd15ytbb20ay2QYMI1iQ5rB+q1wFKllJNhqbDXxmxs7alZ8NWq1EQ1Klw4pMQqjoQVYdIQezlJG/U75vxn0y7TZlMGktwD1V4e4SycIn4RKuyH+zXuX0EvBp05kxihLhl1sWGvBjJdC3Cq/mD6x6Z398neagHar/m+aCNSesqgAoQAAL33Q15BDoO6X/qIVcZVsQUU3BGjGYrYhx9w+Ym2eMo2nL8l6/rXOKOExV6igqRfNv3dkynj95mwFAYH97pj47eZeLc9rWeYojFNikDJXlYX4m0mqj3mcvJcENXxjYFtG+NvpHCe60jhBbP8AG30lltKtAyUgDFeVBBJAwYkhAIDGrnqN8DflMQMjXPUb4G/KZFWLzP2yLqB3y7eUNqns/wBX0molczbDUxmqOC6WCKLFySbEKu85ha3I77azX2dTKqoIsSwuOR1JHmT5QIRc+fo6Yf8AzMi591u1z7pYpv1kH+oTfXWs8844LoHcC/LcP1lnC+z5bh+++dZg9k2A08/0mjTwwE8/nXXHN4P2fy8T+++ago9GATrlHDU7ydPOahpyJw15PIxy+JxuICFhUVRyGFa/EDfUPpMjD08YFALqwPaVrF7bv5jA3NuZ8Z22L2MlRcjAkNoQGYfMG48JYw+wVAF9ANw19Zqd/SYwNkUDUFXpFZMjBRfIpIIF8wTTxBPfNbZ7onSYRC91yuGYMwKtT6OwZr3IyjfzG+xtqUcAiX362Fi7EAAk6AnTUmXKdAEk2tw+Uzep+li37NrUWkKbuXKjVmtc3JIvbkLDwm2hMoYGnYXEtmoZvn49ud+RaNUm/fDK8p4Nt498t55vn4SpmpBpUFhHvpKlIXF78YtpFzPpKIaTqaDulZWmOq1IKW1mPjd5miXmbjN5l4KomKIxToM9QJIvytAgyYE4NJZr8T6SGD+98bfSFQSGG+/8Z+kvJVgCPI3ivNoJePeDAkwYRMRq3Yb4G/KYGpiVHG/dKlTGM2ij3ED6mRWnVrqu8/rMGrtTpnZVUjojlGty1wCTYbvnLtPAlu2fAE+u/wBJcwuFSmOqoHhJ5YYo4bZrNqxyjlx/2mnQwyJuHid8leTEzerVwK0WWPGvMNFlEkFvuk0pcTCGERVQIRXkckhAMdTCqLDxgabWkjUgaeHq6QprTPoVNP35Q6mdJWcXqJtf375POJQpvCGpNazi276QCGw0gTV0jJU0ktXB3JsZUFS0P0ukzqjb/GZ6WLgIIlDFb5YpNp4SpiDNcFVTGjmKdEZyoY9wPfA5iZNV5zk0L0p7oLCHtfG30kgwEHhW7Xxt9JYlWo95AR7yiccGMF5wgIEnkKCYEkkueJ0Gg/3l6lTAGgsBHk1W8xutJLJlDJCwg6tU8IREtJAyuWlilRJ1Og+Z/SRUFBbcIZVC98m9YLoJXuW/fpGAmckw6rpBItoi8qGepwkabC9pFyP36RUqet5lpbGH4yLJbTzhmew98EDeXETofISxnvK4MOBaaiVIPHzyuxkQ8aLLvpGV4EvxjI/79YFovKDtDl5Szfv990z0sXKdTTwgKpjK2n75yBO/vm+L7ShGKIxTqyyxGiinOqSxYT73xn6Roo5KOYWnuiiiiR3xxGimGhRwh4oohQmOvnB1IopA2EHX7gbfKXKm7wiimp8JflU/fyMsrujRSRaVWRO4xRRSAtw8ZfpRRSQqVffI0Y0Uv7QRN/iYU7o0UsSoSJ+kUUinP78zIDd5+kUUBuErnh++caKZrUFTd++ciOMUU3x8s0OKKKdmX//Z" class="roomImg"></img>
							<span class="span1">1</span>
							<span class="span2">2</span>
							<span class="span3">3</span>
							<span class="span4">4</span>
						</a></li>
				</ul>
			</div>
			<div id="map">m,ap</div>
		</div>		
	</div>
</body>

</html>