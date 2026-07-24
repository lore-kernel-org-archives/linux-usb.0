Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71D3644B3
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898886; cv=none; b=uz6nuXZgJC/XBW2lzHPH7Ltg68ErIjm5VNa9XP0dpbBwShTfU0bEbTFHV9fYeN0d/u4WTMbEWyyS1G3hjMIOnJV9O4KlR2QixAG5cRVbyG4u5tzG3Skb7+NzXyftKyG8XRCp9Mz3kVCL//IrEF/QBDsJVvWXPj6JuPB5OFroMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898886; c=relaxed/simple;
	bh=DK90GbrduA3Tsg4qcRgEmH7+KpRW6bE/QKZpE7WTUCk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MW3xt5x9jEj9iAo96ww6QCc3QDEikVgJt+Yw6EJBQmiWODHUds2E43ZYu08EFRo2xtfWJxqgGZzKF2eafOWoj9YTQ2X98GdgunKxCfGJgUkp4Q9hI+TOZPPUubpIqMwI7zk5FqiEtvI/KvDexTaD4xr9Y2Sc2ysASy/ZaugUzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtcCZiiD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtcCZiiD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C9C0C2BCB3
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784898886;
	bh=DK90GbrduA3Tsg4qcRgEmH7+KpRW6bE/QKZpE7WTUCk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TtcCZiiDb28UTbj9JNcFshIaR4k/48F8DVP9Q3eB6dPlERTGeJUGfbyqF4i0AIDpE
	 l4VboDmKN4LMRmHzvkz6J6tUkvaDilK2yC7NL84NSxHQQqyUhGQlBo+De8MwJ1SXVm
	 NmcQIFcOd0wFqkDU1g8ew8GJ1KDP+EZZk8uu1gRU8V7fQWal/xrYyn5oAMKSOsUS/7
	 8830sosspMm3kzQ3kAiAH9E+kM6Mp6AGxzgQ0QUpd7ua4z03No6wpmgRkrjIK+gtZA
	 GHEs/y13xiZkH6TA+wixBW3Gk9w0u7Xgo0NQ3B8gEo9jLhZygfxaV2DnEi5yDyorzc
	 iIn4o3CYqvtdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EEC69C433E1; Fri, 24 Jul 2026 13:14:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Fri, 24 Jul 2026 13:14:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-a7LmhOve8j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

--- Comment #7 from mayhemandcoffee@gmail.com ---
Thanks for the follow-up.

I tested on the patched 7.1.4 kernel.

1. dmesg

The message

Returned feature report did not match the request

is no longer present.

The only hid-multitouch messages are:

hid-multitouch 0003:0B05:1A30.0004: input,hiddev98,hidraw3: USB HID v1.10 M=
ouse
[ASUSTeK Computer Inc. GZ302EA-Keyboard]
hid-multitouch 0018:04F3:43C7.0008: input,hidraw2: I2C HID v1.00 Device
[ELAN9008:00 04F3:43C7]

2. evtest

The touchpad now reports:

ABS_X
ABS_Y
ABS_MT_SLOT
ABS_MT_POSITION_X
ABS_MT_POSITION_Y
ABS_MT_TRACKING_ID

but ABS_MT_TOOL_TYPE is still missing.

The device is still reported by libinput as:

Capabilities: pointer gesture
Disable-w-typing: n/a

so there is no observable behavioral change despite the report ID mismatch
warning disappearing.

Console output:
thienan@thienan-pc ~]$ sudo dmesg | grep hid-multitouch
[    5.276536] hid-multitouch 0003:0B05:1A30.0004: input,hiddev98,hidraw3: =
USB
HID v1.10 Mouse [ASUSTeK Computer Inc. GZ302EA-Keyboard] on
usb-0000:c6:00.0-4/input3
[    5.663645] hid-multitouch 0018:04F3:43C7.0008: input,hidraw2: I2C HID v=
1.00
Device [ELAN9008:00 04F3:43C7] on i2c-ELAN9008:00
[thienan@thienan-pc ~]$ grep -A5 "GZ302EA-Keyboard Touchpad"
/proc/bus/input/devices
N: Name=3D"ASUSTeK Computer Inc. GZ302EA-Keyboard Touchpad"
P: Phys=3Dusb-0000:c6:00.0-4/input3
S:
Sysfs=3D/devices/pci0000:00/0000:00:08.3/0000:c6:00.0/usb3/3-4/3-4:1.3/0003=
:0B05:1A30.0004/input/input17
U: Uniq=3D
H: Handlers=3Devent4 mouse0=20
B: PROP=3D5
[thienan@thienan-pc ~]$ systemctl --user stop unpalm.service
[thienan@thienan-pc ~]$ grep -A5 "GZ302EA-Keyboard Touchpad"
/proc/bus/input/devices
N: Name=3D"ASUSTeK Computer Inc. GZ302EA-Keyboard Touchpad"
P: Phys=3Dusb-0000:c6:00.0-4/input3
S:
Sysfs=3D/devices/pci0000:00/0000:00:08.3/0000:c6:00.0/usb3/3-4/3-4:1.3/0003=
:0B05:1A30.0004/input/input17
U: Uniq=3D
H: Handlers=3Devent4 mouse0=20
B: PROP=3D5
[thienan@thienan-pc ~]$ sudo evtest /dev/input/event4
Input driver version is 1.0.1
Input device ID: bus 0x3 vendor 0xb05 product 0x1a30 version 0x110
Input device name: "ASUSTeK Computer Inc. GZ302EA-Keyboard Touchpad"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 272 (BTN_LEFT)
    Event code 325 (BTN_TOOL_FINGER)
    Event code 328 (BTN_TOOL_QUINTTAP)
    Event code 330 (BTN_TOUCH)
    Event code 333 (BTN_TOOL_DOUBLETAP)
    Event code 334 (BTN_TOOL_TRIPLETAP)
    Event code 335 (BTN_TOOL_QUADTAP)
  Event type 3 (EV_ABS)
    Event code 0 (ABS_X)
      Value   2476
      Min        0
      Max     3929
      Resolution      31
    Event code 1 (ABS_Y)
      Value   1521
      Min        0
      Max     2181
      Resolution      31
    Event code 47 (ABS_MT_SLOT)
      Value      0
      Min        0
      Max        4
    Event code 53 (ABS_MT_POSITION_X)
      Value      0
      Min        0
      Max     3929
      Resolution      31
    Event code 54 (ABS_MT_POSITION_Y)
      Value      0
      Min        0
      Max     2181
      Resolution      31
    Event code 57 (ABS_MT_TRACKING_ID)
      Value      0
      Min        0
      Max    65535
  Event type 4 (EV_MSC)
    Event code 5 (MSC_TIMESTAMP)
Key repeat handling:
  Repeat type 20 (EV_REP)
    Repeat code 0 (REP_DELAY)
      Value    250
    Repeat code 1 (REP_PERIOD)
      Value     33
Properties:
  Property type 0 (INPUT_PROP_POINTER)
  Property type 2 (INPUT_PROP_BUTTONPAD)
Testing ... (interrupt to exit)
Event: time 1784898618.583921, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID=
),
value 262
Event: time 1784898618.583921, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2931
Event: time 1784898618.583921, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1176
Event: time 1784898618.583921, type 1 (EV_KEY), code 330 (BTN_TOUCH), value=
 1
Event: time 1784898618.583921, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER),
value 1
Event: time 1784898618.583921, type 3 (EV_ABS), code 0 (ABS_X), value 2931
Event: time 1784898618.583921, type 3 (EV_ABS), code 1 (ABS_Y), value 1176
Event: time 1784898618.583921, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue 0
Event: time 1784898618.583921, -------------- SYN_REPORT ------------
Event: time 1784898618.587891, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
4100
Event: time 1784898618.587891, -------------- SYN_REPORT ------------
Event: time 1784898618.591986, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
8200
Event: time 1784898618.591986, -------------- SYN_REPORT ------------
Event: time 1784898618.594900, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
12300
Event: time 1784898618.594900, -------------- SYN_REPORT ------------
Event: time 1784898618.600914, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2930
Event: time 1784898618.600914, type 3 (EV_ABS), code 0 (ABS_X), value 2930
Event: time 1784898618.600914, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
16400
Event: time 1784898618.600914, -------------- SYN_REPORT ------------
Event: time 1784898618.603987, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2929
Event: time 1784898618.603987, type 3 (EV_ABS), code 0 (ABS_X), value 2929
Event: time 1784898618.603987, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
20500
Event: time 1784898618.603987, -------------- SYN_REPORT ------------
Event: time 1784898618.607918, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2928
Event: time 1784898618.607918, type 3 (EV_ABS), code 0 (ABS_X), value 2928
Event: time 1784898618.607918, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
24600
Event: time 1784898618.607918, -------------- SYN_REPORT ------------
Event: time 1784898618.611896, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
28700
Event: time 1784898618.611896, -------------- SYN_REPORT ------------
Event: time 1784898618.616894, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2927
Event: time 1784898618.616894, type 3 (EV_ABS), code 0 (ABS_X), value 2927
Event: time 1784898618.616894, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
32800
Event: time 1784898618.616894, -------------- SYN_REPORT ------------
Event: time 1784898618.621000, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2926
Event: time 1784898618.621000, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1175
Event: time 1784898618.621000, type 3 (EV_ABS), code 0 (ABS_X), value 2926
Event: time 1784898618.621000, type 3 (EV_ABS), code 1 (ABS_Y), value 1175
Event: time 1784898618.621000, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
36900
Event: time 1784898618.621000, -------------- SYN_REPORT ------------
Event: time 1784898618.624898, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
41000
Event: time 1784898618.624898, -------------- SYN_REPORT ------------
Event: time 1784898618.628895, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2925
Event: time 1784898618.628895, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1174
Event: time 1784898618.628895, type 3 (EV_ABS), code 0 (ABS_X), value 2925
Event: time 1784898618.628895, type 3 (EV_ABS), code 1 (ABS_Y), value 1174
Event: time 1784898618.628895, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
45100
Event: time 1784898618.628895, -------------- SYN_REPORT ------------
Event: time 1784898618.632895, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
49200
Event: time 1784898618.632895, -------------- SYN_REPORT ------------
Event: time 1784898618.636971, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2924
Event: time 1784898618.636971, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1173
Event: time 1784898618.636971, type 3 (EV_ABS), code 0 (ABS_X), value 2924
Event: time 1784898618.636971, type 3 (EV_ABS), code 1 (ABS_Y), value 1173
Event: time 1784898618.636971, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
53300
Event: time 1784898618.636971, -------------- SYN_REPORT ------------
Event: time 1784898618.640906, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1172
Event: time 1784898618.640906, type 3 (EV_ABS), code 1 (ABS_Y), value 1172
Event: time 1784898618.640906, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
57400
Event: time 1784898618.640906, -------------- SYN_REPORT ------------
Event: time 1784898618.644896, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1169
Event: time 1784898618.644896, type 3 (EV_ABS), code 1 (ABS_Y), value 1169
Event: time 1784898618.644896, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
61500
Event: time 1784898618.644896, -------------- SYN_REPORT ------------
Event: time 1784898618.648891, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2925
Event: time 1784898618.648891, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1165
Event: time 1784898618.648891, type 3 (EV_ABS), code 0 (ABS_X), value 2925
Event: time 1784898618.648891, type 3 (EV_ABS), code 1 (ABS_Y), value 1165
Event: time 1784898618.648891, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
65600
Event: time 1784898618.648891, -------------- SYN_REPORT ------------
Event: time 1784898618.652902, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2929
Event: time 1784898618.652902, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1158
Event: time 1784898618.652902, type 3 (EV_ABS), code 0 (ABS_X), value 2929
Event: time 1784898618.652902, type 3 (EV_ABS), code 1 (ABS_Y), value 1158
Event: time 1784898618.652902, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
69700
Event: time 1784898618.652902, -------------- SYN_REPORT ------------
Event: time 1784898618.656904, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2934
Event: time 1784898618.656904, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1148
Event: time 1784898618.656904, type 3 (EV_ABS), code 0 (ABS_X), value 2934
Event: time 1784898618.656904, type 3 (EV_ABS), code 1 (ABS_Y), value 1148
Event: time 1784898618.656904, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
73800
Event: time 1784898618.656904, -------------- SYN_REPORT ------------
Event: time 1784898618.661896, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2947
Event: time 1784898618.661896, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1129
Event: time 1784898618.661896, type 3 (EV_ABS), code 0 (ABS_X), value 2947
Event: time 1784898618.661896, type 3 (EV_ABS), code 1 (ABS_Y), value 1129
Event: time 1784898618.661896, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
77900
Event: time 1784898618.661896, -------------- SYN_REPORT ------------
Event: time 1784898618.665897, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2962
Event: time 1784898618.665897, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1106
Event: time 1784898618.665897, type 3 (EV_ABS), code 0 (ABS_X), value 2962
Event: time 1784898618.665897, type 3 (EV_ABS), code 1 (ABS_Y), value 1106
Event: time 1784898618.665897, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
82000
Event: time 1784898618.665897, -------------- SYN_REPORT ------------
Event: time 1784898618.669900, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2980
Event: time 1784898618.669900, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1081
Event: time 1784898618.669900, type 3 (EV_ABS), code 0 (ABS_X), value 2980
Event: time 1784898618.669900, type 3 (EV_ABS), code 1 (ABS_Y), value 1081
Event: time 1784898618.669900, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
86100
Event: time 1784898618.669900, -------------- SYN_REPORT ------------
Event: time 1784898618.672897, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2995
Event: time 1784898618.672897, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1058
Event: time 1784898618.672897, type 3 (EV_ABS), code 0 (ABS_X), value 2995
Event: time 1784898618.672897, type 3 (EV_ABS), code 1 (ABS_Y), value 1058
Event: time 1784898618.672897, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
90200
Event: time 1784898618.672897, -------------- SYN_REPORT ------------
Event: time 1784898618.676897, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3008
Event: time 1784898618.676897, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1039
Event: time 1784898618.676897, type 3 (EV_ABS), code 0 (ABS_X), value 3008
Event: time 1784898618.676897, type 3 (EV_ABS), code 1 (ABS_Y), value 1039
Event: time 1784898618.676897, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
94300
Event: time 1784898618.676897, -------------- SYN_REPORT ------------
Event: time 1784898618.681902, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3017
Event: time 1784898618.681902, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1026
Event: time 1784898618.681902, type 3 (EV_ABS), code 0 (ABS_X), value 3017
Event: time 1784898618.681902, type 3 (EV_ABS), code 1 (ABS_Y), value 1026
Event: time 1784898618.681902, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
98400
Event: time 1784898618.681902, -------------- SYN_REPORT ------------
Event: time 1784898618.685908, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3023
Event: time 1784898618.685908, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1018
Event: time 1784898618.685908, type 3 (EV_ABS), code 0 (ABS_X), value 3023
Event: time 1784898618.685908, type 3 (EV_ABS), code 1 (ABS_Y), value 1018
Event: time 1784898618.685908, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
102500
Event: time 1784898618.685908, -------------- SYN_REPORT ------------
Event: time 1784898618.689905, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3027
Event: time 1784898618.689905, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1013
Event: time 1784898618.689905, type 3 (EV_ABS), code 0 (ABS_X), value 3027
Event: time 1784898618.689905, type 3 (EV_ABS), code 1 (ABS_Y), value 1013
Event: time 1784898618.689905, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
106600
Event: time 1784898618.689905, -------------- SYN_REPORT ------------
Event: time 1784898618.693890, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3029
Event: time 1784898618.693890, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1009
Event: time 1784898618.693890, type 3 (EV_ABS), code 0 (ABS_X), value 3029
Event: time 1784898618.693890, type 3 (EV_ABS), code 1 (ABS_Y), value 1009
Event: time 1784898618.693890, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
110700
Event: time 1784898618.693890, -------------- SYN_REPORT ------------
Event: time 1784898618.697903, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3031
Event: time 1784898618.697903, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1005
Event: time 1784898618.697903, type 3 (EV_ABS), code 0 (ABS_X), value 3031
Event: time 1784898618.697903, type 3 (EV_ABS), code 1 (ABS_Y), value 1005
Event: time 1784898618.697903, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
114800
Event: time 1784898618.697903, -------------- SYN_REPORT ------------
Event: time 1784898618.702908, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3033
Event: time 1784898618.702908, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1002
Event: time 1784898618.702908, type 3 (EV_ABS), code 0 (ABS_X), value 3033
Event: time 1784898618.702908, type 3 (EV_ABS), code 1 (ABS_Y), value 1002
Event: time 1784898618.702908, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
118900
Event: time 1784898618.702908, -------------- SYN_REPORT ------------
Event: time 1784898618.706909, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3034
Event: time 1784898618.706909, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1001
Event: time 1784898618.706909, type 3 (EV_ABS), code 0 (ABS_X), value 3034
Event: time 1784898618.706909, type 3 (EV_ABS), code 1 (ABS_Y), value 1001
Event: time 1784898618.706909, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
123000
Event: time 1784898618.706909, -------------- SYN_REPORT ------------
Event: time 1784898618.710900, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3035
Event: time 1784898618.710900, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1000
Event: time 1784898618.710900, type 3 (EV_ABS), code 0 (ABS_X), value 3035
Event: time 1784898618.710900, type 3 (EV_ABS), code 1 (ABS_Y), value 1000
Event: time 1784898618.710900, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
127100
Event: time 1784898618.710900, -------------- SYN_REPORT ------------
Event: time 1784898618.714903, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3037
Event: time 1784898618.714903, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 999
Event: time 1784898618.714903, type 3 (EV_ABS), code 0 (ABS_X), value 3037
Event: time 1784898618.714903, type 3 (EV_ABS), code 1 (ABS_Y), value 999
Event: time 1784898618.714903, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
131200
Event: time 1784898618.714903, -------------- SYN_REPORT ------------
Event: time 1784898618.717904, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
135300
Event: time 1784898618.717904, -------------- SYN_REPORT ------------
Event: time 1784898618.721900, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 998
Event: time 1784898618.721900, type 3 (EV_ABS), code 1 (ABS_Y), value 998
Event: time 1784898618.721900, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
139400
Event: time 1784898618.721900, -------------- SYN_REPORT ------------
Event: time 1784898618.726905, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
143500
Event: time 1784898618.726905, -------------- SYN_REPORT ------------
Event: time 1784898618.730908, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
147600
Event: time 1784898618.730908, -------------- SYN_REPORT ------------
Event: time 1784898618.734908, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 999
Event: time 1784898618.734908, type 3 (EV_ABS), code 1 (ABS_Y), value 999
Event: time 1784898618.734908, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
151700
Event: time 1784898618.734908, -------------- SYN_REPORT ------------
Event: time 1784898618.738902, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1000
Event: time 1784898618.738902, type 3 (EV_ABS), code 1 (ABS_Y), value 1000
Event: time 1784898618.738902, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
155800
Event: time 1784898618.738902, -------------- SYN_REPORT ------------
Event: time 1784898618.743895, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3035
Event: time 1784898618.743895, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1002
Event: time 1784898618.743895, type 3 (EV_ABS), code 0 (ABS_X), value 3035
Event: time 1784898618.743895, type 3 (EV_ABS), code 1 (ABS_Y), value 1002
Event: time 1784898618.743895, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
159900
Event: time 1784898618.743895, -------------- SYN_REPORT ------------
Event: time 1784898618.746906, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3033
Event: time 1784898618.746906, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1005
Event: time 1784898618.746906, type 3 (EV_ABS), code 0 (ABS_X), value 3033
Event: time 1784898618.746906, type 3 (EV_ABS), code 1 (ABS_Y), value 1005
Event: time 1784898618.746906, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
164000
Event: time 1784898618.746906, -------------- SYN_REPORT ------------
Event: time 1784898618.751913, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3031
Event: time 1784898618.751913, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1008
Event: time 1784898618.751913, type 3 (EV_ABS), code 0 (ABS_X), value 3031
Event: time 1784898618.751913, type 3 (EV_ABS), code 1 (ABS_Y), value 1008
Event: time 1784898618.751913, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
168100
Event: time 1784898618.751913, -------------- SYN_REPORT ------------
Event: time 1784898618.755904, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3028
Event: time 1784898618.755904, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1012
Event: time 1784898618.755904, type 3 (EV_ABS), code 0 (ABS_X), value 3028
Event: time 1784898618.755904, type 3 (EV_ABS), code 1 (ABS_Y), value 1012
Event: time 1784898618.755904, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
172200
Event: time 1784898618.755904, -------------- SYN_REPORT ------------
Event: time 1784898618.758913, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3024
Event: time 1784898618.758913, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1017
Event: time 1784898618.758913, type 3 (EV_ABS), code 0 (ABS_X), value 3024
Event: time 1784898618.758913, type 3 (EV_ABS), code 1 (ABS_Y), value 1017
Event: time 1784898618.758913, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
176300
Event: time 1784898618.758913, -------------- SYN_REPORT ------------
Event: time 1784898618.763986, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3020
Event: time 1784898618.763986, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1022
Event: time 1784898618.763986, type 3 (EV_ABS), code 0 (ABS_X), value 3020
Event: time 1784898618.763986, type 3 (EV_ABS), code 1 (ABS_Y), value 1022
Event: time 1784898618.763986, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
180400
Event: time 1784898618.763986, -------------- SYN_REPORT ------------
Event: time 1784898618.767908, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3015
Event: time 1784898618.767908, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1027
Event: time 1784898618.767908, type 3 (EV_ABS), code 0 (ABS_X), value 3015
Event: time 1784898618.767908, type 3 (EV_ABS), code 1 (ABS_Y), value 1027
Event: time 1784898618.767908, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
184500
Event: time 1784898618.767908, -------------- SYN_REPORT ------------
Event: time 1784898618.771904, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3009
Event: time 1784898618.771904, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1033
Event: time 1784898618.771904, type 3 (EV_ABS), code 0 (ABS_X), value 3009
Event: time 1784898618.771904, type 3 (EV_ABS), code 1 (ABS_Y), value 1033
Event: time 1784898618.771904, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
188600
Event: time 1784898618.771904, -------------- SYN_REPORT ------------
Event: time 1784898618.775981, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 3003
Event: time 1784898618.775981, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1039
Event: time 1784898618.775981, type 3 (EV_ABS), code 0 (ABS_X), value 3003
Event: time 1784898618.775981, type 3 (EV_ABS), code 1 (ABS_Y), value 1039
Event: time 1784898618.775981, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
192700
Event: time 1784898618.775981, -------------- SYN_REPORT ------------
Event: time 1784898618.779913, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2997
Event: time 1784898618.779913, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1045
Event: time 1784898618.779913, type 3 (EV_ABS), code 0 (ABS_X), value 2997
Event: time 1784898618.779913, type 3 (EV_ABS), code 1 (ABS_Y), value 1045
Event: time 1784898618.779913, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
196800
Event: time 1784898618.779913, -------------- SYN_REPORT ------------
Event: time 1784898618.783910, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2990
Event: time 1784898618.783910, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1052
Event: time 1784898618.783910, type 3 (EV_ABS), code 0 (ABS_X), value 2990
Event: time 1784898618.783910, type 3 (EV_ABS), code 1 (ABS_Y), value 1052
Event: time 1784898618.783910, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
200900
Event: time 1784898618.783910, -------------- SYN_REPORT ------------
Event: time 1784898618.788906, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2984
Event: time 1784898618.788906, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1057
Event: time 1784898618.788906, type 3 (EV_ABS), code 0 (ABS_X), value 2984
Event: time 1784898618.788906, type 3 (EV_ABS), code 1 (ABS_Y), value 1057
Event: time 1784898618.788906, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
205000
Event: time 1784898618.788906, -------------- SYN_REPORT ------------
Event: time 1784898618.792909, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2978
Event: time 1784898618.792909, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1062
Event: time 1784898618.792909, type 3 (EV_ABS), code 0 (ABS_X), value 2978
Event: time 1784898618.792909, type 3 (EV_ABS), code 1 (ABS_Y), value 1062
Event: time 1784898618.792909, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
209100
Event: time 1784898618.792909, -------------- SYN_REPORT ------------
Event: time 1784898618.795910, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2973
Event: time 1784898618.795910, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1066
Event: time 1784898618.795910, type 3 (EV_ABS), code 0 (ABS_X), value 2973
Event: time 1784898618.795910, type 3 (EV_ABS), code 1 (ABS_Y), value 1066
Event: time 1784898618.795910, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
213200
Event: time 1784898618.795910, -------------- SYN_REPORT ------------
Event: time 1784898618.799913, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2968
Event: time 1784898618.799913, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1071
Event: time 1784898618.799913, type 3 (EV_ABS), code 0 (ABS_X), value 2968
Event: time 1784898618.799913, type 3 (EV_ABS), code 1 (ABS_Y), value 1071
Event: time 1784898618.799913, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
217300
Event: time 1784898618.799913, -------------- SYN_REPORT ------------
Event: time 1784898618.803911, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2964
Event: time 1784898618.803911, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1075
Event: time 1784898618.803911, type 3 (EV_ABS), code 0 (ABS_X), value 2964
Event: time 1784898618.803911, type 3 (EV_ABS), code 1 (ABS_Y), value 1075
Event: time 1784898618.803911, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
221400
Event: time 1784898618.803911, -------------- SYN_REPORT ------------
Event: time 1784898618.808915, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2961
Event: time 1784898618.808915, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1078
Event: time 1784898618.808915, type 3 (EV_ABS), code 0 (ABS_X), value 2961
Event: time 1784898618.808915, type 3 (EV_ABS), code 1 (ABS_Y), value 1078
Event: time 1784898618.808915, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
225500
Event: time 1784898618.808915, -------------- SYN_REPORT ------------
Event: time 1784898618.812916, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2958
Event: time 1784898618.812916, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1081
Event: time 1784898618.812916, type 3 (EV_ABS), code 0 (ABS_X), value 2958
Event: time 1784898618.812916, type 3 (EV_ABS), code 1 (ABS_Y), value 1081
Event: time 1784898618.812916, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
229600
Event: time 1784898618.812916, -------------- SYN_REPORT ------------
Event: time 1784898618.816908, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2956
Event: time 1784898618.816908, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1084
Event: time 1784898618.816908, type 3 (EV_ABS), code 0 (ABS_X), value 2956
Event: time 1784898618.816908, type 3 (EV_ABS), code 1 (ABS_Y), value 1084
Event: time 1784898618.816908, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
233700
Event: time 1784898618.816908, -------------- SYN_REPORT ------------
Event: time 1784898618.820903, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2954
Event: time 1784898618.820903, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1086
Event: time 1784898618.820903, type 3 (EV_ABS), code 0 (ABS_X), value 2954
Event: time 1784898618.820903, type 3 (EV_ABS), code 1 (ABS_Y), value 1086
Event: time 1784898618.820903, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
237800
Event: time 1784898618.820903, -------------- SYN_REPORT ------------
Event: time 1784898618.824990, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2951
Event: time 1784898618.824990, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1087
Event: time 1784898618.824990, type 3 (EV_ABS), code 0 (ABS_X), value 2951
Event: time 1784898618.824990, type 3 (EV_ABS), code 1 (ABS_Y), value 1087
Event: time 1784898618.824990, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
241900
Event: time 1784898618.824990, -------------- SYN_REPORT ------------
Event: time 1784898618.829916, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2950
Event: time 1784898618.829916, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1089
Event: time 1784898618.829916, type 3 (EV_ABS), code 0 (ABS_X), value 2950
Event: time 1784898618.829916, type 3 (EV_ABS), code 1 (ABS_Y), value 1089
Event: time 1784898618.829916, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
246000
Event: time 1784898618.829916, -------------- SYN_REPORT ------------
Event: time 1784898618.832908, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID=
),
value -1
Event: time 1784898618.832908, type 1 (EV_KEY), code 330 (BTN_TOUCH), value=
 0
Event: time 1784898618.832908, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER),
value 0
Event: time 1784898618.832908, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
250100
Event: time 1784898618.832908, -------------- SYN_REPORT ------------
Event: time 1784898620.065042, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID=
),
value 263
Event: time 1784898620.065042, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2975
Event: time 1784898620.065042, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1574
Event: time 1784898620.065042, type 1 (EV_KEY), code 330 (BTN_TOUCH), value=
 1
Event: time 1784898620.065042, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER),
value 1
Event: time 1784898620.065042, type 3 (EV_ABS), code 0 (ABS_X), value 2975
Event: time 1784898620.065042, type 3 (EV_ABS), code 1 (ABS_Y), value 1574
Event: time 1784898620.065042, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue 0
Event: time 1784898620.065042, -------------- SYN_REPORT ------------
Event: time 1784898620.069015, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
4100
Event: time 1784898620.069015, -------------- SYN_REPORT ------------
Event: time 1784898620.074015, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
8200
Event: time 1784898620.074015, -------------- SYN_REPORT ------------
Event: time 1784898620.077007, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
12300
Event: time 1784898620.077007, -------------- SYN_REPORT ------------
Event: time 1784898620.081016, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2973
Event: time 1784898620.081016, type 3 (EV_ABS), code 0 (ABS_X), value 2973
Event: time 1784898620.081016, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
16400
Event: time 1784898620.081016, -------------- SYN_REPORT ------------
Event: time 1784898620.085016, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2972
Event: time 1784898620.085016, type 3 (EV_ABS), code 0 (ABS_X), value 2972
Event: time 1784898620.085016, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
20500
Event: time 1784898620.085016, -------------- SYN_REPORT ------------
Event: time 1784898620.090017, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2970
Event: time 1784898620.090017, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1573
Event: time 1784898620.090017, type 3 (EV_ABS), code 0 (ABS_X), value 2970
Event: time 1784898620.090017, type 3 (EV_ABS), code 1 (ABS_Y), value 1573
Event: time 1784898620.090017, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
24600
Event: time 1784898620.090017, -------------- SYN_REPORT ------------
Event: time 1784898620.094086, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2968
Event: time 1784898620.094086, type 3 (EV_ABS), code 0 (ABS_X), value 2968
Event: time 1784898620.094086, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
28700
Event: time 1784898620.094086, -------------- SYN_REPORT ------------
Event: time 1784898620.098023, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2967
Event: time 1784898620.098023, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1572
Event: time 1784898620.098023, type 3 (EV_ABS), code 0 (ABS_X), value 2967
Event: time 1784898620.098023, type 3 (EV_ABS), code 1 (ABS_Y), value 1572
Event: time 1784898620.098023, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
32800
Event: time 1784898620.098023, -------------- SYN_REPORT ------------
Event: time 1784898620.102017, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2966
Event: time 1784898620.102017, type 3 (EV_ABS), code 0 (ABS_X), value 2966
Event: time 1784898620.102017, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
36900
Event: time 1784898620.102017, -------------- SYN_REPORT ------------
Event: time 1784898620.106014, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1571
Event: time 1784898620.106014, type 1 (EV_KEY), code 272 (BTN_LEFT), value 1
Event: time 1784898620.106014, type 3 (EV_ABS), code 1 (ABS_Y), value 1571
Event: time 1784898620.106014, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
41000
Event: time 1784898620.106014, -------------- SYN_REPORT ------------
Event: time 1784898620.111017, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2965
Event: time 1784898620.111017, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1569
Event: time 1784898620.111017, type 3 (EV_ABS), code 0 (ABS_X), value 2965
Event: time 1784898620.111017, type 3 (EV_ABS), code 1 (ABS_Y), value 1569
Event: time 1784898620.111017, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
45100
Event: time 1784898620.111017, -------------- SYN_REPORT ------------
Event: time 1784898620.114018, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
49200
Event: time 1784898620.114018, -------------- SYN_REPORT ------------
Event: time 1784898620.118019, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2964
Event: time 1784898620.118019, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1568
Event: time 1784898620.118019, type 3 (EV_ABS), code 0 (ABS_X), value 2964
Event: time 1784898620.118019, type 3 (EV_ABS), code 1 (ABS_Y), value 1568
Event: time 1784898620.118019, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
53300
Event: time 1784898620.118019, -------------- SYN_REPORT ------------
Event: time 1784898620.122007, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2963
Event: time 1784898620.122007, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1567
Event: time 1784898620.122007, type 3 (EV_ABS), code 0 (ABS_X), value 2963
Event: time 1784898620.122007, type 3 (EV_ABS), code 1 (ABS_Y), value 1567
Event: time 1784898620.122007, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
57400
Event: time 1784898620.122007, -------------- SYN_REPORT ------------
Event: time 1784898620.126015, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1566
Event: time 1784898620.126015, type 3 (EV_ABS), code 1 (ABS_Y), value 1566
Event: time 1784898620.126015, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
61500
Event: time 1784898620.126015, -------------- SYN_REPORT ------------
Event: time 1784898620.130019, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1565
Event: time 1784898620.130019, type 3 (EV_ABS), code 1 (ABS_Y), value 1565
Event: time 1784898620.130019, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
65600
Event: time 1784898620.130019, -------------- SYN_REPORT ------------
Event: time 1784898620.135018, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
69700
Event: time 1784898620.135018, -------------- SYN_REPORT ------------
Event: time 1784898620.139017, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2962
Event: time 1784898620.139017, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1564
Event: time 1784898620.139017, type 3 (EV_ABS), code 0 (ABS_X), value 2962
Event: time 1784898620.139017, type 3 (EV_ABS), code 1 (ABS_Y), value 1564
Event: time 1784898620.139017, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
73800
Event: time 1784898620.139017, -------------- SYN_REPORT ------------
Event: time 1784898620.143019, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
77900
Event: time 1784898620.143019, -------------- SYN_REPORT ------------
Event: time 1784898620.147020, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2961
Event: time 1784898620.147020, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1563
Event: time 1784898620.147020, type 3 (EV_ABS), code 0 (ABS_X), value 2961
Event: time 1784898620.147020, type 3 (EV_ABS), code 1 (ABS_Y), value 1563
Event: time 1784898620.147020, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
82000
Event: time 1784898620.147020, -------------- SYN_REPORT ------------
Event: time 1784898620.150017, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
86100
Event: time 1784898620.150017, -------------- SYN_REPORT ------------
Event: time 1784898620.154022, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2960
Event: time 1784898620.154022, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1562
Event: time 1784898620.154022, type 3 (EV_ABS), code 0 (ABS_X), value 2960
Event: time 1784898620.154022, type 3 (EV_ABS), code 1 (ABS_Y), value 1562
Event: time 1784898620.154022, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
90200
Event: time 1784898620.154022, -------------- SYN_REPORT ------------
Event: time 1784898620.159017, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2959
Event: time 1784898620.159017, type 3 (EV_ABS), code 0 (ABS_X), value 2959
Event: time 1784898620.159017, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
94300
Event: time 1784898620.159017, -------------- SYN_REPORT ------------
Event: time 1784898620.163021, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1561
Event: time 1784898620.163021, type 3 (EV_ABS), code 1 (ABS_Y), value 1561
Event: time 1784898620.163021, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
98400
Event: time 1784898620.163021, -------------- SYN_REPORT ------------
Event: time 1784898620.167018, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2958
Event: time 1784898620.167018, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1559
Event: time 1784898620.167018, type 3 (EV_ABS), code 0 (ABS_X), value 2958
Event: time 1784898620.167018, type 3 (EV_ABS), code 1 (ABS_Y), value 1559
Event: time 1784898620.167018, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
102500
Event: time 1784898620.167018, -------------- SYN_REPORT ------------
Event: time 1784898620.171015, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
106600
Event: time 1784898620.171015, -------------- SYN_REPORT ------------
Event: time 1784898620.175023, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2957
Event: time 1784898620.175023, type 3 (EV_ABS), code 0 (ABS_X), value 2957
Event: time 1784898620.175023, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
110700
Event: time 1784898620.175023, -------------- SYN_REPORT ------------
Event: time 1784898620.180022, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X),
value 2956
Event: time 1784898620.180022, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y),
value 1558
Event: time 1784898620.180022, type 1 (EV_KEY), code 272 (BTN_LEFT), value 0
Event: time 1784898620.180022, type 3 (EV_ABS), code 0 (ABS_X), value 2956
Event: time 1784898620.180022, type 3 (EV_ABS), code 1 (ABS_Y), value 1558
Event: time 1784898620.180022, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
114800
Event: time 1784898620.180022, -------------- SYN_REPORT ------------
Event: time 1784898620.184018, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
118900
Event: time 1784898620.184018, -------------- SYN_REPORT ------------
Event: time 1784898620.188014, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
123000
Event: time 1784898620.188014, -------------- SYN_REPORT ------------
Event: time 1784898620.191022, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
127100
Event: time 1784898620.191022, -------------- SYN_REPORT ------------
Event: time 1784898620.195020, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
131200
Event: time 1784898620.195020, -------------- SYN_REPORT ------------
Event: time 1784898620.200019, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
135300
Event: time 1784898620.200019, -------------- SYN_REPORT ------------
Event: time 1784898620.204024, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
139400
Event: time 1784898620.204024, -------------- SYN_REPORT ------------
Event: time 1784898620.208024, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID=
),
value -1
Event: time 1784898620.208024, type 1 (EV_KEY), code 330 (BTN_TOUCH), value=
 0
Event: time 1784898620.208024, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER),
value 0
Event: time 1784898620.208024, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), val=
ue
143500
Event: time 1784898620.208024, -------------- SYN_REPORT ------------
^C

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
