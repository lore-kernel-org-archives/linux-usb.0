Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793725009;
	b=RKHVAGHEZso0DKG0CoREFNz2OiVAiVID+wIb6T8r97RZIPj1LueTiRdBa5vtOmP8DJk7
	 jMli7GhOjd9NhKy3ADaQoKs/gy344iPDwZgf95DzKFZHM2E6L/RhU8vO7OQooxmoPsQEN
	 DKdGw7CTpvrA1b6yBcr6FVhcAfRq89YkpgpEehOMB81RX0tZv6ezWg4vAx1uQJZN3Pyfc
	 Lxo8JasafqR+0onruS3gDRTFcKgT/AEjR9VfF3g4yVFZl37Y42Hrg5c9ddbKChBhb7o2b
	 o60VrUF3GYxpBB0u7KYSUB4If4T6pMryEwDrUa2kVmGPgIoDd67pwHH8xMod5ZP+yDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725009;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=aH7m/qqsvfLKgFNpeIbv3sCJMBcbsMdO2jJg3SfW0tM=;
	b=h3msMsRtRSqPvJwBkWrteX2dZdbSf0J/zJKgN8THINOnO6GTamxWLLuQBjjTdAD/wnDJ
	 hkvqe679ErM+rRIn9ErJ5/kwYdnEylHVFYVGAJQLUQ8d3IMDsl39ojPZZIBAx0xI8Ttkt
	 XnE3kwWMT7232IEYNuKMtH3mN11G5/tkhMZgZvnSzcBA1dav8GSfKttuTojMnYaZts3Od
	 L6JuJVNhQkVppbOdRSDTLNS/hggIlxnp2vN7nNJfyva70iFy6uHfJS2hlsIls/axUpDkz
	 wGaLr4QtN3xELrmGN2NMV2dBtUXj5UVE74AjmbPZFPENz8O43oFwAlVmiIbIFt+lLdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiscEbM1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E8F606A32C
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Tue,  3 Nov 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiscEbM1
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837D6513C0
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 16:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793725009; cv=none; b=k49NjVQvicPwR3R08XLIXlsbrnwWTLaX1sIjk3LJBqTQvzKAUpCp3KFQSki5R2ZM3ONWC2Vdm5chXD7GpzIC2ZJ5eJ7IV1MXk8za22BTddgGzV9MnIPRN5pg7oTIL+bqev1ZTbjBvnYHKv/TMtItC4XVzMKPhfQh72abL9qGDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793725009; c=relaxed/simple;
	bh=WUbVLw72GfV3hPuk7MeXzgepWzY8nqIOSBu5dhbk1Is=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Xrms84SP9PVTGFf+cPTbpIKVyLePsj+COzEwTUEC8GRAtHY0S7PHpf4x+ewHXOUNXyRXh+rixQr042IcV5vRP5npe6xT6QsIoh2aDLK+E2thDOkT+cYkzjDSGasararr8wLO7rrW2B9n8ymvCVRzIMBKhIm0LePtf2PTzvby8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiscEbM1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37FD9C2BCFC
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793725008;
	bh=WUbVLw72GfV3hPuk7MeXzgepWzY8nqIOSBu5dhbk1Is=;
	h=From:To:Subject:Date:From;
	b=kiscEbM1W5A8XAIGBagVdQGR/nvkvaDmyfW7RLUdQwXuyLB+MYzNxZrddE6N4MQZ2
	 b5Tz7UMwhkV7nzGgsPvDuyh0/l2RdOwoTA2aF+Ggqb35+focAzmiaiENwBo32NjWFg
	 4OHGhSXkeAb70ABOQk+98IaeyM2rY7ToGPYZGumCJO/xKK2//G1FWO2eECrz7RAckB
	 zzQsf9qWc/V7QXWx78pFP0UTh6W1ZqP2DRMloE/EZUL/oyAtZwtHiQnJlRWUoDK+Gf
	 B8Dew+1uop2MDyu83C9nPOriBYOXkktWKycw2QF9LYtm6kvlXGsre1Sb7eIfgDaNmP
	 couIOFD8armfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E0F7C433E1; Tue,  3 Nov 2026 16:56:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIyMzNdIE5ldzogSk9NQUEgS0I2MTYgKDA5M2Y6MjQ1?=
 =?UTF-8?B?NykgdHJhY2tiYWxsIG5vdCB3b3JraW5nIG92ZXIgMi40IEdIeiBkb25nbGUg?=
 =?UTF-8?B?4oCUIGhpZC1tdWx0aXRvdWNoIGNsYWltcyBkZXZpY2UgaW5jb3JyZWN0bHkg?=
 =?UTF-8?B?KEhJRF9ER19CVVRUT05UWVBFIG91dCBvZiByYW5nZSk=?=
Date: Tue, 03 Nov 2026 16:56:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: throwplastic@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222233-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222233

            Bug ID: 222233
           Summary: JOMAA KB616 (093f:2457) trackball not working over 2.4
                    GHz dongle =E2=80=94 hid-multitouch claims device incor=
rectly
                    (HID_DG_BUTTONTYPE out of range)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: throwplastic@pm.me
        Regression: No

The JOMAA KB616 keyboard+trackball (USB ID 093f:2457, product string "KB616
Dongle", vendor Olympia Telecom Vertriebs GmbH) fails to use the trackball =
when
connected via the included 2.4 GHz dongle on Linux.

Symptoms:
- Keyboard works
- Trackball, mouse buttons, and scroll do not work
- dmesg shows:
  hid-multitouch 0003:093F:2457.0007: HID_DG_BUTTONTYPE out of range

The same device works correctly over Bluetooth, over USB cable, and fully in
Windows.

Workaround that restores the trackball:
Blacklisting hid-multitouch (modprobe.blacklist=3Dhid-multitouch) so hid-ge=
neric
binds instead.

Kernel: 7.2.11-ogc4.1.fc44.x86_64
Distribution: Bazzite

Relevant dmesg:
[    4.870803] usb 5-1.3: New USB device found, idVendor=3D093f, idProduct=
=3D2457,
bcdDevice=3D 0.00
[    4.889207] usb 5-1.3: Product: KB616 Dongle
[    5.169607] hid-generic 0003:093F:2457.0004: input,hiddev98,hidraw3: USB=
 HID
v1.10 Keyboard [  KB616 Dongle] on usb-0000:09:00.3-1.3/input0
[    5.177253] hid-generic 0003:093F:2457.0007: input,hiddev99,hidraw4: USB=
 HID
v1.10 Mouse [  KB616 Dongle] on usb-0000:09:00.3-1.3/input1
[   10.964847] hid-multitouch 0003:093F:2457.0004: input,hiddev98,hidraw3: =
USB
HID v1.10 Keyboard [  KB616 Dongle] on usb-0000:09:00.3-1.3/input0
[   10.965791] hid-multitouch 0003:093F:2457.0007: HID_DG_BUTTONTYPE out of
range
[   10.966020] hid-multitouch 0003:093F:2457.0007: input,hiddev99,hidraw4: =
USB
HID v1.10 Mouse [  KB616 Dongle] on usb-0000:09:00.3-1.3/input1

lsusb -v summary:
Bus 005 Device 005: ID 093f:2457 Olympia Telecom Vertriebs GmbH KB616 Dongle
  idVendor           0x093f Olympia Telecom Vertriebs GmbH
  idProduct          0x2457 KB616 Dongle
  bNumInterfaces          3
  Interface 0: HID Boot Keyboard (report descriptor length 479)
  Interface 1: HID Boot Mouse (report descriptor length 567)
  Interface 2: HID (report descriptor length 38)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
