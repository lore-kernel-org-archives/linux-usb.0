Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E4225788
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 01:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788054631; cv=none; b=F6fcDYjWLjU0CGTekI7hQ+UdYSsTtcXd39WZvQnSHtVRnGTk8lkrTOzOlKLFodsD6NajygLst1tx4AITPjnIdPSgekfu2zWaFTh2QluDrcVcYukgfcDv0SHZticehPI6W8C/FiQoTZ63hItpcsdA7ZK5filj9Qff61ESGAC/lkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788054631; c=relaxed/simple;
	bh=jTpk5SXBQIBLi5wPENuLfGKtp4AxzWkuAVdCJuaqOKw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XwlVtlr4+m0R9xkHJJN+qjOKxhDrXzna1SEINn62sMHy6hIQNQC61NdXOxcuzsdd6UaDzqgL44ti8RQRoGmKuj96EIQatFHTgtDoRBaCDuXGNIqCMvPQJ11wzCef9kD0Q4L9D1cUNtK5BUPme/fnFdzyZxBI8oOxPicOI7XnEoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHDI6anY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHDI6anY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3914C2BCFF
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 01:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788054630;
	bh=jTpk5SXBQIBLi5wPENuLfGKtp4AxzWkuAVdCJuaqOKw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jHDI6anYWttRRSA/f9z+D9eBr8+QXBQlbMEasH3bbwXC+jgh551Iva+x9Uz1abbXC
	 sXSJzSOyP8OmhZGP3zCc9yngB1/C1BxWza+ihB6qXBdCMAFQ3TkKWQf3a4TKMAkgFg
	 QqbaeP5HTuFWASbE8Lpd7FAj9vA2g7nRkXkON1nzouGVMdMCkRs20cZ6tUZDJKKhlA
	 IVrzbwPJMYo+ukjxcd6LJG8vLlsBTOn3jUCOsEsJwx68T10GGgb8Cj8dvd2DjOR++b
	 nXSqQQFxfbQ5Bv/LQ6qwAUr0sMan6u0lJHJIlRANAN7o8k+nHci2WkPmy/BvYNTHgN
	 xvwX740rMBffg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C99BBC53BC9; Sun, 30 Aug 2026 01:50:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Sun, 30 Aug 2026 01:50:30 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221103-208809-GSJNSGXWay@https.bugzilla.kernel.org/>
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

--- Comment #31 from Andrew Skalski (voltara@gmail.com) ---
Created attachment 310754
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310754&action=3Dedit
patch that adds msleep(10) to xhci_resume

The attached patch adds msleep(10) to xhci_resume.  This small delay seems =
to
have stopped my machine from crashing in all cases (adb, plugging in device=
s,
cat /dev/bus/usb/*/*)

By adding debug logging to drivers/usb/host/xhci.c, I found the line of code
where the lockup appears to occur.  Specifically, when this function is cal=
led
by xhci_resume().

static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
{
        ...
        crcr =3D xhci_read_64(xhci, &xhci->op_regs->cmd_ring); // this line
        ...
}

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
