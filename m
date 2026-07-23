Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2683168E6
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776680; cv=none; b=RGTmMd54R+MeY+syVtOAXpAs488+J+7w5UXQ7A7EhuQ1wt403GuS10IgVJIj2zR0hMscwBGpNj4fTeyRdsqZqp9Dqf+j/BEHYWNEkTgbI1yfsI+x82lYqNcOlq2oa67TBVPbq03JVKzUDdmVtYxgGscX6HiLMeSmLNMlDjcEB7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776680; c=relaxed/simple;
	bh=rc+8zH9oXdQFUGz2eT5vls5smjZFLz68W4xPCVd1uig=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q4RgapA4QH3uSZJm6gsJVEUd7RUto+kMZ7VfUFwK1jrZhBozylPWlq+aLq+01cEAjHWGpsoQf1vawZSIFRKOSNGrF1ZwfK3xyspvgAS1dSAbujCSK8T8y7zWP8zR5H6YODsfe1s4QS04uBysuOPq/VgcKCNxSslGJTfgMwGAa9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiCWyN28; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiCWyN28"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58D98C2BCC6
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 03:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784776680;
	bh=rc+8zH9oXdQFUGz2eT5vls5smjZFLz68W4xPCVd1uig=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hiCWyN28srJ5/wTFmKKI1fIgoNtB8jSqtZ/SdL76gxNhmz4em/Bdqt1sHI0q6jjdj
	 56BmLSJbwJgWUlZCs5X8iTGeeor8dCSWfxnyD3cF6eQo6FKAvq9QeLL/YQD3SOpNgP
	 +XpBGHL7TQJ1gW85TA+CUsmbmewYKCPutT/nJh0WeW9PT3eX2F2XCULp32So+T1Dfb
	 B+fv3jskVcnux18DyNHvi+OxtPNzePP8UJiENGap2lI1jegbWWUJMhlOis324uD0Vf
	 YLfc34XE4toWfFk9rfoKIXYnqgq1NuPRsH5a66n49Dvlmng1d9bdt5hsHingf0nUxJ
	 tC5qH3l3nwVag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 38F59C41613; Thu, 23 Jul 2026 03:18:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NzhdIFtSRUdSRVNTSU9OIDYuMTLihpI2LjE4XSBB?=
 =?UTF-8?B?U1VTIE4tS0VZIGtleWJvYXJkICgwYjA1OjE5YjYpIFVTQiByZXNldHMgfjEv?=
 =?UTF-8?B?c2VjIHVuZGVyIGRHUFUgcmVuZGVyaW5nIGxvYWQgb24gUmFwaGFlbCB4SENJ?=
Date: Thu, 23 Jul 2026 03:18:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: m.langas55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221778-208809-6uHVKxUc7z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221778-208809@https.bugzilla.kernel.org/>
References: <bug-221778-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221778

--- Comment #3 from Miguel Cervantes (m.langas55@gmail.com) ---
(In reply to Micha=C5=82 Pecio from comment #2)
> 6.12 to 6.18 is a fairly large spread, and it isn't even clear if the bug=
 is
> a regression or perhaps some CachyOS vs Arch difference. And the GPU uses=
 an
> out of tree driver, hmm.
>=20
> IDK about CachyOS, but Arch package archive has 'linux' (non -lts) packag=
es
> for all major versions from 6.12 to 6.18. Could you start with testing th=
ese
> to find which release broke things? And try to use the same NVIDIA driver
> each time, or (preferably) see if the problem occurs with Nouveau.
>=20
> I would wager that resets are deliberate (HID driver seems to do that in
> response to USB errors), but that still doesn't explain why USB errors oc=
cur
> due to GPU activity and why some kernels work but others don't.

So I installed Linux only about 2 weeks ago, I went from bazzite to cachy os
and both experienced this issue, i couldn't recall bazzite history but cach=
y i
went from 6.12 base download to 6.18 upgrade for a few days into the newest
version to test the bug, this is why i posted it like that. I cannot otherw=
ise
confirm if its inbetween all versions at the moment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
