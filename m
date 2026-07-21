Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EFB47010E
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 18:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658651; cv=none; b=BEyxc6Cg0miYW/A0xywGm9wMCikGBXqqKQ9nslYcx8ODgMVw9PWCSjA/yKFnVpkB9nmLqSf4HAFsVdxtySlCmfrpPgExp6xQOLdaaIeKwXcvzrwSDCqpK/xD8JJBlU/9UXKD5G31HTXfdrI5D7c1FE8GUbMsZrwFUU4v+iEtRhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658651; c=relaxed/simple;
	bh=QceliOAszOzqS9NMofDtYfUhlLn1ig2t9PHzxnMUHco=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eCgqR+xp3410wMUlXGPi6QkdEwpDnLtnR5inotRgiyXFy1d3fWPlC3fF1rvoy6GRMz5aNZlccpNCqfggIrPNe/QiOBqt19uxekDaDupi6tZw6bxnC+mPmuzLVz0kxunnHI8kPfOuURJ1oXOGma3x65MKgWY47C7gOf+M4M6UtDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/uRqMbw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/uRqMbw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CBB4C2BCB8
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 18:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784658651;
	bh=QceliOAszOzqS9NMofDtYfUhlLn1ig2t9PHzxnMUHco=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O/uRqMbw9pu3RLh1OypabzxLLW0lCIoq8cfIkaKowshkDBGiHIWf7dOPpn2CTGVMp
	 hckN2Cstujqp4kgf5zAZ+PiPxmY2nJiEIUBTCD0KuxlrnJiveR4h5rX2Xw3jsTNeWj
	 6RqxA/L8H+fngSRLxQC94lYlJg0A98HzRegS02G3ZtksFSit73MesqU/hjM6URiEdX
	 +GmW8z+I46PFQxj/TGmHxfY45AAoEsaiHpOblnOGgfC+B751+BQvFs5Hi8k/5PDBAv
	 2DUpjJOgyKgqD2G88Xn3KmKSWt9P71i7u/st8SlbzG8zDKTMPWXrSJ/7nQ67EP5OGI
	 fwNoMs+wfPljA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 164C7C3279F; Tue, 21 Jul 2026 18:30:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221776] HP OmniBook X Flip - Broken UCSI firmware / Slow
 charging
Date: Tue, 21 Jul 2026 18:30:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221776-208809-vRhNVacAT4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221776-208809@https.bugzilla.kernel.org/>
References: <bug-221776-208809@https.bugzilla.kernel.org/>
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

--- Comment #1 from David Del Sol (daviddelsol1998@gmail.com) ---
From: David <david@david-desktop>
Date: Tue, 21 Jul 2026 11:30:00 -0500
Subject: [PATCH] usb: typec: ucsi: Skip UCSI on HP OmniBook X Flip (broken =
EC
firmware)

The HP OmniBook X Flip (Ryzen AI 5 340) has a non-compliant UCSI
firmware in the embedded controller.  The EC rejects all write/control
UCSI commands (SET_NOTIFICATION_ENABLE, PPM_RESET, etc.) while
accepting only read-only commands (GET_*). This causes the UCSI
subsystem to eventually corrupt the EC state, resulting in USB PD
negotiation falling back to 5V (only ~2W charging instead of 65W).

Add a DMI-based quirk to prevent the ucsi_acpi driver from binding
to this hardware.  Use NULL driver_data to signal "broken firmware,
skip UCSI entirely".

The user-visible symptom is that with a 65W USB-C PD charger, the
battery charges at 2W instead of 25-30W after the first UCSI command
exchange.  The workaround (removing this driver) has been verified
on multiple charge cycles.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3DXXXXX
Signed-off-by: David <david@david-desktop>
---
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c
b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 5b7d00907e39..c9bdeb110974 100644
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
