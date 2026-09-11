Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51949E12E
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086677; cv=none; b=mNJEUddkiZulCBQp6z+TFNmLsZv0RNJg9/FSrFJaDMtEqNAIBX0X+Z4bVGYn8vCo5GxzkAbIDQ0vh2KGLgVeFmCtKq2Z4eQJcBB/NO65LxOfSGac82A2Il0M9JC6UiFjokETSnRylLFzx7LJikDz5KgZjC1LD3dmjXe3K7FwOOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086677; c=relaxed/simple;
	bh=glNkDcaX+zBTBavguYWo8pAGRbsF8t9FUCea9kjn8+I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EmPQX+GIgi45rLLXFoNcG0yEhnWik2WlPTc1KSvqw9yN1EwEejK+H3jRpJL+0Jl0GIDfpigWQY1GgUrSsuXtYNtnsQNYlyqWGzMRWLX/CdNe2Jl5VzLzTYQfdehqjzOkwtx9c/IHfXOC49OlXvm4gxisny0Kh/4j9JVPEuV+eqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbEcGIU4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbEcGIU4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F2E6C2BCC7
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 00:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789086677;
	bh=glNkDcaX+zBTBavguYWo8pAGRbsF8t9FUCea9kjn8+I=;
	h=From:To:Subject:Date:From;
	b=SbEcGIU4ul342fssfnU5BFHYyEYjBYga6o+o7uUA45VPZ7OLhnO/ODUqQRrSGbBfs
	 QUV4QyhtXpEJPA2lUotdTHAQ/94WkbmYHoR2Fxb14yaDVAnMUp0Ttub4A3naUeX2c2
	 isC8F6ffAqAc+44M35tAmicq7oDBiDfEUsZWNQrcoTVQ/VqwYsquewc2yTjW04VADm
	 4QgCgyOaFWLQIrIkS52OPyR7HZu7o6YxebiSh1MjZfVmiKtnK9fxfADdgvqaYGuB5y
	 gofWmp3PwXWM4anFzAe8XpbPXQPaiTDrnobjC0JRI6P2lqH0P1FKGmhFL3TeEVaRxg
	 lLJL6rDretsVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 25166C433E1; Fri, 11 Sep 2026 00:31:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222000] New: USB: xhci_hcd: Goodix USB Fingerprint sensor keep
 resetting
Date: Fri, 11 Sep 2026 00:31:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ericlin050914@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222000-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222000

            Bug ID: 222000
           Summary: USB: xhci_hcd: Goodix USB Fingerprint sensor keep
                    resetting
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ericlin050914@gmail.com
        Regression: No

The Goodix USB Fingerprint sensor on my laptop is correctly detected and
registered by the xhci_hcd driver (USB ID 27c6:6090). But every time I use =
this
fingerprint sensor, it'll reset twice and cause this device pretty unstable.
I've tried disabling the USB power saving feature via udev on this device b=
ut
it didn't work.

Kernel Version:
7.3.0-rc2-1-cachyos-rc

Distribution:
Arch Linux

Hardware:
- Laptop Model: MSI Prestige 16 Flip AI+ C3MTG
- Finger sensor: Shenzhen Goodix Technology Co.,Ltd. Goodix USB2.0 MISC
- USB ID: 27c6:6090

Steps to reproduce:
1. Wait for the device to be registered by the kernel
2. Proceed user authentication via this fingerprint sensor

Expected behavior:
The device should be stable and easy to proceed user authentication

Actual behavior:
The device pretty unstable and often fail to proceed user authentication

relevant dmesg log:
sudo dmesg | grep "usb 3-6"
[    0.740400] usb 3-6: new full-speed USB device number 2 using xhci_hcd
[    0.864102] usb 3-6: New USB device found, idVendor=3D27c6, idProduct=3D=
6090,
bcdDevice=3D 1.00
[    0.864890] usb 3-6: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[    0.864893] usb 3-6: Product: Goodix USB2.0 MISC
[    0.864896] usb 3-6: Manufacturer: Goodix Technology Co., Ltd.
[    0.864898] usb 3-6: SerialNumber: UIDEA968203_XXXX_MOC_B0
[   34.580581] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   34.827562] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   67.098374] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   67.346355] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[   77.613264] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  441.602772] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[  441.854704] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1896.452054] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1896.702992] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1968.751598] usb 3-6: reset full-speed USB device number 2 using xhci_hcd
[ 1969.003726] usb 3-6: reset full-speed USB device number 2 using xhci_hcd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
