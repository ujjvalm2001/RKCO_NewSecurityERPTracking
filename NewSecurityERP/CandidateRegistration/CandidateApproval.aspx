<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CandidateApproval.aspx.cs" Inherits="NewSecurityERP.CandidateRegistration.CandidateApproval" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">Pending  Candidate For Approval</h5>
                            </div>
                            <div class="card-body">
                                <asp:GridView ID="gvCandidate" runat="server" AutoGenerateColumns="false" CssClass="CandidateApproval table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvCandidate_RowCommand" OnRowDeleting="gvCandidate_RowDeleting" OnRowUpdating="gvCandidate_RowUpdating" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="update" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-eye-line fs-4"></i></asp:LinkButton>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RegistrationID" HeaderText="Registration ID " SortExpression="" />
                                        <asp:BoundField DataField="Salutation" HeaderText="Salutation " SortExpression="" />
                                        <asp:BoundField DataField="CandidateName" HeaderText="Candidate Name" SortExpression="" />
                                        <asp:BoundField DataField="DateofBirth" HeaderText="Date of Birth" SortExpression="" />
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="" />
                                        <asp:BoundField DataField="MaritalStatus" HeaderText="Marital Status" SortExpression="" />
                                        <asp:BoundField DataField="FatherName" HeaderText="Father Name" SortExpression="" />
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
            var table = $(".CandidateApproval").prepend($("<thead></thead>").append($(".CandidateApproval").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });
    </script>
</asp:Content>
