Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7F73783D1
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839552; cv=none; b=qisyd5DSF3zCY18uWhqnainFhIYHntBg0w/144/w3y/pfQQnJTYBnSdlGoP2A8DjuTSnq3a0MSDVRT/cd8ozFxuKtWCYPj5ugzgKSR4IK+Yl4XnAm8shhiiUhHIkEs0e+I7KzUDXQ87hAgYfzbSmn/1fj9nVtSfTv83qGCpNEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839552; c=relaxed/simple;
	bh=7sA2rkIUGoC7zOVq9WvR/2YXvUw6U7F07GbYEg/An3M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HcyFWKWW2tpM7KpszQPfQCF4A4pq0ooUqPSWDT6KCxmYrOxOQJW9GxQlL5V6m/Lsf9MCjPgjxIQc5f89v12xyRoCpnEhhPOFStWGaNEufPuJius93pu4sJ7m4p0EHRt0mjM96ZnoFIBVUgrikPFMfO+tI5sLZGGx9d8R/2XL6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTwfzqYq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTwfzqYq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50DC4C19421
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839552;
	bh=7sA2rkIUGoC7zOVq9WvR/2YXvUw6U7F07GbYEg/An3M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LTwfzqYqzKzwsI6eet/GZHtiwR66ecHVslK2g9OjIGgOgk6OLOtCQKhZXEwZ1J5D5
	 ngVINIrtDttVtWUcZGtHmdzmTPxM02hT7XXGwgMMeclnWS0KJhv2qic2arYJtflvbT
	 +JhP6unM+VgGYsdhK1wAwd89A44Xv/DROP+VbBkCokHBYu6I4h0cPlmI9NXlPB4/EW
	 AaOtYUIXEqknotY/+x6SFfbVu+yhK6/kraXmUq4XrLOMVM9vyxl9Ef8qqCVklZIQSH
	 AIarZBrzmgWc/6fv6vXhwTfClBahMYZKeOyZ1zr8tmM7gJTtzb/nic2U2P3a/XXbIX
	 ADzu/k685phDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 48B0AC41612; Fri, 10 Apr 2026 16:45:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Fri, 10 Apr 2026 16:45:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-ZK2QbFWGJE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #4 from DaisyTheFoxxo@proton.me ---
(In reply to Micha=C5=82 Pecio from comment #3)
> There is also Unmap/Read sub-channel in this log.
>=20
> By "hang", do you mean that no I/O happens for 30 seconds or some other t=
ime
> before these messages show up?

yes

>=20
> BTW, if you run (as root)
> echo 'func handle_tx_event +p' >/proc/dynamic_debug/control
>=20
> do you see anything new appear in dmesg at this time?
>=20
> That would point to some "action" at xHCI layer, though I suppose it's al=
so
> possible that nothing interesting happens and the device simply never
> responds to some commands under some circumstances.

I have been having difficulties reproducing the bug recently, I will let you
know when it happens again

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
