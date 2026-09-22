Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D2347ACED
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790116913; cv=none; b=B0ZTz1OOfeOYNPACiGtKF/WXrEvFUp26rOa58d3S6lU0j4v2SNmitQI7Mf2bq44Ae+ldPM9pdX8HLVDBfAejZiSs5uzstqQZNsMyRMMM7kc2KHrAeHIxYzupeg6cWwJrnPu/2L1/KT4ikJUpQy2xWFLXdYJR4/m4Gq3PhciSj4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790116913; c=relaxed/simple;
	bh=eIVPPqAxO8uSX8OH2k/oMubN03cyYg3Hy9gZeIGN3Rs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tBxpXWZRfl1a/aYiAVaYVvHBS5gifc5aJ+uyIvUEJp+b+jtDIeyHQJ/lp3tO8+DCqWjV8nvcqt00UVruLSilRuI7qSrR2U+p+QAgDkWxs7JbCAK+qolNkYsXAAtzflQWnv6CabKz9DgYpaCkJREApWxUv33g6qyrWH7zZRy/47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UstS7770; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UstS7770"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDAA8C2BCF5
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 22:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790116913;
	bh=eIVPPqAxO8uSX8OH2k/oMubN03cyYg3Hy9gZeIGN3Rs=;
	h=From:To:Subject:Date:From;
	b=UstS7770SQRyy8Z0tWy/L9Hw3lx5VDCuKd8ULDH/X0JEgiIXMw8v2+p+CylWywhMv
	 SCwkjhlARACkgFSPCc6RHqTKaXmEfQdY2pEv+Ph2FgUXzp2Q3WxTdBP+6DTqNxrDb6
	 wheCv7LO27cxxdJRuw01oR5i1eSlJDPCpGy3IK9rE5L5uC7efSqJ19wWkC31CBrn+F
	 zGrIHXArpaA/RmRAavYFUmbapAwSYHO1SiOFhtmng36njwXv6kyqWI7DhhtiYz22nH
	 9jm4yePuE3t8Lqm1Gg55SCd7f+yfGlkMT0/7RGIetselOBY/xzTBxqCfsmAI7CpXpI
	 tsaw5pSI0DBjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2CFBC433E1; Tue, 22 Sep 2026 22:41:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222049] New: xhci_hcd: USB device on onboard port fails to
 enumerate (error -110/-71), delays boot  around 70s on ASUS ROG Strix X870-F
Date: Tue, 22 Sep 2026 22:41:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gtmatthews@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222049-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222049

            Bug ID: 222049
           Summary: xhci_hcd: USB device on onboard port fails to
                    enumerate (error -110/-71), delays boot  around 70s on
                    ASUS ROG Strix X870-F
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: gtmatthews@gmail.com
        Regression: No

System: ASUS ROG Strix X870-F Gaming WiFi, BIOS 2402 (also reproduced on 23=
01)
Kernel: 7.2.5-200.fc44.x86_64 i'm using Fedora 44

An internal/onboard USB device consistently fails to enumerate on port 1-11
during every boot, causing dracut-initqueue.service to block for
approximately 60-70 seconds before boot can continue.

The device produces repeated "device descriptor read/64, error -110"
failures, followed by a port power cycle attempt, then repeated
"Device not responding to setup address" / "error -71" failures, before
the kernel gives up with "unable to enumerate USB device" at  around 70
seconds.

This is fully reproducible across multiple boots and persists after I've tr=
ied=20
Updating BIOS from 2301 to the latest 2402
Disabling AURA/RGB in BIOS (an onboard ASUS AURA LED Controller
  0b05:19af is present at a different port, 1-7, and is unaffected)
Physically disconnecting all external USB peripherals
  (only mouse, keyboard, fingerprint reader remain connected)
Disconnecting the internal front-panel USB 2.0 header

Since it persists with no external devices connected and no front-panel
header connected, the failing device appears to be an internal/onboard
USB endpoint on the motherboard itself.

=E2=9D=AF journalctl -b 0 -o short-monotonic --no-pager | grep -B3 -A3 "1-1=
1"
[    5.171308] fedora-main kernel: usb 1-7: Manufacturer: AsusTek Computer =
Inc.
[    5.171359] fedora-main kernel: usb 1-7: SerialNumber: 9876543210
[    5.193023] fedora-main kernel: hid-generic 0003:0B05:19AF.000A:
hiddev100,hidraw9: USB HID v1.11 Device [AsusTek Computer Inc. AURA LED
Controller] on usb-0000:09:00.0-7/input2
[    5.366352] fedora-main kernel: usb 1-11: new high-speed USB device numb=
er
10 using xhci_hcd
[   10.970441] fedora-main kernel: usb 1-11: device descriptor read/64, err=
or
-110
[   26.843437] fedora-main kernel: usb 1-11: device descriptor read/64, err=
or
-110
[   27.129393] fedora-main kernel: usb 1-11: new high-speed USB device numb=
er
11 using xhci_hcd
[   32.474430] fedora-main kernel: usb 1-11: device descriptor read/64, err=
or
-110
[   48.346395] fedora-main kernel: usb 1-11: device descriptor read/64, err=
or
-110
[   48.460043] fedora-main kernel: usb usb1-port11: attempt power cycle
[   48.904403] fedora-main kernel: usb 1-11: new high-speed USB device numb=
er
12 using xhci_hcd
[   53.704061] fedora-main kernel: usb 1-11: Device not responding to setup
address.
[   58.717053] fedora-main kernel: usb 1-11: Device not responding to setup
address.
[   58.933398] fedora-main kernel: usb 1-11: device not accepting address 1=
2,
error -71
[   59.113460] fedora-main kernel: usb 1-11: new high-speed USB device numb=
er
13 using xhci_hcd
[   62.202367] fedora-main systemd-udevd[404]: usb1: Worker [444] processing
SEQNUM=3D2850 is taking a long time.
[   63.914407] fedora-main kernel: usb 1-11: Device not responding to setup
address.
[   68.926397] fedora-main kernel: usb 1-11: Device not responding to setup
address.
[   69.141050] fedora-main kernel: usb 1-11: device not accepting address 1=
3,
error -71
[   69.148028] fedora-main kernel: usb usb1-port11: unable to enumerate USB
device
[   69.237128] fedora-main systemd[1]: Finished dracut-initqueue.service -
dracut initqueue hook.
[   69.237364] fedora-main systemd[1]: Reached target remote-fs-pre.target -
Preparation for Remote File Systems.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
