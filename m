Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8824329E117
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411451; cv=none; b=oNi4UplnJbc/CTndv5hIGnrQCxJow5gHmv2m6neIeNaDnTmX4VPSbhO8JaY70Mg0JL6Z4YA+dlBolSxsQed6Ho7peba3jAfdIx8+0/AmJ5kvb96YF1ZVZFLxNBWapXXbQIyTB5cGslMDnJqdWtwkC7TZM4FT51Lb8Z2PX9oBHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411451; c=relaxed/simple;
	bh=wwhh8z1296p5ARq/K8uQsVS4peQ9mtbDpLCwiCyRiUg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q7nBGxyu0pD7Hb5NwIU7ZYRsQ/raV7jJB/bDOPUxjIVYJ9wpqekgNqUeu5YJ4wq/jOPvERPee0QRGWbcM5iRR0z6sKol1B5az9GiCpdgbkmHHPNTbwLhQff6/taWEfo/gq9UUMWNQcnRG9CQN6hJdrEkBq1xmGErJ0/pIE9yusc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPhccyTo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPhccyTo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C302C2BCC9
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783411451;
	bh=wwhh8z1296p5ARq/K8uQsVS4peQ9mtbDpLCwiCyRiUg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sPhccyToWxcU5tFO3m40yTzdbq3jAUfHF7fDLbp+mS4oJTZ328lzPmJ4r+w7YWmSN
	 R91knAy3qx3006qDR41DmjU1oVamwjgxcaYvJa5i2PtAVV4pdSyUyiMpzA1zJsEL0+
	 7Lz6fbPD4fN7H6rZuT+VCv1AmmjjqONB6rEyINi88Yfkr7rWtv+NiuuzsyhNpEzccp
	 McDEFgSlHZZmKdJ0P7fEX6NZUPbqRQ+aFFBhxlZdBcXtcOdDgaLxF+HdwVzlzCOQeR
	 qL5N7fFuOPPP99/UM6sB0uhGP8/KStVbMrrsSzWIJ2fBNrb/zes+DpKRaxw5j5Dpan
	 N8qRQyIepDKVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6F81C41616; Tue,  7 Jul 2026 08:04:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Tue, 07 Jul 2026 08:04:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221721-208809-wvIaCpVmIG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221721-208809@https.bugzilla.kernel.org/>
References: <bug-221721-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221721

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
[Switching to email, hope this will work]

Jihong Min, it seems a recent change of yours is causing trouble. See
below for details.

Side note, but not my area of expertise, so feel free to ignore this, as
I might be sending people in the wrong direction and it's just a hunch
anyway: wonder if this is another of those situations where the driver
needs to be in the initramfs. Tomasz, did you have SENSORS_PROM21_XHCI=3Dm
when things were broken? And if yes: have you tried if adding it to the
initramfs or setting SENSORS_PROM21_XHCI=3Dy helps?

Ciao, Thorsten

On 7/4/26 17:41, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221721
>=20
>             Bug ID: 221721
>            Summary: prom21-xhci does not allow to use USB keyboard in
>                     plymouth
>            Product: Drivers
>            Version: 2.5
>           Hardware: AMD
>                 OS: Linux
>             Status: NEW
>           Severity: low
>           Priority: P3
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: marx.tomasz@gmail.com
>         Regression: No
>=20
> Created attachment 310416
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D310416&action=3Dedit
> output of "sudo lsusb -v"
>=20
> Hi,
>=20
> After update to 7.2-rc1 I was unable to type in LUKS password in plymouth=
. I
> tried both of my USB keyboards, but both of them just briefly lit up the =
LEDs
> and then seemed to turn off. Bisection pointed to
>=20
> commit 364f4a55c661641c02c86a849f0608d8fc3c0006
> Merge: e4b4bfaa5090 1c2b66a7d725
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Mon Jun 22 12:09:47 2026 -0700
>=20
>     Merge tag 'usb-7.2-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
>=20
> and then
>=20
> commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
> Author: Jihong Min <hurryman2212@gmail.com>
> Date:   Tue May 19 09:07:31 2026 +0900
>=20
>     usb: xhci-pci: add AMD Promontory 21 PCI glue
>=20
> After setting SENSORS_PROM21_XHCI=3Dn and compiling kernel again, I'm abl=
e to
> use
> my PC normally.
>=20
> CPU: AMD Ryzen 9 9900X
> Motherboard: X870I AORUS PRO ICE
> Output of "lsusb -v" provided in attachment.
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
