<!DOCTYPE html>
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1>Säkerhetsansvar</h1>
                    <ul class="nav nav-tabs nav-justified">
                         <li role="navigation" class="active"><a href="/security">Säkerhetsansvar fattas</a></li>
                         <li role="navigation"><a href="/security_search">Scenschema säkerhetsansvar</a></li>
                         <li role="navigation"><a href="#">Schema säkerhetsansvarig</a></li>
                    </ul>

                    <table class="table">
                        <tr>
                            <th>Scen</th>
                            <th>Dag</th>
                            <th>Startid</th>
                            <th>Slutid</th>
                            <th>Ledig personal</th>
                            <th></th>

                        </tr>
                        <tr>
                            <td>Diseltältet</td>
                            <td>Lördag</td>
                            <td>12.00</td>
                            <td>16.00</td>
                            <td>
                                <from>
                                    <select class="form-control" id="stil">
                                        <option>Kalle</option>
                                        <option>Nisse</option>
                                        <option>Pelle</option>
                                    </select>
                                </form>
                            </td>
                            <td><button type="button" class="btn btn-success assign_security">Tilldela</button></td>
                        </tr>
                        <tr>
                            <td>Diseltältet</td>
                            <td>Lördag</td>
                            <td>08.00</td>
                            <td>12.00</td>
                            <td>
                                <from>
                                    <select class="form-control" id="stil">
                                        <option>Kalle</option>
                                        <option>Nisse</option>
                                        <option>Pelle</option>
                                    </select>
                                </form>
                            </td>
                            <td><button type="button" class="btn btn-success assign_security">Tilldela</button></td>
                        </tr>
                        <tr>
                            <td>Diseltältet</td>
                            <td>Söndag</td>
                            <td>08.00</td>
                            <td>12.00</td>
                            <td>
                                <from>
                                    <select class="form-control" id="stil">
                                        <option>Kalle</option>
                                        <option>Nisse</option>
                                        <option>Pelle</option>
                                    </select>
                                </form>
                            </td>
                            <td><button type="button" class="btn btn-success assign_security">Tilldela</button></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>
