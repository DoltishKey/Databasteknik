<!DOCTYPE html>
%from bottle import request
<html lang="sv">
    %include('head.tpl')
    <body>
        %include('nav.tpl')
        <div class="container-fluid ">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <h1>Säkerhetsansvar</h1>
                    <ul class="nav nav-tabs nav-justified">
                         <li role="navigation"><a href="/security">Säkerhetsansvar fattas</a></li>
                         <li role="navigation" class="active"><a href="/security_search">Scenschema säkerhetsansvar</a></li>
                         <li role="navigation"><a href="#">Schema säkerhetsansvarig</a></li>
                    </ul>
                    <div class="row">
                        <h4>Se säkhetsansvariga på:</h4>
                        <form>
                            <div class="form-group col-md-2">
                                <label class="checkbox">
                                    <input type="checkbox" id="inlineCheckbox1" value="option1"> Stora
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" id="inlineCheckbox2" value="option2"> Mellan
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" id="inlineCheckbox3" value="option3"> Lilla
                                </label>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="from_time">Från kl:</label>
                                <input type="text" class="form-control" id="from_time" placeholder="Från kl">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="to_time">Till kl:</label>
                                <input type="email" class="form-control" id="to_time" placeholder="Till kl">
                            </div>
                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary">Se säkerhetsansvariga</button>
                            </div>
                        </form>
                    </div>
                    <div class="row">
                        <table class="table">
                            <tr>
                                <th>Scen</th>
                                <th>Dag</th>
                                <th>Startid</th>
                                <th>Slutid</th>
                                <th>Säkerhetsansvarig</th>
                                <th></th>
                                <th></th>

                            </tr>
                            <tr>
                                <td>Diseltältet</td>
                                <td>Lördag</td>
                                <td>12.00</td>
                                <td>16.00</td>
                                <td>
                                    <p class="selected_staff_securoty">Kalle <button type="button" class="btn btn-default get_security_info" data-container="body" data-toggle="popover" data-placement="right" data-html="true" data-content="Persnr: 1998.01.12  <br />Tele:040-13371">Info</button></p>
                                    <from class="change_staff_security">
                                        <select class="form-control">
                                            <option>Kalle</option>
                                            <option>Nisse</option>
                                            <option>Pelle</option>
                                        </select>
                                    </form>
                                </td>
                                <td><button type="button" class="btn btn-primary change_security">Byt ansvarig</button></td>
                                <td><button type="button" class="btn btn-danger remove_security">Ta bort</button></td>
                            </tr>
                            <tr>
                                <td>Diseltältet</td>
                                <td>Lördag</td>
                                <td>08.00</td>
                                <td>12.00</td>
                                <td>
                                    <p class="selected_staff_securoty">Nisse <button type="button" class="btn btn-default get_security_info">Info</button></p>
                                    <from class="change_staff_security">
                                        <select class="form-control">
                                            <option>Kalle</option>
                                            <option>Nisse</option>
                                            <option>Pelle</option>
                                        </select>
                                    </form>
                                </td>
                                <td><button type="button" class="btn btn-primary change_security">Byt ansvarig</button></td>
                                <td><button type="button" class="btn btn-danger remove_security">Ta bort</button></td>
                            </tr>
                            <tr>
                                <td>Diseltältet</td>
                                <td>Söndag</td>
                                <td>08.00</td>
                                <td>12.00</td>
                                <td>
                                    <p class="selected_staff_securoty">Pelle <button type="button" class="btn btn-default get_security_info">Info</button></p>
                                    <from class="change_staff_security">
                                        <select class="form-control">
                                            <option>Kalle</option>
                                            <option>Nisse</option>
                                            <option>Pelle</option>
                                        </select>
                                    </form>
                                </td>
                                <td><button type="button" class="btn btn-primary change_security">Byt ansvarig</button></td>
                                <td><button type="button" class="btn btn-danger remove_security">Ta bort</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>        
        %include('footer.tpl')
    </body>
</html>
