<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ClientMaster.aspx.cs" Inherits="NewSecurityERP.Masters.ClientMaster" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Client Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="live-preview">
                                    <div class="row gy-4">
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtClientCode" class="form-label">Client Code</label>
                                                <asp:TextBox ID="txtClientCode" runat="server" CssClass="form-control" Enabled="False">
                                                </asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtClientName" class="form-label">Client Name</label><span class="text-danger">*</span>
                                                <asp:TextBox ID="txtClientName" runat="server" CssClass="form-control" placeholder="Enter Client Name..."></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFVClientName" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="txtClientName"
                                                    ErrorMessage="Please Enter the Client Name !!!" ValidationGroup="g1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtPhoneNo" class="form-label">PhoneNo</label>
                                                <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control" MaxLength="10" Minlength="10" placeholder="Enter Pnone No..." onkeypress="return isNumeric(event)"></asp:TextBox>
                                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtPhoneNo" ID="RegularExpressionValidator5" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Minimum 10 characters required." ForeColor="Red" ValidationGroup="g1"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtEmailID" class="form-label">Email ID</label>
                                                <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control" placeholder="Enter Email ID..."></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="REVEmailID" runat="server" ForeColor="Red" Display="Dynamic"
                                                    ErrorMessage="Please Enter EmailID for Correct Format !!!" ControlToValidate="txtEmailID" ValidationGroup="g1"
                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtCity" class="form-label">City Name</label>
                                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Enter City Name..."></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtPincode" class="form-label">PinCode </label>
                                                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" MaxLength="6" Minlength="6" placeholder="Enter Pincode ..." onkeypress="return isNumeric(event)"> </asp:TextBox>
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
                                                <label for="ddlState" class="form-label">State Name</label>
                                                <%-- <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="Enter State Name..."></asp:TextBox>--%>
                                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-select" placeholder="Select the State..."></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtAddress" class="form-label">Head Office</label>
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="Enter Head Office..." TextMode="MultiLine" Height="36"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtAddress1" class="form-label">Address</label>
                                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control" Placeholder="Enter Address..." TextMode="MultiLine" Height="36"></asp:TextBox><%--OnKeyPress="return chkAlpha();"--%>
                                            </div>
                                        </div>
                                        <div class="col-xxl-3 col-md-6">
                                            <div>
                                                <label for="txtRemark" class="form-label">Remarks</label>
                                                <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" Placeholder="Enter Remarks..." TextMode="MultiLine" Height="36"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div style="display: flex; justify-content: flex-end;">
                                            <div class="col-xxl-3 col-md-6" style="text-align: right">
                                                <div>
                                                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-success waves-effect waves-light" Text="Save" ValidationGroup="g1" OnClick="btnSave_Click" />
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
                                <asp:GridView ID="gvClientMaster" runat="server" AutoGenerateColumns="False" CssClass="ClientMaster table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvClientMaster_RowCommand"
                                    OnRowDeleting="gvClientMaster_RowDeleting" OnRowUpdating="gvClientMaster_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument='<%# Eval("clientCode")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                                <%--<asp:LinkButton ID="btndelete" runat="server" CssClass="link-danger fs-15" CommandName="delete" CommandArgument='<%# Eval("compid")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="delete"><i class="ri-delete-bin-line"></i></asp:LinkButton>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="clientCode" HeaderText="Client Code " SortExpression="" />
                                        <asp:BoundField DataField="ClientName" HeaderText="Client Name" SortExpression="" />
                                        <asp:BoundField DataField="HeadOffice" HeaderText="Head Office" SortExpression="" />
                                        <asp:BoundField DataField="EmailID" HeaderText="Email ID" SortExpression="" />
                                        <asp:BoundField DataField="compid" HeaderText="Company ID" Visible="false" SortExpression="" />
                                        <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" SortExpression="" />
                                        <asp:BoundField DataField="CityName" HeaderText="City Name" SortExpression="" />
                                        <asp:BoundField DataField="Website" HeaderText="Web site" SortExpression="" />
                                        <asp:BoundField DataField="Address2" HeaderText="Address" SortExpression="" />
                                        <asp:BoundField DataField="StateCode" HeaderText="State Code" SortExpression="" />
                                        <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="" />
                                        <asp:BoundField DataField="PinCode" HeaderText="PinCode" SortExpression="" />
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
            var table = $(".ClientMaster").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
