Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385583A7193
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 01:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227797; cv=none; b=CCWs5TQ2YeBa1IaDTuSki6uzi6iB/wFYmECUNScRPtuVAt6bL+jtgLSt9+65XriaWEceINr+3c7QXjx6/cpN9o88AhAxcc4gqrEXCLmfOV+XrR5fg9fpGVDY26gVr/j2yXwrhQ5D2I+Krrq4v3ThgcGT94cpvgFY/6RVd2kcFf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227797; c=relaxed/simple;
	bh=M7GiaLPpnRZQJw/hvjmsvX/xmPSfEbVu5crtTr9jGkM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PUnYCscQkpLUfXJS45mdup9Nz9fMPnVaIamDgn4y78DVrVN+M1XrzRmlkjXJubxLVNjs6zO23toY69AsTPm4o3AjWJ38kanfyxHdjj0krFL0eIPF2kXs7H1zMnqL6JAw82iJlue6ZEZjJfdzweiK21FCcxGBSDUB3ySezyhmAfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wn24Ch3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wn24Ch3I"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF6E6C2BCFF
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788227792;
	bh=M7GiaLPpnRZQJw/hvjmsvX/xmPSfEbVu5crtTr9jGkM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Wn24Ch3IeCj6jGWqAzUyhL9kYpql3HAsp5w8MPGenQiaGTZCnrrDzc+WrF/58j0QN
	 5UtxFsaFEGDw6+RY3/WJn6jYfzBNfcUCwjwrO6mT3NPYdJ6pq38Y4rxdFnXlC6aep+
	 RQv86YZGJRrM+eGYQuUmT5ZO++/JiMwDetrD+13rJwW1TSSL8PDFamnwtP4Pkjpodl
	 KETsnkvkIve8Lb3hc0uvuW4kXuYwcJLXQXVpNEPmDIE0OT8q9a0ZJXdw/b3h+pVMYW
	 S9RvhF7TENLY1OMEENltzYE9iCcwJab0lJCcKbS9V45A1waZm8VV6An7tLM5uOPFyo
	 Z9KfiFDzMr0DQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF2D2C433E1; Tue,  1 Sep 2026 01:56:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 01 Sep 2026 01:56:32 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-Ng4q7tBjMS@https.bugzilla.kernel.org/>
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

--- Comment #37 from Andrew Skalski (voltara@gmail.com) ---
(In reply to Lovekesh Solanki from comment #36)
> I have posted a patch series that addresses
> https://lore.kernel.org/linux-usb/07435e6b-ee30-4c85-8c8b-
> 0ce3a4ead1d9@leemhuis.info/
>=20
> It should fix your issue.
>=20

I applied your patch to the 7.0 kernel on Ubuntu 26.04, and here are the
results:

OK: I ran "adb" in the background for about two hours without any problems
BAD: The "sleep 0.1; cat /dev/bus/usb/002/001" loop still triggers the lock=
up

For the "colord" test, I used a patched 6.8 kernel and Ubuntu 24.04 due to
differences in colord behavior between versions (the 24.04 version opened t=
he
device nodes O_RDONLY, but the 26.04 version only tried O_RDWR and failed d=
ue
to EACCES.)

OK(?): I tested plugging/unplugging devices for about 10 minutes while colo=
rd
was running, without issues.
OK(?): I repeated the colord plug/unplug test with adb running in the
background.  No issues after 10-15 minutes of doing this.

While it doesn't prevent the lockup in all cases, it does improve things.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
