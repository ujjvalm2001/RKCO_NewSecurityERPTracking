<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="NewSecurityERP.Dashboard" %>

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
                                <h5 class="card-title mb-0 flex-grow-1">InComplete Candidate Details</h5>
                            </div>

                            <div class="card-body">
                                <asp:GridView ID="gvCandidateDetails" runat="server" AutoGenerateColumns="false" CssClass="IncompCandidateDetails table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvCandidateDetails_RowCommand" OnRowUpdating="gvCandidateDetails_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="UpDate" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RegistrationID" HeaderText="Registration ID " SortExpression="" />
                                        <asp:BoundField DataField="AadharCardNo" HeaderText="AadharCard No" SortExpression="" />
                                        <asp:BoundField DataField="CandidateName" HeaderText="Candidate Name" SortExpression="" />
                                        <asp:BoundField DataField="DateofBirth" HeaderText="Date of Birth" SortExpression="" />
                                        <asp:BoundField DataField="DateofJoining" HeaderText="Date of Joining" SortExpression="" />

                                        <asp:BoundField DataField="JobType" HeaderText="JobType" SortExpression="" />
                                        <asp:BoundField DataField="EmailID" HeaderText="Email ID" SortExpression="" />


                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div align="center">No records found.</div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center d-flex">
                                <h5 class="card-title mb-0 flex-grow-1">Rejected Candidate Details For Correction</h5>
                            </div>
                            <div class="card-body">
                                <asp:GridView ID="gvCandidateforCorrection" runat="server" AutoGenerateColumns="false" CssClass="CorrectionCandidateDetails table table-bordered dt-responsive nowrap table-striped align-middle" Width="100%"
                                    OnRowCommand="gvCandidateforCorrection_RowCommand" OnRowUpdating="gvCandidateforCorrection_RowUpdating" ShowHeader="true" ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No.">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                            <HeaderStyle CssClass="text-center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnedit" CssClass="me-2 link-success fs-15" runat="server" CommandName="UpDate" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" data-bs-toggle="tooltip" data-bs-placement="bottom" title="edit"><i class="ri-edit-2-line"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RegistrationID" HeaderText="Registration ID " SortExpression="" />
                                        <asp:BoundField DataField="AadharCardNo" HeaderText="AadharCard No" SortExpression="" />
                                        <asp:BoundField DataField="CandidateName" HeaderText="Candidate Name" SortExpression="" />
                                        <asp:BoundField DataField="FatherName" HeaderText="Father Name" SortExpression="" />
                                        <asp:BoundField DataField="DateofBirth" HeaderText="Date of Birth" SortExpression="" />
                                        <asp:BoundField DataField="DateofJoining" HeaderText="Date of Joining" SortExpression="" />

                                        <asp:BoundField DataField="JobType" HeaderText="JobType" SortExpression="" />
                                        <asp:BoundField DataField="EmailID" HeaderText="Email ID" SortExpression="" />
                                        <asp:BoundField DataField="DeviationRemark" HeaderText="Reason for Rejection" SortExpression="" />

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
            var table1 = $(".IncompCandidateDetails").prepend($("<thead></thead>").append($(".IncompCandidateDetails").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });

            var table2 = $(".CorrectionCandidateDetails").prepend($("<thead></thead>").append($(".CorrectionCandidateDetails").find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
            });
        });        

    </script>

</asp:Content>
