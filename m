Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6FF2D23A6
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782995; cv=none; b=MYE4NuVJCW+Xzj1j4em/q4jncPjQmkkcGkgQYdWVJ9jWfasdQrugyRZu+pVvos1zY6zVTHy1W8MbX2F5iTFPiKA9P6/Pc5MLXShOacrjHpTlzImEcSGZ/xeeIb0+giX9wuwxwgNIfDC1q0bj/5OjUFLSTssT81dB6q6lJqN+nN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782995; c=relaxed/simple;
	bh=MMR8Kg68RaWCatfrYwL4nQZYPjeY+nfcKs/f7Ecwad8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t0HHQBG/tCbcVLHzbKISaIVqGS8E9L+Rew5w58Hz58vhxdH2p/9s6mnzGiBDP3kBJynTSdjWzx8uOEOznuxFKBXIWJ99yVvmLfTBjdalRtVo6vb724BxUIMzoqn9Gr3O+L4fmWmdCjxwKgbsyVsTfDqoFN+GuQV9bOOZlISBj/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5dMpMxT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5dMpMxT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 160A1C2BCF7
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 18:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785782995;
	bh=MMR8Kg68RaWCatfrYwL4nQZYPjeY+nfcKs/f7Ecwad8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C5dMpMxTW3nhDAg7aLenGJgjLoCJFeURyi5NEyEF/C/dIuMEZqWxqDsVNk5H3qZxP
	 MP3Wi5YsdSDrgD+ag7A7L/xI8B2mfxyitsx293WGRYHQFaiHfdk8e3NOFLp1C1v4Nq
	 Nvkw2Y/nEKMGMIVWfEQfD3N3QG+EQs/5vPu5NjFLvRbYZJNcvcnqRI7EXqQmpH/Obg
	 nw3jWt9+eFVf1ff1s2OR/AqsN0+i1wRu3jOFUMnyeoDIz1QqC5c2PN+1DLpGxrtNHR
	 Mhd6syDf1zb63DOdMWVG9qg7I1ocY1GKLSoFxga1Xr46j1KQptVybOTaDTBA5ey68a
	 gEK0+hDxuVZfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E9CCFC4160E; Mon,  3 Aug 2026 18:49:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Mon, 03 Aug 2026 18:49:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lovekeshsolanki00@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-Gmk16PfM6r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

--- Comment #16 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
(In reply to mayhemandcoffee from comment #14)
> I've tested the palm rejection.
>=20
> It is a lot better as the cursor no longer jumps around when I am typing,
> nor is it clicking on stuff. However, I noticed that occasionally, a
Seems like the fix is working.

> keystroke would not register while typing.=20
The patch is highly unlikely cause this. I don't think this would even be
fixable in kernel. Keystrokes all follow a different input path nothing
hid-multitouch touches.=20
This could be a hardware/firmware issue, you could test running evtest on
keyboard node, if evtest does not list the unregistered keys then the device
didn't even send them. But if it does, then it's likely libinput or the
compositor.


(In reply to mayhemandcoffee from comment #15)
> I should also mention that I have a recent version of libinput and the qu=
irk
> from commit 772c1f5ebb4a4122d55fc392a690056d8c55809d is already present in
> /usr/share/libinput/50-system-asus.quirks.
>=20
> [thienan@thienan-pc libinput]$ sed -n '45,55p'
> /usr/share/libinput/50-system-asus.quirks
> AttrKeyboardIntegration=3Dinternal
>=20
> # enable "disable touchpad while typing" to work with z13 keyboard
> [Asus ROG FLow Z13 2025 keyboard]
> MatchUdevType=3Dkeyboard
> MatchBus=3Dusb
> MatchVendor=3D0x0B05
> MatchProduct=3D0x1A30
> AttrKeyboardIntegration=3Dinternal
About disable-while-typing being greyed out, that seems to be a libinput is=
sue
and should be reported there instead. Touchpad might be getting set as exte=
rnal
by libinput and disabling the feature.

I'm going to send the patch after slightly revising it upstream, please let=
 me
know if I should add a Tested by tag now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
