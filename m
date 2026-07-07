Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3542F8EA5
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418044; cv=none; b=f2pKeg8tk18rRj6QmzDWlgF0B/stFIh6+tdFUYh7JJH0nivsp+yWk1VBqyxMwpewm7SC1Isr/xAQkXdwRed6uWQxnYHWC9u/JuMwqnE6JDUsyZ5X1cgLzAiNHQ3dRdId8Ebr775RKAaKObr0KnGhqoeb+nRhIBYQcf7alTkMMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418044; c=relaxed/simple;
	bh=QK5vZAAuclo8x8fWz1w0TLTQ5EKJJrVPe059hVNGmHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gFTCwN82V22FoxuVHT++1fvrZNH9VljduSeX+HIubgPzvEqL+GKNk2n0ueXPT+p4kqMQ2al4yCHcgyVJjHCvim23smxpRLogsD3H6zRQdNJLMbxEbjnvCc6jvWnjXqWYx9h8lM7Mvb1s3IqxDarIZPac0qtSQpgv6sAxgLEpYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsLZcsh3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsLZcsh3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E2A0C2BCC9
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783418044;
	bh=QK5vZAAuclo8x8fWz1w0TLTQ5EKJJrVPe059hVNGmHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gsLZcsh3soLokFxRpWfFQQBkz3xadKlFMkhmRzVECQjwSdvbqXio1a2LjhmKr0Y1/
	 oShG6y6Zm3J7wIiylOgR4Yb7Q0eG4K1UCgBkWzPgT8E8f65ysTMrDPHqu/o7ajhyYX
	 /CMPrIdBEijGVNJIOr51co5+JWYUlDycrX8bLVAsi44JzZzF18LNdfo3LXJ5JrSwh4
	 FddEMPFmeecrH38Y3iy89REHYHlRlQKAjh8YCEYWWf1UQoyblmtubJE6RMFSe2d/zo
	 jvO7mlS+/NzTqpnWCqZn2jnayNWt5COSI9LSg5jxLO9TeVWt77f89jZ7YctQU6LC2Z
	 ZxVib9Bnz7mMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 110D0C41616; Tue,  7 Jul 2026 09:54:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Tue, 07 Jul 2026 09:54:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: hurryman2212@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221721-208809-Pnqou0iCT2@https.bugzilla.kernel.org/>
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

--- Comment #4 from hurryman2212@gmail.com ---
With a little more of thinking, I think this happens due to the
initramfs building tool not including xhci-pci-prom21.ko when
xhci-pci.ko is built with the Kconfig where USB_XHCI_PCI_PROM21 was enabled.

Can you check your initramfs file for whether it holds
xhci-pci-prom21.ko correctly, or not?

For example, with dracut, you can do something like:
cat <<'EOF' | sudo tee /etc/dracut.conf.d/10-xhci-pci-prom21.conf
# PROM21 xHCI PCI glue is needed before root/LUKS unlock when xhci-pci
is modular.
force_drivers+=3D" xhci-pci-prom21 "
EOF


Sincerely,
Jihong Min


On 7/7/26 17:03, Thorsten Leemhuis wrote:
> [Switching to email, hope this will work]
>=20
> Jihong Min, it seems a recent change of yours is causing trouble. See
> below for details.
>=20
> Side note, but not my area of expertise, so feel free to ignore this, as
> I might be sending people in the wrong direction and it's just a hunch
> anyway: wonder if this is another of those situations where the driver
> needs to be in the initramfs. Tomasz, did you have SENSORS_PROM21_XHCI=3Dm
> when things were broken? And if yes: have you tried if adding it to the
> initramfs or setting SENSORS_PROM21_XHCI=3Dy helps?
>=20
> Ciao, Thorsten
>=20
> On 7/4/26 17:41, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D221721
>>
>>             Bug ID: 221721
>>            Summary: prom21-xhci does not allow to use USB keyboard in
>>                     plymouth
>>            Product: Drivers
>>            Version: 2.5
>>           Hardware: AMD
>>                 OS: Linux
>>             Status: NEW
>>           Severity: low
>>           Priority: P3
>>          Component: USB
>>           Assignee: drivers_usb@kernel-bugs.kernel.org
>>           Reporter: marx.tomasz@gmail.com
>>         Regression: No
>>
>> Created attachment 310416
>>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D310416&action=3Ded=
it
>> output of "sudo lsusb -v"
>>
>> Hi,
>>
>> After update to 7.2-rc1 I was unable to type in LUKS password in plymout=
h. I
>> tried both of my USB keyboards, but both of them just briefly lit up the
>> LEDs
>> and then seemed to turn off. Bisection pointed to
>>
>> commit 364f4a55c661641c02c86a849f0608d8fc3c0006
>> Merge: e4b4bfaa5090 1c2b66a7d725
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Mon Jun 22 12:09:47 2026 -0700
>>
>>     Merge tag 'usb-7.2-rc1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
>>
>> and then
>>
>> commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
>> Author: Jihong Min <hurryman2212@gmail.com>
>> Date:   Tue May 19 09:07:31 2026 +0900
>>
>>     usb: xhci-pci: add AMD Promontory 21 PCI glue
>>
>> After setting SENSORS_PROM21_XHCI=3Dn and compiling kernel again, I'm ab=
le to
>> use
>> my PC normally.
>>
>> CPU: AMD Ryzen 9 9900X
>> Motherboard: X870I AORUS PRO ICE
>> Output of "lsusb -v" provided in attachment.
>>
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
