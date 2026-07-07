Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C85B3D5C3C
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783462803; cv=none; b=rCjsq1u/d5dr4wrm609Vdnp0ZXu5bZnmH22B43wxNkNf4NWAylsWCQ3qURutGQThY107KnCvnaZF0v9ukzTp6p3jdD5uTb9XG8CEUp6SZ9XFQnYK9UKpQ+c9wl64NsCVc3IpkQqZUNa/qAsZUBgZe/j5hF9LSQMV4nyQ6qXtz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783462803; c=relaxed/simple;
	bh=DnbzYgVSdHQKYBg4No/9lhTJ+ksBNcrfL2MjJ0wgNjs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p+jecwpV1iFwP3SoDGcYFAX5vldEGBl/scbt94bWcVu+dSVwImEm6qEdDupBJIRkzzemmr9Pq9HK2kYP6yljbByrXTeeYKbiiIDFHf8OnhHDXFmB06t6hNzwjCxupzTBaaQrGGB3Szz5wu5ISt4LV3jpzuWZ2vs9BXKU1LmUGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHn0z+Up; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHn0z+Up"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A26D5C2BCB8
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783462802;
	bh=DnbzYgVSdHQKYBg4No/9lhTJ+ksBNcrfL2MjJ0wgNjs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QHn0z+UpLEzwmVgXxUsVwb93QCTmRcPzHk/7D//z/JiWLZg5CzLArNuqI/3AL7xCh
	 5Kie4+/TCmmnhGPgYbAsbiw1BLZrczOdDwsAh7C74X6BkWnnqAFV8HaEVlzodKi/I1
	 w/XFtTrTkiBhiYlC9vPgqNwpgiGmvPFlK+8L1eA+UUIEJMYSHCCOsR77tmBvImGl8d
	 P+wFktHIGFEU0SwbS60QeNZuyQM5ArHBlRFF225NSdLPTV/BdyMmy85Fk/5axtRvcA
	 gzm/Dtg/jOjftP9WYakEPf7ft4QlZNCuoJV05hyRUx1JwMLrrRILVkcSIMBOfV48gz
	 QgFY8fQJWDFcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 856D8C41612; Tue,  7 Jul 2026 22:20:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Tue, 07 Jul 2026 22:20:02 +0000
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
Message-ID: <bug-221721-208809-OMa5koxSMF@https.bugzilla.kernel.org/>
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

--- Comment #5 from hurryman2212@gmail.com ---
Hi,

PR for Dracut-ng is now submitted:
https://github.com/dracut-ng/dracut/pull/2491


Sincerely,
Jihong Min

On 7/7/26 18:53, Jihong Min wrote:
> With a little more of thinking, I think this happens due to the
> initramfs building tool not including xhci-pci-prom21.ko when
> xhci-pci.ko is built with the Kconfig where USB_XHCI_PCI_PROM21 was enabl=
ed.
>=20
> Can you check your initramfs file for whether it holds
> xhci-pci-prom21.ko correctly, or not?
>=20
> For example, with dracut, you can do something like:
> cat <<'EOF' | sudo tee /etc/dracut.conf.d/10-xhci-pci-prom21.conf
> # PROM21 xHCI PCI glue is needed before root/LUKS unlock when xhci-pci
> is modular.
> force_drivers+=3D" xhci-pci-prom21 "
> EOF
>=20
>=20
> Sincerely,
> Jihong Min
>=20
>=20
> On 7/7/26 17:03, Thorsten Leemhuis wrote:
>> [Switching to email, hope this will work]
>>
>> Jihong Min, it seems a recent change of yours is causing trouble. See
>> below for details.
>>
>> Side note, but not my area of expertise, so feel free to ignore this, as
>> I might be sending people in the wrong direction and it's just a hunch
>> anyway: wonder if this is another of those situations where the driver
>> needs to be in the initramfs. Tomasz, did you have SENSORS_PROM21_XHCI=
=3Dm
>> when things were broken? And if yes: have you tried if adding it to the
>> initramfs or setting SENSORS_PROM21_XHCI=3Dy helps?
>>
>> Ciao, Thorsten
>>
>> On 7/4/26 17:41, bugzilla-daemon@kernel.org wrote:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=3D221721
>>>
>>>             Bug ID: 221721
>>>            Summary: prom21-xhci does not allow to use USB keyboard in
>>>                     plymouth
>>>            Product: Drivers
>>>            Version: 2.5
>>>           Hardware: AMD
>>>                 OS: Linux
>>>             Status: NEW
>>>           Severity: low
>>>           Priority: P3
>>>          Component: USB
>>>           Assignee: drivers_usb@kernel-bugs.kernel.org
>>>           Reporter: marx.tomasz@gmail.com
>>>         Regression: No
>>>
>>> Created attachment 310416
>>>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D310416&action=3De=
dit
>>> output of "sudo lsusb -v"
>>>
>>> Hi,
>>>
>>> After update to 7.2-rc1 I was unable to type in LUKS password in plymou=
th.
>>> I
>>> tried both of my USB keyboards, but both of them just briefly lit up the
>>> LEDs
>>> and then seemed to turn off. Bisection pointed to
>>>
>>> commit 364f4a55c661641c02c86a849f0608d8fc3c0006
>>> Merge: e4b4bfaa5090 1c2b66a7d725
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Mon Jun 22 12:09:47 2026 -0700
>>>
>>>     Merge tag 'usb-7.2-rc1' of
>>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
>>>
>>> and then
>>>
>>> commit 9e896b4a48c4e815956d28961448041c80ad5a19 (HEAD)
>>> Author: Jihong Min <hurryman2212@gmail.com>
>>> Date:   Tue May 19 09:07:31 2026 +0900
>>>
>>>     usb: xhci-pci: add AMD Promontory 21 PCI glue
>>>
>>> After setting SENSORS_PROM21_XHCI=3Dn and compiling kernel again, I'm a=
ble to
>>> use
>>> my PC normally.
>>>
>>> CPU: AMD Ryzen 9 9900X
>>> Motherboard: X870I AORUS PRO ICE
>>> Output of "lsusb -v" provided in attachment.
>>>
>>
>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
