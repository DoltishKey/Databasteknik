<!DOCTYPE html>
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1>Personal</h1>
                    <ul class="list-group staff">
                        <li class="list-group-item">
                            <h4>Emil Persson <span class="pull-right show_more_info btn btn-primary" style="position:relative; top:-5px;">+</span></h4>
                            <div class="more_staff_info">
                                <table class="table">
                                    <tr>
                                        <th>Person.nr</th>
                                        <th>Mejl</th>
                                        <th>Tele</th>
                                        <th>Erfarenhet</th>
                                    </tr>
                                    <tr>
                                        <td>1887-01-19</td>
                                        <td>emil@emil.nu</td>
                                        <td>040-13371</td>
                                        <td>Lång</td>
                                    </tr>
                                </table>
                                <button type="button" class="btn btn-danger">Ta bort person</button>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <h4>Nisse Persson <span class="pull-right show_more_info btn btn-primary" style="position:relative; top:-5px;">+</span></h4>
                            <div class="more_staff_info">
                                <table class="table">
                                    <tr>
                                        <th>Person.nr</th>
                                        <th>Mejl</th>
                                        <th>Tele</th>
                                        <th>Erfarenhet</th>
                                    </tr>
                                    <tr>
                                        <td>1987-01-19</td>
                                        <td>nisse@nisse.nu</td>
                                        <td>040-13372</td>
                                        <td>Medel</td>
                                    </tr>
                                </table>
                                <button type="button" class="btn btn-danger">Ta bort person</button>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <h4>Kalle Persson <span class="pull-right show_more_info btn btn-primary" style="position:relative; top:-5px;">+</span></h4>
                            <div class="more_staff_info">
                                <table class="table">
                                    <tr>
                                        <th>Person.nr</th>
                                        <th>Mejl</th>
                                        <th>Tele</th>
                                        <th>Erfarenhet</th>
                                    </tr>
                                    <tr>
                                        <td>2087-01-19</td>
                                        <td>kallel@kalle.nu</td>
                                        <td>040-13372</td>
                                        <td>Lite</td>
                                    </tr>
                                </table>
                                <button type="button" class="btn btn-danger">Ta bort person</button>
                            </div>
                        </li>
                        <li class="list-group-item add_new_staff_member">
                            <h4>Ny anställd</h4>
                            <form>
                                <div class="more_info">
                                    <div class="form-group">
                                        <label for="staff-name">Namn</label>
                                        <input type="input" class="form-control" id="staff-name" placeholder="Namn">
                                    </div>
                                    <div class="form-group">
                                        <label for="staff-pernr">Personummer</label>
                                        <input type="input" class="form-control" id="staff-pernr" placeholder="Namn">
                                    </div>
                                    <div class="form-group">
                                        <label for="staff-tele">Tele</label>
                                        <input type="input" class="form-control" id="staff-tele" placeholder="Tele">
                                    </div>
                                    <div class="form-group">
                                        <label for="staff-mejl">Mejl</label>
                                        <input type="input" class="form-control" id="staff-mejl" placeholder="Mejl">
                                    </div>
                                    <div class="form-group">
                                        <label for="staff-merits">Erfarenhet</label>
                                        <input type="input" class="form-control" id="staff-merits" placeholder="Tele">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary col-xs-12 col-md-6 col-md-offset-3">Spara användare</button>
                                    </div>
                                </div>
                            </from>
                        </li>
                    </ul>
                    <div class="row">
                        <button type="button" class="btn btn-primary col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1" id="add_staff">Lägg till personal</button>
                    </div>
                </div>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>
