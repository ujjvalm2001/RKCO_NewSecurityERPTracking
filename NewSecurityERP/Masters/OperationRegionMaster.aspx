<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OperationRegionMaster.aspx.cs" Inherits="NewSecurityERP.Masters.OperationRegionMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Operational Area Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row gy-4">
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtOPAreaCode" class="form-label">Operational Area Code</label>
                                                <asp:TextBox ID="txtOPAreaCode" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtOPAreaName" class="form-label">Operational Area Name</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtOPAreaName" runat="server" CssClass="form-control" placeholder="Enter Operational Area Name..."></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVOParea" runat="server"
                                                    ControlToValidate="txtOPAreaName" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter Operational Area Name !!!" ValidationGroup="g1"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtOPAreaRemark" class="form-label">Remark</label>
                                                <asp:TextBox ID="txtOPAreaRemark" runat="server" CssClass="form-control" placeholder="Enter Remark..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div style="display: flex; justify-content: flex-end;">
                                            <div class="col-xxl-3 col-md-6" style="text-align: right">
                                                <div>
                                                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success waves-effect waves-light" Text="Save" OnClick="btnSave_Click" ValidationGroup="g1" />
                                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger waves-effect waves-light" Text="Clear" OnClick="btnCancel_Click" />

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end col-->
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <asp:GridView ID="gvOPRegionMaster" runat="server" AutoGenerateColumns="False" CssClass="OperationalMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvOPRegionMaster_RowCommand" OnRowDeleting="gvOPRegionMaster_RowDeleting"
                                    OnRowUpdating="gvOPRegionMaster_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument='<%# Eval("OPAreaCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                                <%--<asp:LinkButton ID="btndelete" runat="server" CssClass="link-danger fs-15" CommandName="delete" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="delete"><i class="ri-delete-bin-line"></i></asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="OPAreaCode" HeaderText="Operationa Area Code " SortExpression="" />
                                        <asp:BoundField DataField="OPAreaName" HeaderText="Operationa Area Name" SortExpression="" />
                                        <asp:BoundField DataField="OPAreaRemark" HeaderText="Remark" SortExpression="" />
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
    <script type="text/javascript">
    $(document).ready(function () {
        var table = $(".OperationalMaster").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ]
        });
    });
    </script>
</asp:Content>
