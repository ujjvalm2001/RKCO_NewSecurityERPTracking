<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DepartmentMaster.aspx.cs" Inherits="NewSecurityERP.Masters.DepartmentMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content overflow-hidden">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h5 class="card-title mb-0 flex-grow-1">Department Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Department Code</label>
                                            <asp:TextBox ID="txtDepartmentCode" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Department Name</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtDepartmentName" runat="server" CssClass="form-control" placeholder="Enter Department Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDepartmentName" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Department Name" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                <asp:GridView ID="gvDepartmentMaster" runat="server" AutoGenerateColumns="False" CssClass="DepartmentMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvDepartmentMaster_RowCommand" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="EditDepartment" CommandArgument='<%# Eval("DepartmentCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DepartmentCode" HeaderText="Department Code" SortExpression="" />
                                        <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" SortExpression="" />
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
            var table = $(".DepartmentMaster").prepend($("<thead></thead>").append($(".DepartmentMaster").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
</asp:Content>
