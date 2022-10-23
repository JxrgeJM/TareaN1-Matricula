<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewEstadisticaCursosMatriculados.aspx.cs" Inherits="ProgramacionAvanzadaTareaN1.Presentacion.Views.Consultas.ViewEstadisticaCursosMatriculados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Estadística Cursos Matriculados</h3>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10">
                <label class="mr-1">Cuatrimestre:</label>
                <asp:DropDownList ID="DropDownListPeriodo" runat="server" Width="100px" CssClass="form-control form-control-sm mr-2" >
                    <asp:ListItem Value="32022" Text="032022" Selected="True" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="row mt-3">
            <div  class="col">
                <asp:Label ID="LabelEstadistica" runat="server" Font-Bold="True" ForeColor="#0099FF"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
