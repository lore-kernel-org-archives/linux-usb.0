Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1C4B203C
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191507; cv=none; b=VGTCTO/WNimTSoPrx3gnKAvIoM8Y7xHCkeDLLLP/I67aGyQyIgxa67YcpkbpgcNJJt9Aet2ip29YPQ1Rfi4QmivYN5cPqA1uebVdECL/hEC+lJ7cXAfKZUEDJfJpaC+xMIB8TpFX/BJxs7e4tyjRJQQ0aXP7gU5JzPhwZeOYLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191507; c=relaxed/simple;
	bh=YWvMmPloiPAXbnv9J4/gjUmr5lyfPF72HyHHzTWZ/Vk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DA1zoNJAYs2cxxFvOVS41nyCtr7CNjZk6EVajFwBYaU/biImWfkNFGE6yUnaaNcuZsOmMboCqVslLl2a/4nWmJU5/Z8h0Bg+/A4T2+ZgKJ6thvNc4Pf+EAX+/OTqT5uzO3vR1w2iKoqzZeV6nP3e6jaVEIm0/9IDL4oQ/LOzPG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLP95mZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLP95mZU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2348CC2BCF4
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788191507;
	bh=YWvMmPloiPAXbnv9J4/gjUmr5lyfPF72HyHHzTWZ/Vk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FLP95mZU4paiR5R5BeBp2mNECHHkZpk3uFfPpJIzg3xZYCQhG1hkX+h/RmdyKl+4E
	 5MyNxWyKaApip0BNwwyP6pNqw/6ywGb+PESUwVjQ0quHH1JbWPjuNyHpjXVRbjW1DI
	 AhXlAgmA5Wc/eJn5XZQolcnmYGJdKeg/sodEA0caZcKa2tlCAtiY1Ugbr6hnAVFv0l
	 cDUIjk5v+irL4Qg+nwVNxLKhiZB8itatkxPsvf8DymW0slS8ECRZ+EI2ztkvn11PJB
	 ugANHhSvkEmae9JkX2ErxyWtkDvMNYZfAmy8qdIUfTvDc8YZfTar/q37QuAHlgNKia
	 vPhBdMPDjJO8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13C09C41612; Mon, 31 Aug 2026 15:51:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Mon, 31 Aug 2026 15:51:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: voltara@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-njhe3vydcw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #35 from Andrew Skalski (voltara@gmail.com) ---
(In reply to Micha=C5=82 Pecio from comment #34)
> Makes sense, I only suggested the alternative placement to confirm that t=
his
> line is really the trigger and not merely a timing accident.

I went back and double-checked the effect of different mdelay/msleep
placements, and I no longer believe the xhci_read_64 call is involved.  So I
will need to do more building & testing to find out what's really happening=
.=20
(Thankfully it will be much less time consuming now that I have my rebuild
streamlined.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
