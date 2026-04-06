Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B394239E9B
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489705; cv=none; b=A5YSDvzyJDDsMqAnq+13OoN1pJkbdIwBCkBwaGt2CJk5Iz9BuiLRpq0O24cMNEP/1O+zwzfw5Au0zE2fqDi6kpBLtZffP8PMbn6fb2iAJuqzKNV37iFa6Xkj0G8U8wcPFjmG8BFtnrFsRsIfNUdb0TbLa20F6h1jy2POWgy2Y/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489705; c=relaxed/simple;
	bh=12BkPi2nOKua3ZC8yaFDrEczzZJAsM4VpSOS/1MvJXQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p1rZU5yHTQWWJ4xoJ2F7KrX84wpJaWaVph8H0ckwdP4P4LxFMU1Lz2A1DriOcPejDgwaKPfyKXrAnafxjDvstPMaNH7JBxrtqVzhbjN8hOUug++o0B5+zA0IfUzbbBHOExkXduXof1VEPMXC2SS0MZl0BcIrZ58nzxfQrgfnLjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sV2qewk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sV2qewk+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A338C2BCAF
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 15:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489705;
	bh=12BkPi2nOKua3ZC8yaFDrEczzZJAsM4VpSOS/1MvJXQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sV2qewk+O7RVDMkxjP22osECWTSk6XlMlmaw6ulWcvUp0jxS6o/6Wd1ObxyZ//Yel
	 /WTGvReCJhxobyob1ZXAXZOps7xGkQwGw7YoK2gX8dD4V6iVVQakx0xHbrxwHAW6Db
	 xRooSnALlrfVNWzNSSizkwgkZNd6/xGEs86uLAbt6nI8JtBJQByKpEB/sliYGZNU90
	 H0O0ad19D0xbn4H3vy5Pm0r3Xm4XZFaEyPhge65weg7rN0DK5Va657QQ/f88rfe73O
	 OrqxlLTZ+OavA6zFYmg04p61+wzTXGZd+YCQcLZi0EFyARxh4UHGhWdsC9W2r+xG8P
	 dX01FrmL7zmiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EE7D3C433E1; Mon,  6 Apr 2026 15:35:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Mon, 06 Apr 2026 15:35:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-WO1083w2K2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #15 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to manauer.uel from comment #14)
> Something I did not notice before appears in both new logs: after the Can=
cel
> URB and Set TR Deq sequence completes, the ASMedia controller generates
> these:
>=20
>     xhci_hcd 0000:0a:00.0: Spurious event dma 0x00000000012c50b0, comp_co=
de
> 13 after 13
>     xhci_hcd 0000:0a:00.0: Spurious event dma 0x00000000012c50e0, comp_co=
de
> 13 after 13
This may be valid HW behavior and sloppiness of the driver, if something is
submitting long and/or complex URBs, though I'm not sure what such URBs wou=
ld
be doing on a bus with only hubs and HIDs. Or it may be a HW bug. Either wa=
y,
these pointers look like it comes from some other endpoint.

I could look at it out of curiosity, I think the simplest way is to
zip -r debugfs.zip /sys/kernel/debug/usb/xhci/0000:0a:00.0
shortly after it happens, should be enough if the bus isn't very busy.

Actually, if you upload this with the mouse recently connected and not work=
ing
we could inspect all those URBs and commands written to memory and check for
(or eliminate) most possible driver bugs. I suspect it's a HW bug.

> The wireless dongle itself also has Cancel URBs on ep 0x81 and ep 0x82
> during its own enumeration, but it recovers fine and no spurious events
> follow its cancellations. The wired mouse does not recover the same way.
Weird. I think the receiver has a different polling rate (1ms?). Do you have
more mice to check if it's a consistent pattern that things only work if at
least one 1ms device is connected, or something stupid like that?

Are you able to run a patched kernel? Lacking better ideas, I suppose we co=
uld
force 1ms polling and see what happens (don't bother with usbhid mousepoll
option - it doesn't work on xhci-hcd).

> Would it be possible to have a quirk that applies to a whole subset of
> devices (in this case mice), instead of one specific device only?
Maybe, but you suggest to disable a power saving feature everywhere for the
sake of one old questionable xHCI controller. Maybe there is a better way.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
