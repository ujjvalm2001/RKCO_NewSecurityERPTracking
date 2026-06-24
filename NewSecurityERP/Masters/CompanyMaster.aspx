<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CompanyMaster.aspx.cs" Inherits="NewSecurityERP.Masters.CompanyMaster" %>
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
                                <h5 class="card-title mb-0 flex-grow-1">Company Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row gy-4">
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtCompanyCode" class="form-label">Company Code</label>
                                                <asp:TextBox ID="txtCompanyCode" runat="server" CssClass="form-control" Enabled="False">
                                                </asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtCompanyName" class="form-label">Company Name</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Enter Company Name..."></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVCompanyName" runat="server"
                                                    ControlToValidate="txtCompanyName" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter Company Name !!!" ValidationGroup="g1"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtCityName" class="form-label">City Name</label>
                                                <asp:TextBox ID="txtCityName" runat="server" CssClass="form-control" placeholder="Enter City Name..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtPinCode" class="form-label">PinCode </label>
                                                <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" MaxLength="6" Minlength="6" placeholder="Enter Pincode..." onkeypress="return isNumeric(event)"> </asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtState" class="form-label">State Name</label>
                                                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="Enter State Name..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtPhoneNo" class="form-label">PhoneNo</label>
                                                <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control" MaxLength="10" Minlength="10" placeholder="Enter Pnone No..." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPhoneNo" ID="RegularExpressionValidator5" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtGSTINID" class="form-label">GST ID/UniqueID </label>
                                                <asp:TextBox ID="txtGSTINID" runat="server" CssClass="form-control" placeholder="Enter GST ID..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtEmailID" class="form-label">Email ID</label>
                                                <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control" placeholder="Enter Email ID..."></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="REVEmailID" runat="server" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter EmailID for Correct Format !!!" ControlToValidate="txtEmailID"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtWebSite" class="form-label">WebSite</label>
                                                <asp:TextBox ID="txtWebSite" runat="server" CssClass="form-control" placeholder="Enter Website..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtPanNo" class="form-label">Pan No</label>
                                                <asp:TextBox ID="txtPanNo" runat="server" CssClass="form-control" placeholder="Enter Pan No..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtCINNo" class="form-label">CIN No</label>
                                                <asp:TextBox ID="txtCINNo" runat="server" CssClass="form-control" placeholder="Enter CIN No..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtReqAddress" class="form-label">Registered Address</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtReqAddress" runat="server" CssClass="form-control" Height="38px" placeholder="Enter Reg. Address..." TextMode="MultiLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVRegAddress" runat="server"
                                                    ControlToValidate="txtReqAddress" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter Reg. Address !!!" ValidationGroup="g1"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtAddress" class="form-label">Address</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Height="38px" placeholder="Enter Address..." TextMode="MultiLine"></asp:TextBox><%--ontextchanged="txtAddress_TextChanged" --%>
                                                <asp:RequiredFieldValidator ID="RFVAddresss" runat="server"
                                                    ControlToValidate="txtAddress" CssClass="error" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter Address !!!" ValidationGroup="g1"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                <asp:GridView ID="gvCompanyMaster" runat="server" CssClass="companyMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%" AutoGenerateColumns="false"
                                    OnRowCommand="gvCompanyMaster_RowCommand" OnRowDeleting="gvCompanyMaster_RowDeleting" OnRowUpdating="gvCompanyMaster_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                                <%--<asp:LinkButton ID="btndelete" runat="server" CssClass="link-danger fs-15" CommandName="delete" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="delete"><i class="ri-delete-bin-line"></i></asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="compid" HeaderText="CompID " SortExpression="" />
                                        <asp:BoundField DataField="compname" HeaderText="Company Name" SortExpression="" />
                                        <asp:BoundField DataField="compaddress" HeaderText="Address" SortExpression="" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="" />
                                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="" />

                                        <asp:BoundField DataField="pincode" HeaderText="PinCode" SortExpression="" />
                                        <asp:BoundField DataField="phoneno" HeaderText="Phone" SortExpression="" />
                                        <asp:BoundField DataField="Email" HeaderText="Email ID" SortExpression="" />
                                        <asp:BoundField DataField="website" HeaderText="Website" SortExpression="" />
                                        <asp:BoundField DataField="PANNo" HeaderText="Pan No" SortExpression="" />
                                        <asp:BoundField DataField="ReqAddress" HeaderText="Registered Address" SortExpression="" />
                                        <asp:BoundField DataField="GSTINNo" HeaderText="GSTIN No" SortExpression="" />
                                        <asp:BoundField DataField="CINNo" HeaderText="CIN No" SortExpression="" />

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
            var table = $(".companyMaster").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
