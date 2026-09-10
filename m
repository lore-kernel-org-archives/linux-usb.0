Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377AD3E2AB1
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054551; cv=none; b=NhANhRIsy7qjiGtrKDvegji1CqOno2RuiY2XtKLWFKithnUCtBRcrD0zXorpPF8POq7WB/1IFKAy1+9Dx6iCCXVP979U2+6q468NBaSEvgijXVDUVDfVjMVY6SJ1dU6arV8EVXxzAO0wiGpdhCl83TwRPzA4xuuNf+gowDn/goM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054551; c=relaxed/simple;
	bh=mINC9wuk5w2pBAaP+rXLMgllfTpENgg7Y94mWha5EIA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BCrk6++x0x9uRwVmfd3jYqhAXsfqLSQp6RWX/OTzogSYNttl2K+v52k6PZ/X4Ti0wbe7X4ktNNtgk9eBFHwwkgzaqnmfxRcB0kQpueAEQ3x/OEecX4pC8BQT1oC7jYN3dB10TvExL17h4KyzKZVbcKeyIf/6NQxBdRwcJSGrl1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeDUdiMs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeDUdiMs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCA73C2BCFA
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789054550;
	bh=mINC9wuk5w2pBAaP+rXLMgllfTpENgg7Y94mWha5EIA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PeDUdiMsPxq9b/V6hkXVFe/g30OH0Tlwc9uKOaD4lLJKcsbYYraYrK0eluoIvCzFM
	 i9oe+8FavYVPK1AmcoP9xBqcWS8hsNfgBdEqYWrBQi21723daQuTvJJ13rp9ur4Ih3
	 e5kLo31LMd+cm4JaXOfDex0oa3qUGq8JC+Ghh3zBrxPt5Sn/wppwUa40LzE4WYKtsi
	 RKsggA5f4ey19QysT0Y9L4etRaYQ9AhaW28X8ja6Q4AvStshNASoqQnuIIiTOY22NV
	 d/cA6ovPGF+csY6O+E14yVimJSRa8ddKPZnR6jQTuGSuy+FV5sUZ4z2tMStSFJ7e6S
	 cYcg4nqsW+IXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A18BDC41616; Thu, 10 Sep 2026 15:35:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221655] Barlow Ridge TB5 tunneled xHCI (8086:5782)
 runtime-suspends to D3hot and fails to wake on USB-C device connect (Lenovo
 Legion 9 18IAX10)
Date: Thu, 10 Sep 2026 15:35:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-221655-208809-yhUOnOPOvS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221655-208809@https.bugzilla.kernel.org/>
References: <bug-221655-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221655

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |andy.shevchenko@gmail.com
         Resolution|---                         |INVALID

--- Comment #4 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Closed based on the comment #3.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
