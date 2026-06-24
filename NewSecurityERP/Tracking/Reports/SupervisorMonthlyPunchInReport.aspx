<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SupervisorMonthlyPunchInReport.aspx.cs" Inherits="NewSecurityERP.Tracking.Reports.SupervisorMonthlyPunchInReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .modern-modal {
    border-radius: 16px;
    background: #f8fafc;
    height: 90vh;
    display: flex;
    flex-direction: column;
}

.modal-body {
    overflow: hidden;
        margin-top: -38px;
}

.timeline-container {
    height: 65vh;
    overflow-y: auto;
    padding-right: 10px;
}

/* Scrollbar */
.timeline-container::-webkit-scrollbar {
    width: 6px;
}
.timeline-container::-webkit-scrollbar-thumb {
    background: #cbd5f5;
    border-radius: 10px;
}

/* Summary Cards */
.summary-card {
    padding: 9px;
    border-radius: 12px;
    background: #fff;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    text-align: center;
    font-weight: 350;
}

.summary-card h4 {
    margin: 5px 0 0;
    font-weight: bold;
}

/* Borders */
.total { border-left: 5px solid #6366f1; }
.planned { border-left: 5px solid #22c55e; }
.unplanned { border-left: 5px solid #f59e0b; }

/* Timeline */
.timeline {
    position: relative;
    padding-left: 40px;
    margin: 22px auto;
}

.timeline::before {
    content: '';
    position: absolute;
    left: 15px;
    top: 0;
    bottom: 0;
    width: 2px;
    background: #d1d5db;
}

.timeline-item {
    position: relative;
    margin-bottom: -53px;
    padding: 30px 12px;
    width:100% !important;
    margin-top: -51px
}

.timeline-dot {
    position: absolute;
    left: -31px;
    top: 85px;
    width: 14px;
    height: 14px;
    border-radius: 50%;
    background: #6366f1;
}

/* Task Card */
.task-card {
    background: #fff;
    padding: 12px;
    border-radius: 12px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.08);
    
}

        .VisitKm {
            text-align: right;
        }
/* Status Badges */
.badge-status {
    float: right;
    font-size: 12px;
    padding: 4px 10px;
    border-radius: 20px;
}

.visited { background: #22c55e; color: #fff; }
.notvisited { background: #3b82f6; color: #fff; }
.newsite { background: #8b5cf6; color: #fff; }
.oldsite { background: #22c55e; color: #fff; }
.marketingsite { background: #f59e0b; color: #fff; }
.oth { background: #3b82f6; color: #fff; }

.custom-modal-width {
    max-width: 950px;   /* 🔥 increase as needed */
    width: 95%;          /* responsive */
}
.modern-modal {
    height: 90vh;
    display: flex;
    flex-direction: column;
}

.modal-body {
    overflow: hidden;
}

.timeline-container {
    max-height: 55vh;
    overflow-y: auto;
    padding-right: 10px;
}

/* Punch card */
.card {
    border-radius: 12px;
}

/* Timeline */
.timeline {
    position: relative;
    padding-left: 40px;
}

.timeline::before {
    content: '';
    position: absolute;
    left: 15px;
    top: 0;
    bottom: 0;
    width: 2px;
    background: #d1d5db;
}

 .card-visited {
     border-left: 5px solid #22c55e;
 background: linear-gradient(135deg, #f0fdf4, #dcfce7);
}

/* NOT VISITED = BLUE */
.card-notvisited {
    border-left: 5px solid #ec3b3b;
    background: #f9f4f4;
}
    </style>
    <div class="main-content overflow-hidden" style="min-height: 600px">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h5 class="card-title mb-0 flex-grow-1">Supervisor Monthly PunchIn Reports</h5>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">Month</label><span class="text-danger">*</span>
                                        <asp:DropDownList ID="ddlMonth" CssClass="form-select" runat="server">
                                            <asp:ListItem Value="0" Text="-- SELECT --" Selected="True" disabled=""></asp:ListItem>
                                            <asp:ListItem Value="1" Text="January"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="February"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="March"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="April"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="May"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="June"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="July"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="August"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="September"></asp:ListItem>
                                            <asp:ListItem Value="10" Text="October"></asp:ListItem>
                                            <asp:ListItem Value="11" Text="November"></asp:ListItem>
                                            <asp:ListItem Value="12" Text="December"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">Year</label><span class="text-danger">*</span>
                                        <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-select"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-3 mt-4 mb-3">
                                        <button id="btnShowReport" type="button" class="btn btn-success">Show Report</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">

                                <table id="gvSupMonthlyPunchReport" class="table nowrap align-middle" style="width: 100%">
                                    <!-- Table will be populated dynamically -->
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="attendance_info" tabindex="-1">
   <div class="modal-dialog modal-dialog-centered custom-modal-width">
        <div class="modal-content modern-modal">

            <!-- HEADER -->
            <div class="modal-header border-0">
                <h5 class="modal-title" id="attDate">Attendance</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- SUMMARY -->
            <div class="summary-section px-4 pb-2">
                <div class="row g-3" style="padding-top: 12px;">
                    <div class="col-md-12">
                        <div class="summary-card total">
                            🚗 Total KM
                            <h4 id="totalKM">0</h4>
                        </div>
                    </div>
                    <div class="col-md-4" style="display:none">
                        <div class="summary-card planned">
                            📍 Planned KM
                            <h4 id="plannedKM">0</h4>
                        </div>
                    </div>
                    <div class="col-md-4" style="display:none">
                        <div class="summary-card unplanned">
                            ⚠️ Unplanned KM
                            <h4 id="unplannedKM">0</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="px-2 pb-1">
                <div class="card shadow-sm p-2">
                    <div class="row text-center">

                        <!-- Punch In -->
                        <div class="col-md-6 border-end">
                            <h6 class="text-muted">Punch In</h6>
                            <div class="fw-bold" id="punchInTime">-</div>
                            <div class="small text-muted" id="punchInAddress"></div>
                        </div>

                        <!-- Punch Out -->
                        <div class="col-md-6">
                            <h6 class="text-muted">Punch Out</h6>
                            <div class="fw-bold" id="punchOutTime">-</div>
                            <div class="small text-muted" id="punchOutAddress"></div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- SCROLLABLE BODY -->
            <div class="modal-body">
                <div class="timeline-container" id="timelineContainer">
                    <!-- Dynamic timeline -->
                </div>
            </div>

        </div>
    </div>
</div>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavaScript" runat="server">
    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcaA6jqyrN0CnjsZPZ055-Lc0pwHLBln0&loading=async&libraries=maps,geometry&v=weekly" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnShowReport").click(function (event) {

                event.preventDefault();

                var selectedMonth = parseInt($('#<%= ddlMonth.ClientID %>').val(), 10);
                var selectedYear = parseInt($('#<%= ddlYear.ClientID %>').val(), 10);

                if (!selectedMonth || !selectedYear) {
                    // Show error message
                    warning("Please select year and month first");
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: "Tracking/Reports/SupervisorMonthlyPunchInReport.aspx/GetDataForDataTable",
                    data: JSON.stringify({ month: selectedMonth, year: selectedYear }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (response) {

                        // Process the response
                        var data = JSON.parse(response.d);
                        if (data.success === false) {
                            error(data.message);
                        } else {
                            // console.log(result);                            

                            if (data.length === 0) {
                                info("No data available");
                                return;
                            }

                            var $table = $("#gvSupMonthlyPunchReport");

                            // Generate table headers
                            var headers = Object.keys(data[0]).filter(function (key) {
                                return key !== "EmpCode" && key !== "EmpName";
                            });

                            var theadHtml = "<thead><tr><th>EmpCode</th><th>EmpName</th>";
                            headers.forEach(function (day) {
                                theadHtml += "<th>" + day + "</th>";
                            });
                            theadHtml += "</tr></thead>";

                            // Generate table rows
                            var tbodyHtml = "<tbody>";
                            data.forEach(function (employee) {
                                tbodyHtml += "<tr>";
                                tbodyHtml += "<td>" + employee.EmpCode + "</td>";
                                tbodyHtml += "<td>" + employee.EmpName + "</td>";

                                headers.forEach(function (day) {
                                    debugger;
                                    var value = employee[day];
                                    const today = new Date();
                                    if (parseInt(day, 10) > today.getDate() && selectedMonth === today.getMonth() + 1 && selectedYear === today.getFullYear()) {
                                        tbodyHtml += '<td><i class="ri-subtract-line text-muted fs-20 fw-600 cursor-drop"></i></td>'
                                    }
                                    else {
                                        if (value == 1) {
                                            tbodyHtml += '<td><a href="javascript:void(0);" class="check-icon" data-empcode="' + employee.EmpCode + '" data-day="' + day + '"><i class="ri-check-fill text-success fs-20 fw-600 cursor-pointer"></i></a></td>';
                                        } else {
                                            tbodyHtml += '<td><i class="ri-close-fill text-danger fs-20 fw-600 cursor-drop"></i></td>';
                                        }
                                    }
                                });

                                tbodyHtml += "</tr>";
                            });
                            tbodyHtml += "</tbody>";

                            // Clear the existing DataTable if it exists
                            if ($.fn.DataTable.isDataTable('#gvSupMonthlyPunchReport')) {
                                $('#gvSupMonthlyPunchReport').DataTable().clear().destroy();
                            }

                            // Set the table HTML
                            $table.html(theadHtml + tbodyHtml);

                            // Initialize DataTable after updating the table content
                            new DataTable('#gvSupMonthlyPunchReport', {
                                dom: 'Bfrtip',
                                scrollX: true,
                                buttons: [
                                    {
                                        extend: 'excelHtml5',
                                        text: 'Export to Excel',
                                        exportOptions: {
                                            format: {
                                                body: function (data, row, column, node) {
                                                    // Replace icons with text
                                                    return data
                                                        .replace(/<a[^>]*class=['"][^'"]*check-icon[^'"]*['"][^>]*>[^<]*<i[^>]*class=['"]ri-check-fill[^>]*>.*?<\/i>[^<]*<\/a>/g, '✓')  // Check icon
                                                        .replace(/<i[^>]*class=['"]ri-close-fill[^>]*>.*?<\/i>/g, '✗') // Cross icon
                                                        .replace(/<i[^>]*class=['"]ri-subtract-line[^>]*>.*?<\/i>/g, '-') // minus icon
                                                        .replace(/<\/?[^>]+(>|$)/g, ''); // Remove any other HTML tags
                                                }
                                            }
                                        }
                                    }
                                ]
                            });


                            // Attach click event to check icons
                            //$('.check-icon').on('click', function () {
                            $table.on('click', '.check-icon', function () {
                                debugger;
                                var selectedDay = $(this).data('day');
                                var selectedEmpCode = $(this).data('empcode');

                                var fromDate = selectedYear + '-' +
                                    String(selectedMonth).padStart(2, '0') + '-' +
                                    String(selectedDay).padStart(2, '0');

                                $.ajax({
                                    type: "POST",
                                    url: "Tracking/Reports/SupervisorMonthlyPunchInReport.aspx/HandleDayClick",
                                    data: JSON.stringify({ empcode: selectedEmpCode, fromDate: fromDate, todate: fromDate }),
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {

                                        var result = JSON.parse(response.d);

                                        if (result.success) {

                                            var table1Data = JSON.parse(result.Table1); // TASK
                                            var table2Data = JSON.parse(result.Table2); // KM
                                            var table3Data = JSON.parse(result.Table3); // PUNCH
											 $('#attDate').text('Attendance - - | Employee - (-)');

												$('#totalKM').text('0');
												$('#plannedKM').text('0');
												$('#unplannedKM').text('0');

												$('#punchInTime').text('-');
												$('#punchInAddress').text('');

												$('#punchOutTime').text('-');
												$('#punchOutAddress').text('');

												$('#timelineContainer').html('<div class="text-center text-muted py-3">No data found</div>');


                                            if (table1Data.length > 0) {
                                                var data = table1Data[0];
                                                var date = data.StartDate || '-';
                                                var emp = data.EmpName || '-';

                                                $('#attDate').text(`Attendance - ${date} | Employee - (${emp})`);
                                            }else{}

                                            if (table2Data.length > 0) {
                                                $('#totalKM').text(table2Data[0].TotalKM);
                                                $('#plannedKM').text(table2Data[0].PlannedKM);
                                                $('#unplannedKM').text(table2Data[0].UnplannedKM);
                                            }

                                            if (table3Data.length > 0) {
                                                var punch = table3Data[0];

                                                $('#punchInTime').text(punch.PunchInTime || '-');
                                                $('#punchInAddress').text(punch.InAddress || '');

                                                $('#punchOutTime').text(punch.PunchOutTime || '-');
                                                $('#punchOutAddress').text(punch.OutAddress || '');
                                            }

                                            var html = '<div class="timeline">';

                                            table1Data.forEach(function (item) {

                                                var statusClass = item.IsVisited === 'Visited' ? 'visited' : 'notvisited';
                                                var cardClass = item.IsVisited === 'Visited' ? 'card-visited' : 'card-notvisited';


                                                const visitCategoryMap = {
                                                    'newsite': { class: 'newsite', text: 'New Site' },
                                                    'oldsite': { class: 'oldsite', text: 'Old Site' },
                                                    'marketingsite': { class: 'marketingsite', text: 'Marketing Site' },
                                                    'oth': { class: 'oth', text: 'Other' }
                                                };

                                                var visitCat = '';

                                                if (item.VisitCat) {

                                                    var key = item.VisitCat.toLowerCase().trim(); 

                                                    var category = visitCategoryMap[key] || {
                                                        class: 'defaultBadge',
                                                        text: item.VisitCat
                                                    };

                                                    visitCat = `
                                                    <span class="badge-status ${category.class}">
                                                        ${category.text}
                                                    </span>`;
                                                }

                                                html += `
                                                    <div class="timeline-item">
                                                        <div class="timeline-dot ${cardClass}"></div>

                                                        <div class="task-card ${cardClass}">
                                                            <div>
                                                                <strong style="display:none">${item.TaskName || '-'}</strong>

                                                               <span class="badge-status ${statusClass}">
                                                                    ${item.VisitType === "Planned" ? "Scheduled" : item.VisitType === "UnPlanned" ? "Patrolling" : (item.VisitType || "-")}
                                                                </span>

                                                                ${visitCat}  
                                                            </div>

                                                            <div class="text-muted small">
                                                                ⏱ Site Visit : ${item.SiteVisitDateTime || '-'} → ${item.SiteVisitAddress || '-'}
                                                            </div>

                                                            <div class="text-muted small">
                                                                📍 UnitName : ${item.UnitName || '-'}
                                                            </div>

                                                            <div class="text-muted small">
                                                                ⏱ Task : ${item.StartVisitTime || '-'} → ${item.EndVisitTime || '-'}
                                                            </div>

                                                            <div class="text-muted small">
                                                                🚪 Site Leave : ${item.SiteLeaveDateTime || '-'} → ${item.SiteLeaveAddress || '-'}
                                                            </div>

                                                            <div class="text-muted small VisitKm">
                                                                🚗 ${item.TaskVisitKM || 0} KM
                                                            </div>

                                                            <div class="text-muted small">
                                                                🕒 ${item.TotalVisitDuration || 0} 
                                                            </div>
                                                        </div>
                                                    </div>`;
                                            });

                                            html += '</div>';

                                            $('#timelineContainer').html(html);

                                            //  SHOW MODAL
                                            $('#attendance_info').modal('show');
                                        }
                                    },
                                    error: function (xhr, status, error) {
                                        error("An error occurred: " + error);
                                    }
                                });
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        error("An error occurred: " + error);
                    }
                });
            });
        });

    </script>


</asp:Content>
