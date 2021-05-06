import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/circular_tooltip.dart';
import 'package:scrips_core/widgets/general/space.dart';

class AppointmentStatus extends StatelessWidget {
  final String status;
  final bool isDetail;
  final bool isToday;
  final Function onCancel;
  final Function onReschedule;
  final Function onStatusChange;

  AppointmentStatus(
      {@required this.status,
      this.onCancel,
      this.isToday,
      this.onReschedule,
      @required this.onStatusChange,
      this.isDetail = false});

  @override
  Widget build(BuildContext context) {
    return isDetail
        ? Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (status == appointmentStatusBooked && isToday)
                  Container(
                    width: 72,
                    child: CircularTooltip(
                      message: "Mark as Arrived",
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          onStatusChange(appointmentStatusArrived);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ScripsIcons.instance.icon(
                                  ScripsIcons.check,
                                  color: successTabColor),
                              decoration: BoxDecoration(
                                  color: lightGrey, shape: BoxShape.circle),
                            ),
                            Space(
                              vertical: 4,
                            ),
                            Text(
                              "Arrived",
                              style: normalLabelTextStyle(
                                  13, disabledTabTextColor,
                                  height: 1.43, letterSpacing: -0.037),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (status == appointmentStatusBooked && isToday)
                  Container(
                    width: 72,
                    child: CircularTooltip(
                      message: "Mark as No Show",
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          onStatusChange(appointmentStatusNoShow);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ScripsIcons.instance.icon(
                                  ScripsIcons.noShow,
                                  color: progressColor),
                              decoration: BoxDecoration(
                                  color: lightGrey, shape: BoxShape.circle),
                            ),
                            Space(
                              vertical: 4,
                            ),
                            Text(
                              "No Show",
                              style: normalLabelTextStyle(
                                  13, disabledTabTextColor,
                                  letterSpacing: -0.037),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (status == appointmentStatusCheckedIn && isToday)
                  Container(
                    width: 72,
                    child: CircularTooltip(
                      message: "Mark as Complete",
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          onStatusChange(appointmentStatusFulfilled);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ScripsIcons.instance.icon(
                                  ScripsIcons.completed,
                                  color: successTabColor),
                              decoration: BoxDecoration(
                                  color: lightGrey, shape: BoxShape.circle),
                            ),
                            Space(
                              vertical: 4,
                            ),
                            Text(
                              "Complete",
                              style: normalLabelTextStyle(
                                  13, disabledTabTextColor,
                                  letterSpacing: -0.037),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (status == appointmentStatusArrived && isToday)
                  Container(
                    width: 72,
                    child: CircularTooltip(
                      message: "Mark as Checked In",
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          onStatusChange(appointmentStatusCheckedIn);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ScripsIcons.instance.icon(
                                  ScripsIcons.checked_in,
                                  color: successTabColor),
                              decoration: BoxDecoration(
                                  color: lightGrey, shape: BoxShape.circle),
                            ),
                            Space(
                              vertical: 4,
                            ),
                            Text(
                              "Checked In",
                              style: normalLabelTextStyle(
                                  13, disabledTabTextColor,
                                  letterSpacing: -0.037),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if ((status == appointmentStatusArrived ||
                    status == appointmentStatusCheckedIn)&&  isToday)
                  Container(
                    width: 72,
                    child: CircularTooltip(
                      message: status == appointmentStatusArrived
                          ? "Unmark as Arrived"
                          : "Unmark as Checked In",
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          onStatusChange(status == appointmentStatusArrived
                              ? appointmentStatusBooked
                              : appointmentStatusArrived);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ScripsIcons.instance.icon(
                                  status == appointmentStatusArrived
                                      ? ScripsIcons.unmark_as_arrived
                                      : ScripsIcons.unmark_as_checked_in,
                                  color: blueColor),
                              decoration: BoxDecoration(
                                  color: lightGrey, shape: BoxShape.circle),
                            ),
                            Space(
                              vertical: 4,
                            ),
                            Text(
                              "unmark",
                              style: normalLabelTextStyle(
                                  13, disabledTabTextColor,
                                  letterSpacing: -0.037),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (status == appointmentStatusBooked)
                  Container(
                    width: 72,
                    child: CircularTooltip(
                      message: "Reschedule Appointment",
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: onReschedule,
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ScripsIcons.instance
                                  .icon(ScripsIcons.refresh, color: blueColor),
                              decoration: BoxDecoration(
                                  color: lightGrey, shape: BoxShape.circle),
                            ),
                            Space(
                              vertical: 4,
                            ),
                            Text(
                              "Reschedule",
                              style: normalLabelTextStyle(
                                  13, disabledTabTextColor,
                                  letterSpacing: -0.037),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (status != appointmentStatusCancelled &&
                    status != appointmentStatusNoShow &&
                    status != appointmentStatusFulfilled)
                  Container(
                    width: 72,
                    child: CircularTooltip(
                      message: "Cancel Appointment",
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: onCancel,
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ScripsIcons.instance
                                  .icon(ScripsIcons.cancel, color: flagsColor),
                              decoration: BoxDecoration(
                                  color: lightGrey, shape: BoxShape.circle),
                            ),
                            Space(
                              vertical: 4,
                            ),
                            Text(
                              "Cancel",
                              style: normalLabelTextStyle(
                                  13, disabledTabTextColor,
                                  letterSpacing: -0.037),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                if (status == appointmentStatusFulfilled)
                  Container(
                    width: 72,
                    child: CircularTooltip(
                      message: "Follow Up Appointment",
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          onStatusChange(appointmentStatusFulfilled);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: ScripsIcons.instance.icon(
                                  ScripsIcons.appointment,
                                  color: blueColor),
                              decoration: BoxDecoration(
                                  color: lightGrey, shape: BoxShape.circle),
                            ),
                            Space(
                              vertical: 4,
                            ),
                            Text(
                              "Follow Up",
                              style: normalLabelTextStyle(
                                  13, disabledTabTextColor,
                                  letterSpacing: -0.037),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        : Container(
            alignment: Alignment.centerRight,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (status == appointmentStatusBooked && isToday)
                  CircularTooltip(
                    message: "Mark as Arrived",
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        onStatusChange(appointmentStatusArrived);
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        alignment: Alignment.center,
                        child: ScripsIcons.instance.icon(ScripsIcons.check,
                            color: successTabColor, size: 22),
                      ),
                    ),
                  ),
                if (status == appointmentStatusBooked && isToday)
                  CircularTooltip(
                    message: "Mark as No Show",
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        onStatusChange(appointmentStatusNoShow);
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        alignment: Alignment.center,
                        child: ScripsIcons.instance.icon(ScripsIcons.noShow,
                            color: progressColor, size: 22),
                      ),
                    ),
                  ),
                if (status == appointmentStatusCheckedIn && isToday)
                  CircularTooltip(
                    message: "Mark as Complete",
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        onStatusChange(appointmentStatusFulfilled);
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        alignment: Alignment.center,
                        child: ScripsIcons.instance.icon(ScripsIcons.completed,
                            color: successTabColor, size: 22),
                      ),
                    ),
                  ),
                if (status == appointmentStatusArrived && isToday)
                  CircularTooltip(
                    message: "Mark as Checked In",
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        onStatusChange(appointmentStatusCheckedIn);
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        alignment: Alignment.center,
                        child: ScripsIcons.instance.icon(ScripsIcons.checked_in,
                            size: 22, color: successTabColor),
                      ),
                    ),
                  ),
                if ((status == appointmentStatusArrived ||
                    status == appointmentStatusCheckedIn) && isToday)
                  CircularTooltip(
                    message: status == appointmentStatusArrived
                        ? "Unmark as Arrived"
                        : "Unmark as Checked In",
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        onStatusChange(status == appointmentStatusArrived
                            ? appointmentStatusBooked
                            : appointmentStatusArrived);
                      },
                      child: Container(
                        width: 30,
                        height: 40,
                        alignment: Alignment.center,
                        child: ScripsIcons.instance.icon(
                            status == appointmentStatusArrived
                                ? ScripsIcons.unmark_as_arrived
                                : ScripsIcons.unmark_as_checked_in,
                            size: 22,
                            color: blueColor),
                      ),
                    ),
                  ),
                if (status == appointmentStatusBooked)
                  CircularTooltip(
                    message: "Reschedule Appointment",
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: onReschedule,
                      child: Container(
                        width: 30,
                        height: 40,
                        alignment: Alignment.center,
                        child: ScripsIcons.instance.icon(ScripsIcons.refresh,
                            size: 22, color: blueColor),
                      ),
                    ),
                  ),
                if (status != appointmentStatusCancelled &&
                    status != appointmentStatusNoShow &&
                    status != appointmentStatusFulfilled)
                  CircularTooltip(
                    message: "Cancel Appointment",
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: onCancel,
                      child: Container(
                        width: 30,
                        height: 40,
                        alignment: Alignment.center,
                        child: ScripsIcons.instance.icon(ScripsIcons.cancel,
                            color: flagsColor, size: 22),
                      ),
                    ),
                  ),
                if (status == appointmentStatusFulfilled)
                  CircularTooltip(
                    message: "Followup Appointment",
                    child: InkWell(
                      onTap: () {
                        onStatusChange(appointmentStatusFulfilled);
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 30,
                        height: 40,
                        alignment: Alignment.center,
                        child: ScripsIcons.instance.icon(
                            ScripsIcons.appointment,
                            color: blueColor,
                            size: 22),
                      ),
                    ),
                  ),
              ],
            ),
          );
  }
}
