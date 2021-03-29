<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body class="bg-light">

	<div class="container mt-4">
		<%@include file="components/header.jsp"%>
	</div>
	
	<div class="container">
		<%@include file="components/messageFail.jsp"%>
	</div>
	
	<div class="container mt-4">

		<div class="row bg-white border border-4 rounded mb-5">

			<div class="col-8 mt-4 mb-3">

				<form class="form-inline" style="width: 450px" action="getStock">
					<div class="form-group mx-sm-3 mb-2">

						<input type="text" class="form-control" name="stockName"
							id="symbol" placeholder="Enter ticker symbol" required />
					</div>
					<button type="submit" class="btn btn-primary mb-2">Search</button>
				</form>


			</div>
			<div class="col-4 mt-4 mb-3">


				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal1">Advanced Search</button>

			</div>

		</div>

		<div class="row bg-white border border-4 rounded mb-5">

			<div class="mt-3 container ">
				<h2>Stock details:</h2>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th>Price</th>
							<th>Change</th>
							<th>Currency</th>
							<th>Bid</th>
							<th>Price Hint</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${stockList}" var="item">
							<tr>

								<td>${item.name}</td>
								<td>${item.price}</td>
								<td>${item.change}</td>
								<td>${item.currency}</td>
								<td>${item.bid}</td>
								<td>${item.priceHint}</td>
								<td><a href="getStockHistory" type="button"
									class="btn btn-success">Quick History</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>


			<div class="container mt-3">
				<h2>${msg}</h2>
				<div style="overflow-y: auto; height: 450px;">
					<table class="table">
						<thead style="position: sticky; top: 0;"
							class="sticky-top thead-dark">

							<tr>
								<th>Symbol</th>
								<th>Date</th>
								<th>High(price)</th>
								<th>Low(price)</th>
								<th>Closed(price)</th>

							</tr>


						</thead>
						<tbody>
							<c:forEach items="${histories}" var="history">
								<tr>
									<td>${history.symbol}</td>
									<td>${history.date}</td>
									<td>${history.high}</td>
									<td>${history.low}</td>
									<td>${history.close}</td>

								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>




		</div>


	</div>








	<!-- The Modal -->
	<div class="modal fade" id="myModal1">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Export Stock History</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form class="form-inline" action="exportStockHistory">

						<div class="form-group">
							<table>
								<tr>
									<td>Search Type :</td>
									<td><select name="field" class="form-control"
										style="width: 205px;" required="required">
											<option value="Other">Select</option>
											<option value="DAILY">Daily</option>
											<option value="WEEKLY">Weekly</option>
											<option value="MONTHLY">Monthly</option>
									</select></td>
								</tr>
								<tr>
									<td>Stock Name :</td>
									<td><input type="text" class="form-control"
										placeholder="Enter Stock Name" name="stockName"
										required="required" /></td>
								</tr>
								
								<tr>

									<td></td>
								</tr>

								<tr>
									<td></td>
									<td align="center">
										<button type="submit" class="btn btn-info">Search</button>
									</td>
								</tr>
							</table>

						</div>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>





</body>
</html>