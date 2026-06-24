<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UnitQRCode.aspx.cs" Inherits="NewSecurityERP.Masters.UnitQRCode" %>
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
                                <h5 class="card-title mb-0 flex-grow-1">Unit QR Code Generate</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Branch</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlBranch" runat="server" CssClass="selectpicker form-control" AutoPostBack="true" data-live-search="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranch" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select a value" InitialValue="0" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="mb-3">
                                            <label class="form-label">Unit</label><span class="text-danger">*</span>
                                            <asp:DropDownList ID="ddlUnit" runat="server" CssClass="selectpicker form-control" data-live-search="true" AutoPostBack="false"></asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlUnit" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Select a value" InitialValue="0" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="hstack gap-2 justify-content-end">
                                        <asp:Button ID="ClearBtn" type="button" runat="server" OnClick="ClearBtn_Click" Text="Clear" class="btn btn-danger"></asp:Button>
                                        <asp:Button ID="ShowQRCode" type="button" runat="server" OnClick="ShowQRCode_Click" Text="Show QRCode" ValidationGroup="Group1" class="btn btn-success"></asp:Button>
                                    </div>
                                </div>
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
</asp:Content>
