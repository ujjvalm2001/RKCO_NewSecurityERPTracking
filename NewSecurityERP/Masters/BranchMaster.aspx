<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="BranchMaster.aspx.cs" Inherits="NewSecurityERP.Masters.BranchMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Branch Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row gy-4">
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtBranchCode" class="form-label">Branch Code</label>
                                                <asp:TextBox ID="txtBranchCode" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtBranchName" class="form-label">Branch Name</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtBranchName" runat="server" CssClass="form-control" placeholder="Enter Branch Name..."></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVBranch" runat="server"
                                                    ControlToValidate="txtBranchName" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter Branch Name !!!" ValidationGroup="g1"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtEmailID" class="form-label">Email ID</label>
                                                <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control" placeholder="Enter Email ID..."></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="REVEmailID" runat="server" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter EmailID In Correct Format !!!" ControlToValidate="txtEmailID" ValidationGroup="g1"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtPhoneNo" class="form-label">Phone no</label>
                                                <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control" MaxLength="10" placeholder="Enter Phone No..." onkeypress="return isNumeric(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtAddress" class="form-label">Address</label>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtCity" class="form-label">City</label>
                                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter City..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtPin" class="form-label">PinCode</label>
                                                <asp:TextBox ID="txtPin" runat="server" CssClass="form-control" placeholder="Enter PinCode..." MaxLength="6" onkeypress="return isNumeric(event)"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="ddlRegionName" class="form-label">Region</label>
                                                <asp:DropDownList ID="ddlRegionName" runat="server" CssClass="form-select" placeholder="Select Region...">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="ddlStateName" class="form-label">State Name</label>
                                                <asp:DropDownList ID="ddlStateName" runat="server" CssClass="form-select" placeholder="Select state...">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtRemark" class="form-label">Remark</label>
                                                <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" placeholder="Enter Remark..."></asp:TextBox>
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
                                <asp:GridView ID="gvBranchMaster" runat="server" AutoGenerateColumns="False" CssClass="BranchMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvBranchMaster_RowCommand" OnRowDeleting="gvBranchMaster_RowDeleting"
                                    OnRowUpdating="gvBranchMaster_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument='<%# Eval("BranchCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                                <%--<asp:LinkButton ID="btndelete" runat="server" CssClass="link-danger fs-15" CommandName="delete" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="delete"><i class="ri-delete-bin-line"></i></asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="BranchCode" HeaderText="Branch Code " SortExpression="" />
                                        <asp:BoundField DataField="BranchName" HeaderText="Branch Name" SortExpression="" />
                                        <asp:BoundField DataField="BManager" HeaderText="Branch Email ID" SortExpression="" />
                                        <asp:BoundField DataField="BPhone" HeaderText="Phone No" SortExpression="" />
                                        <asp:BoundField DataField="Baddress" HeaderText="Address" SortExpression="" />
                                        <asp:BoundField DataField="Remark" HeaderText="Remarks" SortExpression="" />
                                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="" />
                                        <asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="" />
                                        <asp:BoundField DataField="BranchRegionCode" HeaderText="BranchRegionCode" SortExpression="" />
                                        <asp:BoundField DataField="BranchStateCode" HeaderText="BranchStateCode" SortExpression="" />
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
            var table = $(".BranchMaster").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
    <script>
        function isNumeric(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
