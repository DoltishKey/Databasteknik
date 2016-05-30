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
                         <li role="navigation"><a href="/schedule_security">Schema säkerhetsansvarig</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                <h2>Ansvar fattas</h2>
                    <table class="table">
                        <tr>
                            <th>Scen</th>
                            <th>Dag</th>
                            <th>Startid</th>
                            <th>Slutid</th>
                            <th>Ledig personal / erfarenhet</th>
                            <th></th>

                        </tr>
                        %from datetime import datetime, timedelta
                        %for scen in scens:
                            %for day in days:
                                %for time in times:

                                        %now_time = datetime.strptime(day + ' ' + time, '%Y-%m-%d %H:%M:%S')

                                        %if not any(now_time == staff[4] and scen[2] == staff[3] for staff in security):
                                            <tr>
                                                <td>{{scen[0]}}</td>
                                                <td>{{day}}</td>
                                                <td>{{now_time.hour}}:00</td>
                                                %end_time = now_time + timedelta(hours=4)
                                                <td>{{end_time.hour}}:00</td>
                                                <td>
                                                    <form class="form-inline" action="/assign_security" method="post">
                                                        <input type="hidden" value="{{now_time}}" name="starttime">
                                                        <input type="hidden" value="{{scen[2]}}" name="scen">
                                                        <select class="form-control from-inline" name="new_person">
                                                            %members= []
                                                            %for person in staff_members:
                                                                %if person[4] == now_time:
                                                                    %members.append(person[1])
                                                                %end
                                                            %end
                                                            %for person in staff_members:
                                                                %if person[1] not in members:
                                                                    %members.append(person[1])
                                                                    <option value="{{person[1]}}">{{person[0]}}, {{person[5]}} år</option>
                                                                %end
                                                            %end
                                                        </select>
                                                        <button type="submit" class="btn btn-success assign_security">Tilldela</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        %end

                                %end
                            %end
                        %end
                    </table>
                </div>
            </div>
        </div>

        %include('footer.tpl')
    </body>
</html>
