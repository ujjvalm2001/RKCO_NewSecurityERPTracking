<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UnitWiseReport.aspx.cs" Inherits="NewSecurityERP.Tracking.Reports.UnitWiseReport" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content overflow-hidden" style="min-height: 600px">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h5 class="card-title mb-0 flex-grow-1">Unit Wise Reports</h5>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label class="form-label">Unit Code</label><span class="text-danger">*</span>
                                            <asp:ListBox  runat="server" ID="lstUnitCode" SelectionMode="Multiple" class="selectpicker form-control" multiple="multiple" data-selected-text-format="count" data-live-search="true" data-actions-box="true" AutoPostBack="false">
                                            </asp:ListBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label">Start Date</label><span class="text-danger">*</span>
                                        <asp:TextBox ID="txtStartDate" runat="server" type="date" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFVStartDate" runat="server" ControlToValidate="txtStartDate"
                                            ErrorMessage="Please select a start date." Display="Dynamic" CssClass="text-danger">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="form-label">End Date</label><span class="text-danger">*</span>
                                        <asp:TextBox ID="txtEndDate" runat="server" type="date" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFVEndDate" runat="server" ControlToValidate="txtEndDate"
                                            ErrorMessage="Please select a End date." Display="Dynamic" CssClass="text-danger">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-2 mt-4">
                                        <asp:Button ID="btnShow" runat="server" CssClass="btn btn-success" Text="Show Report" OnClick="btnShow_Click" />
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
                                <!-- To add Button To show Extra Column Add nowrap Bootstrap property to table CssClass. -->
                                <asp:GridView ID="gvUnitWiseReport" runat="server" AutoGenerateColumns="False" CssClass="UnitWiseReport table table-bordered dt-responsive table-striped align-middle" Width="100%" OnRowCommand="gvUnitWiseReport_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CssClass="me-2 link-success fs-15" runat="server" CommandName="ShowDetails" CommandArgument='<%# Eval("UnitCode") + "|" + Eval("SupervisorId") + "|" + Eval("StartDate") + "|" + Eval("VisitType") + "|" + Eval("IsVisited") %>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit">Details</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit">
                                            <ItemTemplate>
                                                <%# Eval("UnitCode") + " - " + Eval("UnitName") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Supervisor">
                                            <ItemTemplate>
                                                <%# Eval("Empname") + " (" + Eval("SupervisorId") + ")" %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="StartDateTime">
                                            <ItemTemplate>
                                                <%# Eval("StartDate") + " (" + Eval("StartTime") + ")" %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EndDateTime">
                                            <ItemTemplate>
                                                <%# Eval("EndDate") + " (" + Eval("EndTime") + ")" %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="StartVisitTime" HeaderText="StartVisitTime" SortExpression="" />
                                        <asp:BoundField DataField="EndVisitTime" HeaderText="EndVisitTime" SortExpression="" />
                                        <asp:TemplateField HeaderText="IsVisited">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIsVisited" runat="server" Text='<%# Eval("IsVisited") %>'
                                                    CssClass='<%# "fs-10 text-nowrap badge " + (Eval("IsVisited").ToString() == "Visited" ? "bg-success-subtle text-success" : "bg-danger-subtle text-danger") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Visit Type">
                                            <ItemTemplate>
                                                <%# Eval("VisitType").ToString() == "Planned" ? "Scheduled" : "Patrolling" %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div align="center">No records found.</div>
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
            var table = $(".UnitWiseReport").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
</asp:Content>
