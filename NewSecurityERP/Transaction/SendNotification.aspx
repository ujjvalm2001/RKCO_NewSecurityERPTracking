<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SendNotification.aspx.cs" Inherits="NewSecurityERP.Transaction.SendNotification" %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Send Notification Master</h5>
                            </div>
                            <!-- end card header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label class="form-label">Notification Code</label>
                                            <asp:TextBox ID="txtNotificationCode" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label class="form-label">Notification Title</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtNotificationTitle" runat="server" CssClass="form-control" placeholder="Enter Notification Title"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNotificationTitle" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Task Name" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>


                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label class="form-label">Send To</label><span class="text-danger">*</span>
                                            <asp:DropDownCheckBoxes ID="ddlSendTo" runat="server" AutoPostBack="false" UseSelectAllNode="True">
                                            </asp:DropDownCheckBoxes>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Notification Message</label><span class="text-danger">*</span>
                                            <asp:TextBox ID="txtNotificationMessage" runat="server" CssClass="form-control" placeholder="Enter Notification Message" TextMode="MultiLine" Height="80px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNotificationMessage" ForeColor="Red" Display="Dynamic" ErrorMessage="Please Enter Task Name" ValidationGroup="Group1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="hstack gap-2 justify-content-end">
                                        <asp:Button ID="ClearBtn" runat="server" OnClick="ClearBtn_Click" Text="Clear" type="button" class="btn btn-danger"></asp:Button>
                                        <asp:Button ID="SaveBtn" runat="server" OnClick="SaveBtn_Click" ValidationGroup="Group1" Text="Save" type="button" class="btn btn-success"></asp:Button>
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
                                <asp:GridView ID="gvSendNotification" runat="server" AutoGenerateColumns="False" CssClass="SendNotification table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvSendNotification_RowCommand" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="EditNotification" CommandArgument='<%# Eval("NotificationId")%>' data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="NotificationTitle" HeaderText="Notification Title " SortExpression="" />
                                        <asp:BoundField DataField="NotificationMessage" HeaderText="Notification Message" SortExpression="" />
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
            var table = $(".SendNotification").prepend($("<thead></thead>").append($(".SendNotification").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
        </script>
</asp:Content>
