<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master"  AutoEventWireup="true" CodeBehind="DailyTaskAssignment.aspx.cs" Inherits="NewSecurityERP.Transaction.DailyTaskAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content overflow-hidden">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h5 class="card-title mb-0 flex-grow-1">Daily Task Assignment</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="row">

                                    <asp:HiddenField ID="HiddenFieldDailyTaskID" runat="server" Value="0" />

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Supervisor</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlSupervisor" runat="server" CssClass="selectpicker form-control" AutoPostBack="false" data-live-search="true"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlSupervisor" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select a value" InitialValue="0" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Unit</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlUnit" runat="server" CssClass="selectpicker form-control" AutoPostBack="false" data-live-search="true"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlUnit" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select a value" InitialValue="0" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Starting Date</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtStartDate" runat="server" type="date" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtStartDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter Start Date" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">End Date</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtEndDate" runat="server" type="date" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEndDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter End Date" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Starting Time</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtStartTime" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtStartTime" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter End Date" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">End Time</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtEndTime" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEndTime" Display="Dynamic" ForeColor="Red" ErrorMessage="Please Enter End Date" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                     <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Is Happy Code Required</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlIsHappyCode" runat="server" type="text" class="form-select" placeholder="Enter last name" value="">
                                                <asp:ListItem Value="0" disabled="">--Select--</asp:ListItem>
                                                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                <asp:ListItem Value="No">No</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlIsHappyCode" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" InitialValue="0" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-3">
                                        <div class="mb-3">
                                            <label class="form-label">Status</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlStatus" runat="server" type="text" class="form-select" placeholder="Enter last name" value="">
                                                <asp:ListItem Value="0" disabled="">--Select--</asp:ListItem>
                                                <asp:ListItem Value="Active">Active</asp:ListItem>
                                                <asp:ListItem Value="InActive">InActive</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlStatus" Display="Dynamic" ForeColor="Red" ErrorMessage="Select a value" InitialValue="0" SetFocusOnError="true" ValidationGroup="Group1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="hstack gap-2 justify-content-end">
                                        <asp:Button ID="ClearBtn" type="button" runat="server" OnClick="ClearBtn_Click" Text="Clear" class="btn btn-danger"></asp:Button>
                                        <asp:Button ID="SaveBtn" type="button" runat="server" OnClick="SaveBtn_Click" Text="Save" ValidationGroup="Group1" class="btn btn-success"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <asp:GridView ID="gvDailyTaskAssign" runat="server" AutoGenerateColumns="False" CssClass="DailyTask table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvDailyTaskAssign_RowCommand" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="EditDailyTask" CommandArgument='<%# Eval("ID")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Empname" HeaderText="Supervisor Name " SortExpression="" />
                                        <asp:BoundField DataField="Unitname" HeaderText="Unit Name" SortExpression="" />
                                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="" DataFormatString="{0:d}"/>
                                        <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="" DataFormatString="{0:d}"/>
                                        <asp:BoundField DataField="StartTimeFormatted" HeaderText="Start Time" SortExpression="" />
                                        <asp:BoundField DataField="EndTimeFormatted" HeaderText="End Time" SortExpression="" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div align="center">No data available in table</div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderJavaScript" runat="server">

       <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        // ===== DataTable =====
        $(".DailyTask").prepend($("<thead></thead>").append($(".DailyTask").find("tr:first"))).DataTable({
            dom: 'Bfrtip',
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
        });

        // ===== Timepicker =====
        $('#<%= txtEndTime.ClientID %>').timepicker({
            timeFormat: 'h:mm p'
        });

        $('#<%= txtStartTime.ClientID %>').timepicker({
            timeFormat: 'h:mm p'
        });

        // ===== Today Date =====
        var today = new Date().toISOString().split('T')[0];

        $('#<%= txtStartDate.ClientID %>').attr('min', today);
        $('#<%= txtEndDate.ClientID %>').attr('min', today);

        // ===== Date Validation =====
        $('#<%= txtStartDate.ClientID %>').on('change', function () {
            var selectedDate = $(this).val();

            if (selectedDate < today) {
                alert("Past date not allowed!");
                $(this).val('');
            }
        });

        $('#<%= txtEndDate.ClientID %>').on('change', function () {
            var selectedDate = $(this).val();

            if (selectedDate < today) {
                alert("Past date not allowed!");
                $(this).val('');
            }
        });

        // ===== FUNCTION: Convert time to minutes =====
        function getMinutes(timeStr) {
            var parts = timeStr.match(/(\d+):(\d+)\s*(am|pm)/i);
            if (!parts) return 0;

            var h = parseInt(parts[1]);
            var m = parseInt(parts[2]);
            var ap = parts[3].toLowerCase();

            if (ap === 'pm' && h !== 12) h += 12;
            if (ap === 'am' && h === 12) h = 0;

            return h * 60 + m;
        }

        // ===== Start Time Validation =====
        $('#<%= txtStartTime.ClientID %>').on('change', function () {

            var selectedDate = $('#<%= txtStartDate.ClientID %>').val();
            var selectedTime = $(this).val();

            if (!selectedDate || !selectedTime) return;

            var now = new Date();
            var today = now.toISOString().split('T')[0];

            // Only check time if date is today
            if (selectedDate === today) {

                var currentMinutes = now.getHours() * 60 + now.getMinutes();
                var selectedMinutes = getMinutes(selectedTime);

                if (selectedMinutes < currentMinutes) {
                    alert("Past time not allowed!");
                    $(this).val('');
                }
            }
        });

    });
</script>
   
</asp:Content>
