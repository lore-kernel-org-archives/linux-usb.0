Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F098489894
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792388787; cv=none; b=URpk4x92DTY8jGLxdAM7yjsGTclgSVo+imtGgK9JF16GIdRmnzxS698cHWoKuu1J7UA20F+Zenl2ZZQ8SlNKniDnkXZVSRZXEVV3rKw/Vx/KYcNzOhJBYgeLeBfy3y9w/j134tkfmCq8zke+TfWoOaAMTLE0hbsRAhxDK513ruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792388787; c=relaxed/simple;
	bh=hPWlIsHBukgyF2J3tuo3WvYIn6WRXTDyLgn4OrBHH98=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uMU+3++w1OEXgE1pU4gEw+ioX3qohTnHVesYappdC2P2WsxmdNsI8BfxSQjQFB84F7Qk0F8atHscBtmGVG7KxF7K9ghf09+jTH6ygZMeeDytA5q2zOltTZaKUdUEPhz6UqJGucREZjG8awQaM9Q01ex/94wJnqqtbYCvQj2bk2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUvrm9Hq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUvrm9Hq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7505C2BCF4
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792388786;
	bh=hPWlIsHBukgyF2J3tuo3WvYIn6WRXTDyLgn4OrBHH98=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SUvrm9HqYH82z5iUPM7NgdVARqm6RTtoUil4GZyfA4X9FhvRHHg+27It4Ra1Mx8uk
	 VGjZsZRP4wSQTYN+99je1q1Bqr8qxPSD2MMU7ZNM99V7InGvr936S1za46C6EZL8AD
	 iCmlsWLebIdYwQz+8atOdcHPTGW152QRTHuF2ZQEfCysL5AiQQVPe8dBD154FzufBN
	 YszhmEfpYwgbQxqdQElUAbFCjIEZ+3JoFtVZvw9YzBb7YMV2qAbrRWqzcDyvMtaSgd
	 Hijdfh2zvS836hUUP3GpX5MCKa5dom5tjnD/rAE1ArZl2OESEIda/j4Y0lcgAe/zMn
	 Yc3t4t/LghCAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BBE25C53BC5; Mon, 19 Oct 2026 05:46:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Mon, 19 Oct 2026 05:46:26 +0000
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
Message-ID: <bug-222047-208809-9KBkO5Nmyg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

--- Comment #9 from Michele Bezzi (fastmichelebezzi@gmail.com) ---
Yes I tried unplugging the devices (usd ports) and restart: the first time =
the
boot process is pretty fast because the system had to remap again the ports.
However next boot in returns to the slow process.

That's why i think is a sort of regression on this type oh motherboard....

------------
I've considered a downgrade of the kernel.... but is worth it? It's Arch no=
t a=20
LTS dystro ...

-------------

If it isn't possible to fix the problem for a while I'll have to try force a
reduction of the stand-by process.... I don't know how...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
