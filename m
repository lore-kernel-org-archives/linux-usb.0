Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFD4337BA4
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 02:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784601453; cv=none; b=o/UvnqN9TOajHlQEmzwuD10X1Z0XRVybxA2NK3zd0uE0sIDM/c/sk6pdZBJJeu1AZdjZJ0TJ3FGtYDNCx0ea1hGaSP1tWSvfOn2FppgLYV6dyOhQyBMzU/RxCTII9/hsNhK4JD3Bd7rhHi6BoL9kmnzmI62pvF47oSFEPmceKFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784601453; c=relaxed/simple;
	bh=YPHIRcZFVd1ZTbWy0aEMivVzLYxDadsIeBzvmAwz7ZQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JB020yMEwRXBeA09jF+Ozgx9Wr2eKXHv2+9mYrNSK3NUcuBYE++lC4d9IwZHGTTBOBljh6Qr8QC/ly2cw1XDJZhLxGs2OeLK6ryzKerHuliNNUzkBbsfyhm17M7zP1PRJeosO+H3qGcrfUuiyOb+epnd4osU8rhmnnNLVH5tADM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lf4oSKvy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lf4oSKvy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ACCCC2BCB8
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 02:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784601453;
	bh=YPHIRcZFVd1ZTbWy0aEMivVzLYxDadsIeBzvmAwz7ZQ=;
	h=From:To:Subject:Date:From;
	b=lf4oSKvyDjZvZvK19vdX56AsXtJHmTa9XmYu1j+9svkWMbhS55t9Au9txEzeTG2Qs
	 oDl/7pXu0GuMBt4kvQ5Zdh9XMUNdKYS4p5HkaeVNIbhXRwIESls8bbHgVpgcoKKKbB
	 vl1ViBdSudCmlvTvn1Y/J4JsAtjHTREGN9EgEEl4V0T1sEW2HkPEid6WWAHQrw45HE
	 /UPlFWWQ+X9QAyEpY3FY1fg0g7tzrUzyWTsrw6r+RsL0vUfbmyvR0+OBaOlDe2Nwyv
	 77sCH9yN5A/tp49EKXvhkhhnhzgOKSMnWLOyqtFnkAxkuZNYz+svxq6Vn6UAvEICPr
	 P6cFTzKapyWDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DA220C433E1; Tue, 21 Jul 2026 02:37:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] New: hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Tue, 21 Jul 2026 02:37:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mayhemandcoffee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

            Bug ID: 221774
           Summary: hid-multitouch: report ID mismatch check breaks
                    touchpad palm detection on ASUS ROG Flow Z13 (2025)
                    GZ302EA (0b05:1a30)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mayhemandcoffee@gmail.com
        Regression: No

Created attachment 310482
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310482&action=3Dedit
touch registers while typing

Component: Drivers / Input Devices (or USB, whichever's closest)

Kernel Version: 7.1.4-arch1-1 (regression); confirmed working on 6.18.39-1-=
lts

Description:

On the ASUS ROG Flow Z13 (2025), model GZ302EA, the detachable keyboard cov=
er's
touchpad (USB 0b05:1a30) loses its onboard palm-detection capability on ker=
nels
containing commit e716edafedad4952fe3a4a273d2e039a84e8681a ("HID: multitouc=
h:
Check to ensure report responses match the request").

dmesg shows:

hid-multitouch 0003:0B05:1A30.0004: Returned feature report did not match t=
he
request

Effect: the touchpad falls back to a legacy single-touch-style report =E2=
=80=94 missing
ABS_MT_SLOT, ABS_MT_TOOL_TYPE, and multi-finger BTN_TOOL_* capabilities =E2=
=80=94
instead of the full Precision Touchpad protocol. This means palm rejection
stops working entirely in userspace (libinput has no tool-type/slot data to
reject a palm contact with).

Working baseline: on linux-lts 6.18.39 (predates the commit), evtest on the
touchpad node shows the full protocol, including ABS_MT_TOOL_TYPE correctly
reporting value 2 (MT_TOOL_PALM) when a palm contact is detected, and 0
(MT_TOOL_FINGER) for normal touches.

Suspected root cause: in mt_feature_mapping(), the vendor-specific usage
0xff0000c5 triggers a mt_get_feature() call described in the driver source =
as
"Retrieve the Win8 blob once to enable some devices." This device's firmware
appears to respond to that specific GET_FEATURE request with a mismatched
report ID, causing the new check to goto free and abort before the device g=
ets
switched into its full-capability reporting mode.

Steps to reproduce:

Boot a kernel containing commit e716edafedad4952fe3a4a273d2e039a84e8681a
sudo evtest on the touchpad's /dev/input/eventN node
Observe missing ABS_MT_SLOT / ABS_MT_TOOL_TYPE in the capabilities list, and
dmesg | grep hid-multitouch showing the mismatch error

Requested fix: a vendor/product-ID based quirk in hid-multitouch.c (similar=
 to
the existing MT_CLS_ASUS handling) to bypass or tolerate the report-ID mism=
atch
for 0b05:1a30, restoring the device to full-capability mode.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
