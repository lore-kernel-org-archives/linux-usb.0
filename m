Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212D93E6DF4
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191437; cv=none; b=MhRPwoY1jR/0NWIlWfnswvEyDGtWxcP1Yt9pBObmlEeMxzT4GuRaUDM7h5Xe8Y5w1Jhk5D+pzZVqFvwV8WbFBa2b0sTX7VnQCbbYrCOrtgh+v25LWSnO8u6WfDf7jrWQWnYbqX9UmSjB35YPhy1jvy/Hoy/6WfMBi4EMLjEQ2jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191437; c=relaxed/simple;
	bh=6NgqgGLZjWKhVjM+CDk/loMRvck9LgcFj7a5C5V5sH8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KJEbu86+zfgNkD6j5c2qdRL0FidIqHwVjdxclhzO9Ohd0lFi75y1gpr8rDB7OlkT50h4yxjudmdXIcvbBNVy4zm/TtA/StKPQSPjdOblhDwvRTbHYKcdVkm9igKWzdYnGSF7eWgDJ6WCZeaUSduquewjzAfMJclq7hFn6mFiKZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbCGupv0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbCGupv0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7DCFC2BCF5
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790191436;
	bh=6NgqgGLZjWKhVjM+CDk/loMRvck9LgcFj7a5C5V5sH8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TbCGupv0taufPCTOgQ58e4720EbeZszvPZObwMpDIsijH+2cU0oHHWktqVIjgqfCa
	 BWaCn77z7LkQers4qXlJlh3KnoQMTTCmATA4tjR7XgLbypiJdXwVg9uGSpE9jtsb1G
	 9CliwO1IUDR0p7hurVrgMQNhseaP89WUTDN2qoa4SZ3iiR4/V/eadaKuxhnLmbvGkQ
	 0Z1K+/wKCZlfT5SbKU7W212CBQxGycQywX2HhynVDc9H5dTtTdOZiksHpfIGUwYRCO
	 DoGAqbCHwVH2RFCPF++NigDVTKbLO1fQRG1qdnPz8ochj8xHNSc0zlmu0Ett/tKij+
	 50AwPFXW5hycA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC368C4160E; Wed, 23 Sep 2026 19:23:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222049] xhci_hcd: USB device on onboard port fails to enumerate
 (error -110/-71), delays boot  around 70s on ASUS ROG Strix X870-F
Date: Wed, 23 Sep 2026 19:23:56 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222049-208809-EJKDwRMWQf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222049-208809@https.bugzilla.kernel.org/>
References: <bug-222049-208809@https.bugzilla.kernel.org/>
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Did this device ever work in the past?

It's probably Mediatek Bluetooth, they get stuck in such state and need a
standby power cycle to recover (disconnect the PC from power for a minute).=
 I
recall some discussion about this on linux-bluetooth, but not sure how far =
it
went. IIRC some users had luck blacklisting btusb (which implies that the
driver puts the device in the bad state), or maybe it was with Realtek chip=
s,
not sure. Others found that some BIOS settings like "ErP ready" cut power t=
o BT
during standby and thus "fix" this device automatically.

IIRC the delay itself is not the kernel's fault - userspace started quickly,
but then it chooses to wait long time for enumeration to complete (or fail).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
