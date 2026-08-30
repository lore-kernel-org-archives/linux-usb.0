Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F108C4086A
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788087928; cv=none; b=F5ByVS4DaQGlrm8fGtqhuIEdgo5PLLFDWZMyWtWItIpKRpjYbw00XBbZvFLbe3AMvQVOIRfJDWV85J3VeMkDs3wq0ULZCb3H0PT7P8G6jm+OpK6DLPft0q/GT2p3jPdfdF2ijs3S7Ibeuoz94LkvhC0VjN+Dgy9ryUIwKn0SBOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788087928; c=relaxed/simple;
	bh=U2b7LRX/BTUhzdCjs0L5TVAublRN9bouxckBn7xG4gU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mwyOx9T97RkVZM5iCOmlE/X7CgWqipqNmygMhgQIcx6f6Z8cRWWkbcTy4wubqYJUlTJa37V23tNcJIFruox8e/Ibf0rd79xfu7Hj2zpAlbF39OLd2SiCs01INS0cs6e3IVd/vM4VVGoUWpFybyNCKNSXpOKlGG1Jl/PVv0PRIBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TY2zzvlk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TY2zzvlk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B5BAC2BCC7
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788087927;
	bh=U2b7LRX/BTUhzdCjs0L5TVAublRN9bouxckBn7xG4gU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TY2zzvlkv7UheMdS6275rBLMKnX71ibyqpgaIuyO+/6xl6RxOFPBhlmacWcShLJGP
	 ytY9JzV4VXUNhkmrfIwvUld7n/IxMPSi/4oQUg9Tshitq8ffk+rrMxKWyzFH+IcZZW
	 Ttcv+/ifv6/QABNMhuPiC7PNAqzZ5EfC3zR7xiw7klUXbu2/5UhnoXDn/Y4Q62wHMW
	 rs4a4bAKpYWOUnqRvrc5E7L6+nNgD+StSWY0i87YIz5eqMa50W8ehlV7ohU/F/l0xL
	 d/bMSv6zpI+iKSqBTPs9hPCUAbg6T9Lp55VT3yGxBE9llkcH2BaVZUQypDHRanNaiW
	 6MJwk8Pk2DxqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4B333C41613; Sun, 30 Aug 2026 11:05:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Sun, 30 Aug 2026 11:05:27 +0000
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
Message-ID: <bug-220936-208809-dzLcf1Clq0@https.bugzilla.kernel.org/>
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

--- Comment #10 from Stuart Hayhurst (stuart.a.hayhurst@gmail.com) ---
> Passing quirks=3D0x20000 parameter to xhci_hcd increases the timeout

I still get the error with xhci_hcd.quirks=3D0x20000

> Does it also show up when suspending the system?

Yes, but it doesn't seem to be consistent


I still don't have a 100% reliable reproducer, some boots it's completely f=
ine
with no errors until shutdown if at all. Other boots it fails within 30
seconds.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
