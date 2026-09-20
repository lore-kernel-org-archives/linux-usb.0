Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5190374A17
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916761; cv=none; b=OLwl7NwwRiy7jnpD67wLdQAXGC1v2zROXEPuWUIrs2Hb4MpNNclB7+2Ui89WdNy5qkz6WRCYgrFkRsAaEx+jXDKcI+0H1yDE7nk4bF2+NOZ814T9nkhpWx/xH1LwvdEML9UiyIcI8Mujmpj7QpzpVdk0RzDx9CmXEykrer3YhvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916761; c=relaxed/simple;
	bh=L0lAAjFS6LrI8xQHePTDWzR8f4Q6y+tAy2fqfVvQJm0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sjTOV5oxHOGaZwPzYFESkayld98fUnAUYHVhO3DSU+4GMdJb7Sy4Vs3eSETRwN1BAmUeTO5cBU12EE/hSkdBED1GuPJN+ACEuPVY/EPJoz/GN3sbHKC7kdHb7/z5Baljt8XF89ZM6NCfeww02tEFbCt3pGqMWYtb5KdL7g9Apn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fy6UbHLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fy6UbHLj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33191C2BCFD
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789916761;
	bh=L0lAAjFS6LrI8xQHePTDWzR8f4Q6y+tAy2fqfVvQJm0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fy6UbHLj4O3gPvZzyihDhL9d8+zjLGZ4ZL6w3VOtEAFOaj7WKKtelBiPLAVISbPdy
	 RdmGahIW+Xqxu0v/+VRMJBFAKs259M6ReIZleWw1V+c5XaEOmBPQYe6WaN3MmM5Hqs
	 vnD8mfVNpQKCUo5dUYa+/TNWraa1oKzsTqWF0rwIModhS03ZBaj93TFMI+xVlt1O3/
	 /iAUC0C/P6j6zhZtHHJsKSmahcNg4CFj5IKoRGMGd0+aG5CafUeBFAiYNzR7+Af1hV
	 ZgB/CtO/jH8Ykx/EEOe6UiTiF6cNeib/GhDeIUuKAmPH7jhSkz+1VPmc5lHoDIHtfG
	 /MGuec4orpLYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 22DB6C3279F; Sun, 20 Sep 2026 15:06:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Sun, 20 Sep 2026 15:06:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: darnexus.04@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-QFGirDJmzU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Ond=C5=99ej Sold=C3=A1t (darnexus.04@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |darnexus.04@gmail.com

--- Comment #49 from Ond=C5=99ej Sold=C3=A1t (darnexus.04@gmail.com) ---
I am facing similar issue on ThinkPad X390 Yoga running CachyOS when pluggi=
ng
USB-C flash drive directly into Thunderbolt port. When plugged into the same
port using dock the issue does not occur.

Component: USB
Hardware: Intel (Titan Ridge JHL7540, 8086:15c1)
Kernel version tested: 7.2.6 (mainline/cachyos), 6.18.52 (LTS/cachyos)
Regression: Unknown =E2=80=94 no prior known-good kernel tested

System:
Lenovo ThinkPad X390 Yoga
Thunderbolt controller path: 00:1c.4 =E2=86=92 07:00.0 =E2=86=92 08:02.0 =
=E2=86=92 2f:00.0
lspci -s 2f:00.0: Intel Corporation JHL7540 Thunderbolt 3 USB Controller [T=
itan
Ridge 4C 2018], vendor 0x8086, device 0x15c1

The error usually show like this:
usb 4-1: new SuperSpeed USB device number N using xhci_hcd
usb 4-1: New USB device found, idVendor=3D0781, idProduct=3D55a9
scsi host0: uas
scsi 0:0:0:0: Direct-Access      USB      SanDisk 3.2Gen1
sd 0:0:0:0: [sda] 120164352 512-byte logical blocks
usb 4-1: USB disconnect, device number N
sd 0:0:0:0: [sda] tag#0 uas_zap_pending 0 uas-tag 1 inflight: CMD
sd 0:0:0:0: [sda] tag#0 FAILED Result: hostbyte=3DDID_NO_CONNECT

I have tried udev rules, usb quirks and nothing seems to fix the issue.
System freezes do not occur at all.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
