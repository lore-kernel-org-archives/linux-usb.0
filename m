Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9713318ED6
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 20:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071227; cv=none; b=lLBHYSKKF9S42llg2AvLE0ikCwxGs0ASTGoU/S4anQ3owjuP9mh0BfYjZ2Gz8dNYlvUDLB9/A9c84GaXFRgMe4oA81nKNKwH2Db6O7o2y7JnofdRT7wAI9dw1EVL6CCHIUU+pafpfSfSyuA8MuSZVfzDu1TMganFSEghcneffVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071227; c=relaxed/simple;
	bh=YOwnbS4gf0Ial/RAG2NfeR82cPreyMrMebUYkSaOHHo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GK2f2m6H5rWdJ7lm/YxEmO7dl4ArLe2vll2j95MczV8P9KRTEKLfibet/+dEE6eWpkCU7RVjjg+6UClzEyuI245MnXDFKyHFzRhmWx6ip6Y2gxWhHS5lquuIl5CvshU9kctHqkaNRXx5Ds44i8eHQhKNOJClWSXtJP+CEERsdQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCl7xChD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCl7xChD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77284C2BCC7
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 20:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789071226;
	bh=YOwnbS4gf0Ial/RAG2NfeR82cPreyMrMebUYkSaOHHo=;
	h=From:To:Subject:Date:From;
	b=FCl7xChDp1LUjhCKRl4dCm75Ky0WIgMaBg/BBOO3faILtfJVMEBfYrFnmpElBueLK
	 rQNvF9+SJ7L2DAzi8mWPytcjgiC8U1x3kV7VW1z4/z+fJL/GzytEK3xasG038nPuDy
	 0andVeN5dstjpkyZHhBJZOWaPgkPS/1E190N/1sn3OnMENBJ1GWgXT6i5gsovVjtDu
	 6Ute0xpfjrySRilV5FMF1f4oGp8he6eNq2JTTnPLsJcRCm5RvlEuVvBeRJFETnSB0E
	 kwFpfJHrXL6wf6zeVA/f98Ky3SkbDSHVne2Tu19twe7u+OTU1eRPVnvADeN6mpNwwY
	 hveqb/+bw7CEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C88CC4160E; Thu, 10 Sep 2026 20:13:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221998] New: HID: playstation: GameSir G7 Pro 8K (054C:09CC)
 reports incorrect battery level (fixed at 5%)
Date: Thu, 10 Sep 2026 20:13:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eivaam@icloud.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-221998-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221998

            Bug ID: 221998
           Summary: HID: playstation: GameSir G7 Pro 8K (054C:09CC)
                    reports incorrect battery level (fixed at 5%)
           Product: Drivers
           Version: 2.5
    Kernel Version: 7.2.3-1-cachyos
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: eivaam@icloud.com
        Regression: No

The GameSir G7 Pro 8K controller, when connected via USB in DS4 mode,
is correctly detected and registered by the hid-playstation driver as a
DualShock 4 controller (USB ID 054C:09CC). The driver creates the battery
power_supply device as expected, but the reported battery capacity is
always fixed at 5% with status "Discharging", regardless of the actual
battery level.

The controller firmware is fully updated (verified via the official
GameSir iOS app, which reports 100% battery). The issue is therefore not
a firmware problem, but a parsing issue in the hid-playstation driver
when handling the battery report from this third-party controller.

Kernel version:
7.2.3-1-cachyos

Distribution:
CachyOS

Hardware:
GameSir G7 Pro 8K
- USB ID: 054C:09CC (emulated DualShock 4)
- Connection: USB cable
- Mode: DS4 (white LED)
- Firmware: latest available, updated via GameSir iOS app

Driver:
hid-playstation

Steps to reproduce:
1. Connect the GameSir G7 Pro 8K via USB in DS4 mode.
2. Wait for the device to be registered by the kernel.
3. Run:
   cat /sys/class/power_supply/ps-controller-battery-*/capacity
4. Observe that the output is always "5".
5. Run:
   cat /sys/class/power_supply/ps-controller-battery-*/status
6. Observe that the output is "Discharging" even when the controller is
   fully charged.

Expected behavior:
The reported battery capacity should reflect the actual battery level of
the controller (e.g. 100% when fully charged), and the status should
change to "Charging" or "Full" when connected to a power source.

Actual behavior:
The battery capacity is permanently fixed at 5% and the status remains
"Discharging", regardless of the real battery level or charging state.

relevant output
=E2=9D=AF sudo dmesg | grep -i "playstation\|hid"
[sudo] contrase=C3=B1a para erikalmeida:=20
[15237.258389] playstation 0003:054C:09CC.0007: hidraw4: USB HID v1.11 Game=
pad
[Guangzhou Chicken Run Network Technology Co., Ltd. Wireless Controller] on
usb-0000:00:14.0-9/input0
[15237.311809] playstation 0003:054C:09CC.0007: Registered DualShock4
controller hw_version=3D0x0000b404 fw_version=3D0x0000a007
[15773.043305] usbhid 1-9:1.0: can't add hid device: -71
[15773.043407] usbhid 1-9:1.0: probe with driver usbhid failed with error -=
71
[15773.843537] playstation 0003:054C:09CC.0008: hidraw4: USB HID v1.11 Game=
pad
[Guangzhou Chicken Run Network Technology Co., Ltd. Wireless Controller] on
usb-0000:00:14.0-9/input0
[15773.895474] playstation 0003:054C:09CC.0008: Registered DualShock4
controller hw_version=3D0x0000b404 fw_version=3D0x0000a007
[19003.858872] playstation 0003:054C:09CC.0009: hidraw4: USB HID v1.11 Game=
pad
[Guangzhou Chicken Run Network Technology Co., Ltd. Wireless Controller] on
usb-0000:00:14.0-9/input0
[19003.911048] playstation 0003:054C:09CC.0009: Registered DualShock4
controller hw_version=3D0x0000b404 fw_version=3D0x0000a007
[19083.872676] usbhid 1-9:1.0: can't add hid device: -71
[19083.872759] usbhid 1-9:1.0: probe with driver usbhid failed with error -=
71
[19084.678027] playstation 0003:054C:09CC.000A: hidraw4: USB HID v1.11 Game=
pad
[Guangzhou Chicken Run Network Technology Co., Ltd. Wireless Controller] on
usb-0000:00:14.0-9/input0
[19084.731026] playstation 0003:054C:09CC.000A: Registered DualShock4
controller hw_version=3D0x0000b404 fw_version=3D0x0000a007
[21590.994275] usbhid 1-9:1.0: can't add hid device: -71
[21590.994362] usbhid 1-9:1.0: probe with driver usbhid failed with error -=
71
[21591.797421] playstation 0003:054C:09CC.000B: hidraw4: USB HID v1.11 Game=
pad
[Guangzhou Chicken Run Network Technology Co., Ltd. Wireless Controller] on
usb-0000:00:14.0-9/input0
[21591.849420] playstation 0003:054C:09CC.000B: Registered DualShock4
controller hw_version=3D0x0000b404 fw_version=3D0x0000a007
[21679.400804] playstation 0003:054C:09CC.000C: hidraw4: USB HID v1.11 Game=
pad
[Guangzhou Chicken Run Network Technology Co., Ltd. Wireless Controller] on
usb-0000:00:14.0-9/input0
[21679.454396] playstation 0003:054C:09CC.000C: Registered DualShock4
controller hw_version=3D0x0000b404 fw_version=3D0x0000a007
[21685.581701] playstation 0003:054C:09CC.000D: hidraw4: USB HID v1.11 Game=
pad
[Guangzhou Chicken Run Network Technology Co., Ltd. Wireless Controller] on
usb-0000:00:14.0-9/input0
[21685.634998] playstation 0003:054C:09CC.000D: Registered DualShock4
controller hw_version=3D0x0000b404 fw_version=3D0x0000a007
=E2=9D=AF cat /sys/class/power_supply/ps-controller-battery-*/capacity
5
=E2=9D=AF cat /sys/class/power_supply/ps-controller-battery-*/status
Discharging
=E2=9D=AF ls /sys/class/power_supply/ | grep -i ps
ps-controller-battery-8c:41:f2:0c:05:f0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
