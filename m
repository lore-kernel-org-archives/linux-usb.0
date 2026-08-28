Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3528E12CDA5
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 03:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888968; cv=none; b=nh/5ALzYkkSrUKJDaRtdfakam5gxbrQAMxGrrRJSI/nRRmkITJpf4Ghvd/OgmTpDAqIEjJZCgFobY1FzJb4FD1Dw+yt9VRxM4JkjvVrNH6LHikxhH6axmNohaCuAMYAbXIoz26Ff/02r1a8uyyT29ckpvT6jyncDO/id98Q2uk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888968; c=relaxed/simple;
	bh=ka2LpN4LjoY9ewxKXt4C2Z1DjngVVmtOGjIkpvMcc+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m2Rmb5QABlhGzGNxRZfGxohXpsUDEQkv2wFK6bmJFK7V1eHqIv7tW08BIcIjaFEcSgHKPc+HCnIifeLarIsX4YAd0s/dd/6pSLVfPS1+UXjwJjwB6Ui7k4RqnOnsq953uvo1gSdE/9guUTuIEAMWsaEPB5txXJCn4ccTs8ntM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB7Hk2zj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB7Hk2zj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4FE8C19425
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 03:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787888967;
	bh=ka2LpN4LjoY9ewxKXt4C2Z1DjngVVmtOGjIkpvMcc+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YB7Hk2zjNezoKKJz9yAgTZea0M6+n8495wntDARYK8fkYXgyvOqhEJMK2NrpxbgmC
	 mrkuzRfJW/gZYuTuZAN8IxIP1mp3wl5hrHwlwxZ0+FI9KDNEYdn51unKx6WPG6VfFR
	 W5W473qJKtNF+upK9igngI4d9cuJzheJMazvYWzgPtlmHd76ySrkHekp6k2TLnyzB8
	 hgGsRfQaGAfR9BLqyF8asdghm2Xkw0VgVMfR08jkQbQ3VGNQRWC6RmMGBXplXlMn8x
	 TujbGTD0dy7KnsqMCfH/RyAvHiELmN/iFmDfkffpiF1B77OAz+XpIywFpuog3S17YW
	 7gOrc49BkauTA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B3414C433E1; Fri, 28 Aug 2026 03:49:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 28 Aug 2026 03:49:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: voltara@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221103-208809-nKVPb7JpCf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

Andrew Skalski (voltara@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |voltara@gmail.com

--- Comment #27 from Andrew Skalski (voltara@gmail.com) ---
I believe this same crash is affecting my system as well.

Motherboard: Asus Pro WS WRX90E-SAGE SE
CPU: AMD Ryzen Threadripper PRO 7985WX
Kernels I tried: 6.8, 7.0 (Ubuntu 24.04 LTS packages)

Like others have reported, the "adb" command tends to trigger the crash.  I
also experience intermittent crashes upon plugging in a USB device (either =
by
physically plugging in the cable, or by toggling the USB switch I use to sh=
are
keyboard/mouse between two systems.)  All ports seem to be affected: front
panel, rear panel, and also the ports on my Thunderbolt dock.

When the crash is a result of plugging in a device, it generates an MCE (ca=
che
error, processor context corrupt, uncorrected.)

This loop alone is enough to cause a crash eventually.  My latest attempt r=
an
12000+ iterations before it crashed:

while sleep 0.01 < /dev/bus/usb/002/001; do echo -n .; done

So far, I have only tried a couple nodes in /dev/bus/usb, but these two both
led to a crash:
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

I tested both kernel patches mentioned in this ticket (retry xhci_resume, a=
nd
the D3cold delay) but neither one resolved the crashes.  I tested both using
the Ubuntu 6.8 kernel package as a basis.  I was not able to successfully b=
uild
the 7.0 kernel package.

The usbcore.autosuspend=3D-1 parameter appears to solve both of the crashes.

I tried enabling xhci_hcd debug logging through netconsole, but so far I ha=
ve
not been able to reproduce either crash with debug logging enabled.

In case it's helpful, here's one message I've seen in the "dmesg -W" output
(running via IPMI serial console) logged right at the moment of the crash:

xhci_hcd 0000:04:00.4: Refused to change power state from D0 to D3hot

Thanks for your work so far looking into this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
