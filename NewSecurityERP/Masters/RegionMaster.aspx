<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RegionMaster.aspx.cs" Inherits="NewSecurityERP.Masters.RegionMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Region Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row gy-4">
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtregionCode" class="form-label">Region Code</label>
                                                <asp:TextBox ID="txtregionCode" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtRegionName" class="form-label">Region Name</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtRegionName" runat="server" CssClass="form-control" placeholder="Enter Region Name..."></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVZone" runat="server"
                                                    ControlToValidate="txtRegionName" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter Region Name !!!" ValidationGroup="g1"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtRegionHead" class="form-label">Region Head</label>
                                                <asp:TextBox ID="txtRegionHead" runat="server" CssClass="form-control" MaxLength="40" placeholder="Enter Region Head..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtContactNo" class="form-label">Contact No</label>
                                                <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" MaxLength="10" placeholder="Enter Contact No..." onkeypress="return isNumeric(event)"> </asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtEmailID" class="form-label">EmailID</label>
                                                <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control" placeholder="Enter Email ID..."></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="REVEmailID" runat="server" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter EmailID for Correct Format !!!" ControlToValidate="txtEmailID" ValidationGroup="g1"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-4 col-md-6">
                                            <div>
                                                <label for="txtRegionRemark" class="form-label">Region Remark</label>
                                                <asp:TextBox ID="txtRegionRemark" runat="server" CssClass="form-control" placeholder="Enter Region Remark..." TextMode="MultiLine" Height="36"></asp:TextBox>
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
                                <asp:GridView ID="gvRegionMaster" runat="server" CssClass="RegionMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%" AutoGenerateColumns="False"
                                    OnRowCommand="gvRegionMaster_RowCommand" OnRowDeleting="gvRegionMaster_RowDeleting" OnRowUpdating="gvRegionMaster_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument='<%# Eval("RegionCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                                <%--<asp:LinkButton ID="btndelete" runat="server" CssClass="link-danger fs-15" CommandName="delete" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="delete"><i class="ri-delete-bin-line"></i></asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RegionCode" HeaderText="Region Code " SortExpression="" />
                                        <asp:BoundField DataField="RegionName" HeaderText="Region Name" SortExpression="" />
                                        <asp:BoundField DataField="RegionHead" HeaderText="Region Head" SortExpression="" />
                                        <asp:BoundField DataField="ContactNo" HeaderText="Contact No" SortExpression="" />
                                        <asp:BoundField DataField="EmailID" HeaderText="EmailID" SortExpression="" />
                                        <asp:BoundField DataField="RegionRemark" HeaderText="Region Remark" SortExpression="" />
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
            var table = $(".RegionMaster").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
