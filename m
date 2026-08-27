Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542D259C9C
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 00:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789902; cv=none; b=nqYBXJw9LLg2D6biCK42L8yW5m6Z13QpimhzynJQ1wUBUI9m4rI4uHJf9Vp8FpVsKdbuzj+ed1KDJPtTt2QRD49/krui/ikZDZPfLNqEOP3xFybMb9jYBg5r3ysE49N6okA30ZnpCKjBy01rTMHbhs2VFcpvqDV1PTfHIPh3MDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789902; c=relaxed/simple;
	bh=txaV0Yx1LpqfFzoxuh95Pfymkl4nzpNGzDci6aTOHS4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TMjoSK58oPCLOuel72Av0lebkjWyFyGYP9HK0QAWAT8cvDSnEwHSmh8u0cF4v3wG/lPhjW/boQM1wOnp9RGIyB8amk0yu3j6Ti3OuYy9EVbn3kwXQTcIwk+ivNU3vTUD1FUvWoeBKd2laZRm3sTp66dgZ7wI3XTIC8vk7lswd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O16TzT6M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O16TzT6M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D045C2BCB9
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 00:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787789902;
	bh=txaV0Yx1LpqfFzoxuh95Pfymkl4nzpNGzDci6aTOHS4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O16TzT6MyrXVCByfZmCG8kNaOwbPpSwnZYAI4xR8mSp2tbdstTfcelTsHJ9xoMnCC
	 uNyOWZfjKWi+cdNyJjoI7J5s3c/OstZ8FufLJcWjqceGGvSD8DU/AYQHutimFyKyac
	 aSZHTUcXh/V8GykuxAhU1cHcKdBsDElQMGWC9KGkr/t651XELPRxZU6GYCAFUnAHEi
	 xgbKB/GKoaCY+xQ+Vw3x0sv7u0WgIDZ2R6uhDJqU0YyiPMkJa7NF5cpLKuxwYR7qPO
	 lKN0B213KM9oZji43f99G/UjTK11lP90u9m8cQ+xNwisII4gOWzJ6xx7IqldVJqJGr
	 GokOCgI8OdofQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E737FC41614; Thu, 27 Aug 2026 00:18:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Thu, 27 Aug 2026 00:18:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stuart.a.hayhurst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220936-208809-kxf35QnXza@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220936-208809@https.bugzilla.kernel.org/>
References: <bug-220936-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

--- Comment #9 from Stuart Hayhurst (stuart.a.hayhurst@gmail.com) ---
Hi,

Thanks for the suggestions. I had small amount of time so I enabled the deb=
ug
info and it seems that it does have some successful suspend resume cycles. =
All
the debug info also made me realise that the Steam flatpak wakes up (all?) =
the
USB controllers and then they autosuspend again, which is what was usually
triggering the bug on my system.

I did manage to open and close Steam without any issue maybe 10 or so times,
then I unbound and rebound the controller and it immediately failed on the =
next
Steam launch. So I suppose sometimes the controller just behaves (totally?)
fine, and other times fails easily?

> Passing quirks=3D0x20000 parameter to xhci_hcd increases the timeout

I'll give it a try and report back when I have some time, hopefully at the
weekend

> Does it also show up when suspending the system?

I hadn't noticed it, but I'd only been able to test it on boots where it di=
dn't
immediately get killed by Steam autolaunching. I'll give it a try again, and
also try unbinding then binding the controller again since that seemed to g=
et
the controller to fail on the next suspend / resume cycle (Steam launch) wh=
en
it was behaving.

> Are you able to compile and test patches?

Yep


Stuart

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
