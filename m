Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC772848AA
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 01:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785720716; cv=none; b=OxWYSagMLLGnvosGwN0flK8rPBlsoQUX+5CAh+RSESMwLEW8Xa/W2t/6cTY2urVUlzNsb1XeM2rnWKMQHAFOXLs0TClVNpUg5gTAh+FEaU7G3kj4T3cwkhxc5zjy0o/5DKob9xSS3+LWqq5H7+zob8ZDsodMJgF7AeiWkcE2ZjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785720716; c=relaxed/simple;
	bh=qGwnzzFtPCXnkbUcC3G8xd8N/4bCjsqAHVLg1X/Vx9Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XsVei/EuFQHoGaHjkJt/OBq/NSfOOWrMz3/dMfwqFNNxOPRIvlr+9ophnTe5m6fNxQi8nTe2UVutVcHTbwVLDgpJFRrcUzgCHhXL923dT+OIKlSY4tOIhuF5jsGJ+wbNmrqB0P7CoZtgOqsZekHzLTjcQ450Z+ZMMLU1skWCn7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTUZBEJR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTUZBEJR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3718C19425
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 01:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785720715;
	bh=qGwnzzFtPCXnkbUcC3G8xd8N/4bCjsqAHVLg1X/Vx9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rTUZBEJRwIf56KMjBUnVh1qHIcFoI7EkB+lmwNHiWWr79QK8tF22qquN279ufaaIX
	 XKRf41WFNQqQjVy9Y780nRkO3TnMXJrW+auB8QBSf8+d076e42UYHZjfaqqnJ2sqHw
	 YfgQoUe+u/WQiEavscEyeniA6EDy0ggflx/EGbRkSwCERFJZOWZTW3lLdhuXff2Brt
	 XF/PmSziBu0XNXPdq71C9aSUnG4rw9L8sAaMAVXYmXA99Vkq2Jk/CqCH0isey85TV6
	 c5Lh5QXphfdhRZOWrqD0+b6AUsU6NsgcySANpZ069qNsoA9hSeJCo5wD1rG0EvKAIO
	 UEqS6NIAwyGeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9A163C3279F; Mon,  3 Aug 2026 01:31:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Mon, 03 Aug 2026 01:31:55 +0000
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
Message-ID: <bug-221774-208809-GrL4ViYvDE@https.bugzilla.kernel.org/>
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

--- Comment #12 from mayhemandcoffee@gmail.com ---
Hi,

I tested the updated patch on Linux 7.1.4 rebuilt from source.

Results:

The "Returned feature report did not match the request" message is no longer
present in dmesg.
evtest now reports ABS_MT_TOOL_TYPE, which was missing with the previous pa=
tch.
ABS_MT_SLOT, ABS_MT_POSITION_X, ABS_MT_POSITION_Y, ABS_MT_TOOL_TYPE, and
ABS_MT_TRACKING_ID are all present.

However, there is still no observable userspace change.

libinput list-devices still reports:

Device:                  ASUSTeK Computer Inc. GZ302EA-Keyboard Touchpad
Kernel:                  /dev/input/event11
Id:                      usb:0b05:1a30
Group:                   2
Seat:                    seat0, default
Size:                    127x70mm
Capabilities:            pointer gesture
Tap-to-click:            disabled
Tap-and-drag:            enabled
Tap button map:          left/right/middle
Tap drag lock:           disabled
Left-handed:             disabled
Nat.scrolling:           disabled
Middle emulation:        disabled
Calibration:             n/a
Scroll methods:          *two-finger edge=20
Scroll button:           n/a
Scroll button lock:      n/a
Click methods:           *button-areas clickfinger=20
Clickfinger button map:  left/right/middle
Disable-w-typing:        n/a
Disable-w-trackpointing: n/a
Accel profiles:          flat *adaptive custom
Rotation:                n/a
Area rectangle:          n/a

KDE Plasma's Disable while typing option is still greyed out.

evtest capability output:
Input driver version is 1.0.1
Input device ID: bus 0x3 vendor 0xb05 product 0x1a30 version 0x110
Input device name: "ASUSTeK Computer Inc. GZ302EA-Keyboard Touchpad"
Supported events:
Event type 0 (EV_SYN)=20
Event type 1 (EV_KEY)=20
Event code 272 (BTN_LEFT)=20
Event code 325 (BTN_TOOL_FINGER)=20
Event code 328 (BTN_TOOL_QUINTTAP)=20
Event code 330 (BTN_TOUCH)=20
Event code 333 (BTN_TOOL_DOUBLETAP)=20
Event code 334 (BTN_TOOL_TRIPLETAP)=20
Event code 335 (BTN_TOOL_QUADTAP)=20
Event type 3 (EV_ABS)=20
Event code 0 (ABS_X) Value 2208 Min 0 Max 3929 Resolution 31=20
Event code 1 (ABS_Y) Value 1489 Min 0 Max 2181 Resolution 31=20
Event code 47 (ABS_MT_SLOT) Value 0 Min 0 Max 4=20
Event code 53 (ABS_MT_POSITION_X) Value 0 Min 0 Max 3929 Resolution 31=20
Event code 54 (ABS_MT_POSITION_Y) Value 0 Min 0 Max 2181 Resolution 31=20
Event code 55 (ABS_MT_TOOL_TYPE) Value 0 Min 0 Max 2=20
Event code 57 (ABS_MT_TRACKING_ID) Value 0 Min 0 Max 65535=20
Event type 4 (EV_MSC)=20
Event code 5 (MSC_TIMESTAMP) Key repeat handling: Repeat type 20 (EV_REP)
Repeat code 0 (REP_DELAY) Value 250 Repeat code 1 (REP_PERIOD) Value 33

Properties:=20
Property type 0 (INPUT_PROP_POINTER)=20
Property type 2 (INPUT_PROP_BUTTONPAD)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
