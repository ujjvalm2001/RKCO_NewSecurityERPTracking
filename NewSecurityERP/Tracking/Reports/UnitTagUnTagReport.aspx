<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UnitTagUnTagReport.aspx.cs" Inherits="NewSecurityERP.Tracking.Reports.UnitTagUnTagReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content overflow-hidden" style="min-height: 600px">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h5 class="card-title mb-0 flex-grow-1">Unit Tag/UnTag Report</h5>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">Status</label><span class="text-danger">*</span>
                                        <asp:DropDownList ID="ddlStatus" CssClass="form-select" runat="server">
                                            <asp:ListItem Value="0" Text="-- SELECT --" Selected="True" disabled=""></asp:ListItem>
                                            <asp:ListItem Value="tag" Text="Taged Unit"></asp:ListItem>
                                            <asp:ListItem Value="untag" Text="UnTaged Unit"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:requiredfieldvalidator id="RequiredFieldValidator" runat="server" ControlToValidate="ddlStatus" ValidationGroup="group1" ForeColor="red" Display="dynamic" ErrorMessage="Please Select a Value" InitialValue="0"></asp:requiredfieldvalidator>
                                    </div>

                                    <div class="col-md-3 mt-4 mb-3">
                                        <asp:Button id="BtnShowReport" runat="server" type="button" ValidationGroup="group1" class="btn btn-success" Text="Show Report" OnClick="BtnShowReport_Click"></asp:Button>
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
                                <asp:GridView ID="gvUnitTagReport" runat="server" AutoGenerateColumns="False" CssClass="UnitTagReport table table-bordered dt-responsive table-striped align-middle" Width="100%"
                                    ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>                                        
                                        <asp:BoundField DataField="unitname" HeaderText="Unit Name" SortExpression="" />
                                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="" />
                                        <asp:BoundField DataField="latitude" HeaderText="Latitude" SortExpression="" />
                                        <asp:BoundField DataField="longitude" HeaderText="Longitude" SortExpression="" />
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
        <script type="text/javascript">
        $(document).ready(function () {           
            var table = $(".UnitTagReport").prepend($("<thead></thead>").append($(".UnitTagReport").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
        </script>
</asp:Content>
