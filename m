Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796632;
	b=y7g5/PqwBww4l9u2abdevydGCT2slGdUoZm5yaC4JjKfN6DcOKEvqcG1wl+2eYNhyHUb
	 K0XaLJQMCebdv1CoRnWXbJcs5Gwdji7VCyInR7GE3TzlrZ0OJC3FGXUwqT6PQEkggdVCa
	 Wk0HV4KzwOys3XaE+TX3MPLpng7Q1q3dc2FtbFuEiyQz9eQd6FU3BjlhYsJSYrW+c1fnF
	 c/ZmKfA6VqO0bVueA52OkyBxtpG0Pr6SNlfrDqrmrinclFRZZv0MWh8m64SVJx4FHr71x
	 8bvpH5BaL63AlWgQnjWucHCQ1qXzss4kWttJw22gad8x2HwMWXZKPZQXT7aYdXCV+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796632;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=aNd6Jyd2P0ZV3fLr1GP1PNHEgqzuIjo+FXMNwfxRY5A=;
	b=pez4MjHlnSWN/+cLLq1mGR0xNFRaBy6DSJp+w3k45dc/ROMNB7CRBFxQhuHuQLmKBCyz
	 Y0jVaBcntUYshyMJ9jgDGUuuO0vM7kLs5raes1tgwSwEebUr5U1ANzuIflNGSZ5akF+Zk
	 BbX5cPTv4Hi4It5EGuOcbbwcRpeuxqYYg7LzsBhc5s3x05IAakNQCT7ILWTtlD52erNgy
	 z5XxpKpM5xNhzHv/IgZuMUJW/01URyHIjNb/nStBkJGbaivbLjxXw3u0gAld2rrOQ4bFw
	 dyeTBqVsRYOQLfO/Y3k/4JtWBM4Kso6NtZBOOAMSxWD9rPz2WjmmeaAU7qsq2E6meEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIvJ0o2A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD9606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 02:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIvJ0o2A
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AFEE1F000C4
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 02:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794796632;
	bh=aNd6Jyd2P0ZV3fLr1GP1PNHEgqzuIjo+FXMNwfxRY5A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MIvJ0o2Aixs2RbKuEnwCumfSSnzvafl9l47Qx3vNUyPLdkx+IMRDMA0qUhXi+J9xO
	 NbQvRFthx7Kt5osEkPFq+OnpU3+xnyBIdvwfyt+yZA65sME9PWPvreEjncMzYv1Mye
	 WM3f8HVYbO1JYP4SKUbvAavvc+Z76qefR+M8dt0OFluuBPbyfg/qRgNUBnJp/LK7lV
	 /EfI9i5b1iFT8O0xRT3TCePyDGOi1KLGLZQLHaabDptlg95/94tw7QnpGWFWbUkqQc
	 RjCS+Z4v8rgTbtrSmm4uAZ5fZ8iMOTHhMP8ilq/xkJ06YCD6DDMdCt+5UMHJeCFKr0
	 5j7uCQXOCgu5g==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 24E20240040C; Mon, 16 Nov 2026 02:37:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219977] usb: dwc2: memory leak of hsotg->regset
Date: Mon, 16 Nov 2026 02:37:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daway320@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219977-208809-fivi9EeG4U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219977-208809@https.bugzilla.kernel.org/>
References: <bug-219977-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219977

Wei Huang (daway320@163.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |daway320@163.com

--- Comment #2 from Wei Huang (daway320@163.com) ---
Hi kakapapa2,

Good news - the fix for this issue has been merged into the mainline
kernel.

The patch was reviewed by the Synopsys DWC3 maintainer (Thinh
Nguyen) and merged via Greg Kroah-Hartman's USB tree during the
7.4 merge window:

    usb: dwc2: debugfs: fix memory leak of hsotg->regset
=20=20=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D8c7d5b1f34f0

The fix switches hsotg->regset from devm_kzalloc() to kzalloc() and
frees it explicitly in dwc2_debugfs_exit(), mirroring the equivalent
dwc3 fix (commit e6bdf8195b4a). The patch also carries a Cc: stable
tag, so it should be backported to supported stable series in due
course.

Once you get a chance to run a 7.4-rc or newer kernel (or a stable
release containing the backport), it would be great if you could
confirm the fix. If everything looks good, this bug can be closed
as RESOLVED CODE_FIX.

Thanks again for the clear report - pointing out the dwc3 precedent
made this straightforward to fix.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
