Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99CA1F37D3
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572619; cv=none; b=BEDEWuaPgpvw+e7Fe0UoamSh4wnrxnKkYD6Plt679RfbOJwsug5GCSuzCaxTv/c/efZDYVI2hudPZn2XFr/k0fwokujhWT82o4B3Ou5zb6oSSs88nIGXLX3tVar5IojPeCC4VD3fuWTtPmevP/JE+LjMrg1g84MfPZmmIGly14I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572619; c=relaxed/simple;
	bh=HVr+P1Vpf8UuCyt3cSQRARYc0iiOuQvO+74S7i878e8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PEJdOgAz6FWAcdYrtkHpZNAzaUPdJyU7lffDZDptH62MF4VNKiQY1YmBNRn+ja35o7oZdbkHIkm+4XH0js3ZJuGL4+sx3TGx/PAa8cxo3DOweigL5aKmMjATP43Aqdvn62WKjeuzJz2CeYng4wsKcCIK7KBmTzowo3LnSbwNEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrtBMfeQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrtBMfeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77AF9C116D0
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771572619;
	bh=HVr+P1Vpf8UuCyt3cSQRARYc0iiOuQvO+74S7i878e8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UrtBMfeQ1Za6COuyKuwlu4QiZF9Bf/7wOqhojl21CoG9h75x25msDnFJz3PRg0whl
	 CflLO76Da+DAE1d4D4/H7VsUFnqNh6Soe6igqMBVurnaXHUXOEGGW/KqEPwZSLz1A0
	 Me+2uJET3l0rt7jIwpypDycv+kSBatW6cyqzdbd8vxewqD2VrYa+tz8KcQjcVZjcBZ
	 BWX01vuW7hQXiB9ZeWzEUuKV8qz3iloGdLOZsHyZWy+s1ScpEwMy0iRTv0guXqMeq6
	 YbO2socQsIHcHDot9ydLTs45g45PWVC39zTK4VMOQjDzEn10QdGsxx02wEO4auMHeO
	 WWXx2CJBxHTxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B785C3279F; Fri, 20 Feb 2026 07:30:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 07:30:19 +0000
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
Message-ID: <bug-221103-208809-lCkNczeZws@https.bugzilla.kernel.org/>
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
I tried running this and all ioctl() fail with EPERM because the usbfs file=
 is
opened read only. If it really crashes your system, the bug may be not in U=
SB.

Chances are that it's a panic so I'd try to get the kernel log - serial cab=
le,
netconsole or something like that. At the very least, connect a PS/2 keyboa=
rd
and see if the lights begin to blink.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
