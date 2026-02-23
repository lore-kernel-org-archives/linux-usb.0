Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B138337AA6F
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886026; cv=none; b=Q1v0Q+VhLRS6CYXFSuseVQX3EA/CiFaFRYcsbzYXnViY06hel7xn//v7Bu0N8B14iZ3XWwR/4ifLMf3ED2Jpl7esHTdM8dI0boBmoH6Il+riZX5oUAX4FjdDVIT/AUwyzqXs/kfZu79hnnD3UtDmY9vd29S1sqBM/uHfKgTTnNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886026; c=relaxed/simple;
	bh=we3fL+ubwrqmXQwZNJrZ+tH8MqLuEGNfv2xLQgpsz2o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UFZnD4hVbPbfhM0JqUPMVo4E+pPig9mLPp0ZpOZkjqFa5i+0iZZRuw3TWKBaHXeZv1F0ImIEPRt91DPB7qINtGeN3Ntrd/JAqX3jOm19XRIthMOPEeYxzKr9WIpWJoNKM7hCCBOqTL4QDpla23wahoIanYDj9kA2hq568yjjJMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flB76zhJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flB76zhJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5163DC19421
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771886026;
	bh=we3fL+ubwrqmXQwZNJrZ+tH8MqLuEGNfv2xLQgpsz2o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=flB76zhJv6u+Lzn30zcd1BEuoM4bkWJ5BJrbNWPzcHYXgB6gDE1NZ5Uw2NL/WkUnA
	 wFLucfgAvkNvSygefwaq9uDAeAd3UU2t/znViCRHoQ0SPf1VquqjyAYqKuj2r5fTBo
	 eWrxuY88QYORkAIVrNpN9Ez8HosY99fkyO3ZAZh/FrdHrlKC27WlkEhKrVLGELWpPt
	 OCp72CLdXmOYrVzy1viCNRedxl6pzQLep6DGphq1BNr/60WEeGDyKmzXGVDex6r9uy
	 2RD48OLc1VPVb61X/AYVwymZVkOuNBSfJjqQYZuvgtR4hWOHfoBmxIOz+zxF/ZU/Ua
	 52vFLtgu5xzPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3E683C433E1; Mon, 23 Feb 2026 22:33:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Mon, 23 Feb 2026 22:33:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-1XRkjxC92r@https.bugzilla.kernel.org/>
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

--- Comment #18 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
My test got to almost 30k iterations with suspend-resume cycles, no crashes=
. I
loaded the CPUs with simple "while (1);" on each core.

It seems the problem may be caused by a failure to resume the HC. The driver
should handle it, but something goes wrong. I hoped it would be a stupid nu=
ll
pointer dereference and netconsole would give us stack trace, but no luck
apparently. I tried crashing my system with SysRq-C and netconsole (over a =
PCIe
Ethernet NIC) delivered the panic message just fine, so not sure what happe=
ns
here.

Could you enable dynamic debug and check if simply toggling power/control
between 'on' and 'auto' produces the same xhci_suspend/xhci_resume messages?
Would this be enough to hang the system, or is it necessary that somebody w=
aits
for the HC to resume to perform some operations on the root hub? Maybe it's
just lack of necessary checks for dead HC somewhere.

What's the state of power/control for those HCs which aren't causing proble=
ms?
Are they also getting resumed and suspended under your test, but without
crashing? That would be at least one optimistic result in this whole mess :)

There is another bug 221073 about some AMD HCs dying on resume from system
sleep, may be related. So far nobody knows why it happens.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
