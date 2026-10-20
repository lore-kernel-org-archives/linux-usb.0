Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792494739;
	b=qME4+4kk88OxZVyTORT7zR/T8r8elXRICVsBJcaPnN6+4yk+UmLfXMAigX7vzRRrYa58
	 IJGJX7jMAPP9gm+fdoMSRqYZs4fceIQe1J2y+erkK8WN1sxngrrbTEXMophuQGTnP3Lgq
	 kGNab4/YGAmhMRtdrzLt8Rol1VJ7TvWmcV4aKg/6/8Escn/OqmrZnuk5HXdYnf8+NLmmC
	 VFZDvbHQCU9445mLqmz5UXwH7p3PAKt+0s17NLzYM4+6RrSGMIwrwiYVVNX7HYSXPYXOb
	 oDGakIiV1sruOFg5+YpQgKD4YDUjrXw+E2kucOWmyMc7npcNJZ8jzfP6E4hGEiEuU2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494739;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=CvQncf4ELsGqyjTZcmBaG+gi9knS5RqRe7qt9YLh0XQ=;
	b=z4RVaxJJvq4gE8E5F9gYEDk6qqXeDloENZ8kFM+ycB2lmjL0vcCcgKpor2s4EPBtYuxH
	 dKq24XU3bDWAmX6l1u+YJg7Ecf6eJ+O1RscnkV4EbFbo6Cyv6yHPaGJOvJ4T0KfGgEYbs
	 LaNLhQL1IoJTyzbpzB15gUCUNikZbTa+N/v7RQL7zpVmMeuXGFm6wPk4vDWW+3TXNEbWT
	 Bs6qSF5OqfyDF9ybkXjCEWKa3Y7sVjMwInXNDVlv9goJ6cVO3YOaT3/KvjFvacfQSsIxY
	 52XlsG5wsPC1FJKIJ8N7hNS2IK1gI4QRpydktoL/mHOxXgQxapMKbzSF1rbHsQ4F9pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pI0dK44Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BE6606A320
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pI0dK44Y
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C2C25771
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792494739; cv=none; b=P3FFNMse3VR17eMQBG9tmPlDje8ci0lu+mEHE1bf7mPzXZsPsvK+0krAbCBXEJMxKjy4BRyf9MRY7e61GRq3y/1rNaNgElyEPzJk5ddf5fNM/PMyLxfmIsMLyHDrTjuQ37mc9WpDCak3NqaE4uoppEgXCdhDkLcVMLSmALiyM2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792494739; c=relaxed/simple;
	bh=CvQncf4ELsGqyjTZcmBaG+gi9knS5RqRe7qt9YLh0XQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GogF/8aqBWV64qORd3S4ErCdrpGHCAkSdu+PIfuI38PWXhiHZhMf1wJbBtnGes26hoR6cK/C7NsIj+CAbIgAJzb2UOd1mYqbkdJv8m5L9tzIXLUZA3Tgrp+Q5WMe/1nwFlcEXaAf5vD81K4CKb1KB9gJ+x6C5CFgOYuiFM3O3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pI0dK44Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B27FC2BCF7
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 11:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792494738;
	bh=CvQncf4ELsGqyjTZcmBaG+gi9knS5RqRe7qt9YLh0XQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pI0dK44Y67bU1y4vFWzTUs48i0dKwDKAQXqjvj+5bnY/sI+VargysQglmBXwW5RPk
	 D7txnD16H+1mcjwWMe/mNFJUPatNU77VvcRfXHs42+1b3DP9w6gbxioKkf2Gi2o7QF
	 7Of+3kLWZyLHo/I0LhuXQ9NA7dWiLzH5kcbIIqf9bW2Spb2II0LI7hJ6I2p69fyLS8
	 SkJz69trk0sEINX9kB0MSgQLK/OnJOJ2IeLJDYXMmCOimGjXatz+dIUatamEkAlmOt
	 iVBiuaFOe2S/Bk32+7rV5C7zzII7INmmhKt0CtWrNT0x0VkcIRVT/2hWsV19EdyQwy
	 IyzD3LgDD74wA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 672C9C41616; Tue, 20 Oct 2026 11:12:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Tue, 20 Oct 2026 11:12:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fastmichelebezzi@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222047-208809-LeibytkJ6p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

--- Comment #11 from Michele Bezzi (fastmichelebezzi@gmail.com) ---
Ok I'll tri whith a 6.* Kernel

The USB i was referring ti was all the set un USB of the motherbiard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
