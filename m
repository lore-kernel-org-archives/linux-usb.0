Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD322C234E
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696937; cv=none; b=ELZHL4BI6JPtjmQCa4DidnZAT27fMzSWJzZpc/sMMEx3aqmv0GXj2ltKuid4EcWj2sCd2ukB7HIMvC3j3ZrPkbEXRu6Zn1E7hdMhP8bsbUNDZIvDDhw2V2EZvwQ+CHSWptCG3oF6sz/iVNLhDmcMVbab4nf1BR1QjQMctPo1VOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696937; c=relaxed/simple;
	bh=0Rc2/Opyx/spD1Td8Q9W1QcOWot2o7QMbzvW5F85ThI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C9RFMf4jovLQs3RlHPmuxMo6hu86twqD7Z17UrEYIB16l/tA2eObgfmh7u9eVWNOQ4IALaJNy7h2D7DPkNw/6udxcoS9cDpY1YAlAnJb8XKco/oEcdMXGCzQBzzirZCIrT5EPa6PYKwr4qWObm3cvvxshsG21pqwviTIWiyXScs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLaH/MgV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLaH/MgV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4B75C2BCC6
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 15:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783696936;
	bh=0Rc2/Opyx/spD1Td8Q9W1QcOWot2o7QMbzvW5F85ThI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dLaH/MgVUWYJqiG0uqDAp63LDEU8xhsb7mfKMpTU63w6l/mXS8LpSckF9tNnbg9pm
	 JvzUx5wd24U1CbeWIadXlgoqzlmoz0OfSmJZRH2APnqKYRd18YMfOAwnUta5J9v/m2
	 HIIm7grtDn3FtvKMcFkZqDotPPpGtTiC09ZlUBgQTAPA+QkSUZ9yzkGqah7Xuxc3Jb
	 fiKBF5whdfyXyxvNSqyYCG6KNj+SK8R45xBCrJFpM3haPy2v7rxcBGSV9XcZDI6AlE
	 3sf2sRIFBG1Uq8dE/Ufs7ElxCOC/AROjcYkk05YSZjiNYRiZs1c8x3jHuerF4XT/tP
	 y1tq1KS6BxmFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9AF8DC433E1; Fri, 10 Jul 2026 15:22:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221721] prom21-xhci does not allow to use USB keyboard in
 plymouth
Date: Fri, 10 Jul 2026 15:22:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: marx.tomasz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221721-208809-XANgqJamEO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221721-208809@https.bugzilla.kernel.org/>
References: <bug-221721-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221721

--- Comment #6 from Tomasz (marx.tomasz@gmail.com) ---
Hi, with "xhci-pci-prom21" module added to initrd, plymouth now works. Shou=
ld I
close this ticket?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
