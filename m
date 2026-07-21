Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0418329CE9
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 18:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658444; cv=none; b=tvLTCHsL8EHMvCFPptaB4zWXZuDleHmXLdhyyYy58k1W2qUUnhH8ZXetkOAmavovgjzLYzGoAUoiTmFfKJbOtSl0mQF4eptoMOTKrAD/YQVzUJcJuRlbHC2BMXkWjCyNJvUZbN9JhMdPji434d0CXBb9eORO+XQdCm8lqXBVJmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658444; c=relaxed/simple;
	bh=US/bH4L3jJS/MQlnEuBy0Ymf0tFgP9oMc95ReTDJtV0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=N1JkMQ/8SfbS7EMNc760IK6RnXTVjnxZh8EXzDKm6ZzcyEkmQqmwz5QLRjnskXs9dyFmJEWgO2BD/OGINcsHKwvWqSfNcHaE9nHhBC3jWvEAFpnrwUijxjhZfk39gHLmT6qL+UvHoWBw4NGusZZHbmtnX/ge/e2J/XcStfTCCqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tO3bF62o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tO3bF62o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B08C4C2BCF7
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784658443;
	bh=US/bH4L3jJS/MQlnEuBy0Ymf0tFgP9oMc95ReTDJtV0=;
	h=From:To:Subject:Date:From;
	b=tO3bF62oHOGAiZchjgH0R7PAMSkNaOpwQJlCIQFm7Ecj5+QWPz04YnDLMIjSdiS8I
	 BLg/QqN619CqLcTi2ZBR9tHWZkFcPexkKRAOMV8/3V4o/5Z/AxqYtT0NWr87eITvXt
	 t4zIpdmygsSHJ1frJNlcqfCDCcbR11Slh0tK2qwMQfOqPr18g90Oss7AF7X58F7lg7
	 IMBpv+ARaRJFBfZo4zg/FWtz1kr1RxDdz3GNYaumxxeKskrQIFLS5cqtjXs+T/0qoK
	 PU9ozSv5umVt1l0awVcX0ESnfoR9ESmUqvLuL/yeZWT1DOgbje+fmX4QAIYIz48+6V
	 vNiqrM6Eqsg/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CFB5C3279F; Tue, 21 Jul 2026 18:27:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221776] New: HP OmniBook X Flip - Broken UCSI firmware / Slow
 charging
Date: Tue, 21 Jul 2026 18:27:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daviddelsol1998@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221776-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221776

            Bug ID: 221776
           Summary: HP OmniBook X Flip - Broken UCSI firmware / Slow
                    charging
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: daviddelsol1998@gmail.com
        Regression: No

The HP OmniBook X Flip has a non-compliant UCSI firmware in its
Embedded Controller. The EC accepts only read-only UCSI commands
(GET_VERSION, GET_CONNECTOR_STATUS) but rejects all control/write
commands (SET_NOTIFICATION_ENABLE, PPM_RESET, CONNECTOR_RESET,
and any _DSM WRITE function calls).

When the ucsi_acpi driver loads and attempts to use UCSI for
USB PD negotiation, the EC state eventually becomes corrupted.
This causes USB PD to drop from 20V (65W) to 5V (~2W to battery),
severely limiting charging speed.

The corruption persists across reboots and even warm reboots.
Only a full EC reset (shutdown + unplug + 30s power drain + replug)
restores normal PD negotiation.

WORKAROUND:
Blacklist ucsi_acpi (module_blacklist=3Ducsi_acpi on kernel cmdline).
Without UCSI, Linux doesn't talk to the broken EC firmware, the
charger negotiates PD directly, and charging works at 25-30W
(expected "normal speed" with system running).

REPRODUCE:
1. Boot with ucsi_acpi loaded (default)
2. Plug in the 65W USB-C PD charger
3. Wait 30-60 seconds
4. Observe charging current drop from ~25W to ~2W via
/sys/class/power_supply/BAT0/power_now
5. After that, pd voltage locked at 5V (visible via
/sys/class/typec/port0/pd_data)

ROOT CAUSE:
The EC UCSI firmware at ACPI path PNP0CA0 implements the _DSM
(UCSI DSM UUID: 6f8398c2-7ca4-11e4-ad36-631042b5008f) but returns
error for function 1 (WRITE). The ucsi_acpi driver's
ucsi_acpi_async_control() calls _DSM WRITE to send UCSI commands
to the EC mailbox, but these writes either fail or silently corrupt
the EC's internal state.

DIAGNOSTIC EVIDENCE:
  - acpi_call test: _DSM function 1 (WRITE) fails with error
  - UCSI debugfs GET_CONNECTOR_STATUS succeeds
  - UCSI debugfs PPM_RESET/CONNECTOR_RESET returns EOPNOTSUPP
  - After ucsi_acpi loads, /sys/class/typec/port0/power_role shows
    "sink" even though charger is capable of sourcing
  - After corruption, /sys/kernel/debug/usb/ucsi/*/status shows
    PD contract at 5V/3A instead of 20V/3.25A
  - Blacklisting ucsi_acpi + EC reset restores proper PD negotiation

PROPOSED FIX:
Add DMI quirk to ucsi_acpi.c to skip the driver on this hardware:

--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -79,6 +79,17 @@ static const struct dmi_system_id ucsi_acpi_quirks[] =3D=
 {
                        DMI_MATCH(DMI_PRODUCT_NAME, "90Q"),
                },
                .driver_data =3D (void *)&ucsi_gram_ops,
+       },
+       {
+               /*
+                * HP OmniBook X Flip has broken UCSI firmware that rejects=
 all
+                * control commands (SET_NOTIFICATION_ENABLE, PPM_RESET, et=
c.).
+                * Skip UCSI to avoid corrupting EC state and losing PD
negotiation.
+                */
+               .matches =3D {
+                       DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+                       DMI_MATCH(DMI_PRODUCT_NAME, "HP OmniBook X Flip Lap=
top
16-ar0xxx"),
+               },
        },
        { }
 };
@@ -213,6 +224,11 @@ static int ucsi_acpi_probe(struct platform_device *pde=
v)
        ua->dev =3D &pdev->dev;

        id =3D dmi_first_match(ucsi_acpi_quirks);
+       if (id && !id->driver_data) {
+               dev_info(&pdev->dev, "broken UCSI firmware, skipping
driver\n");
+               return -ENODEV;
+       }
        if (id)
                ops =3D id->driver_data;

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
