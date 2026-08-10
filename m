Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810733AF667
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 09:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355249; cv=none; b=okfqhuULAsoahPK3VB4ma9EY2DlmKGsWPhb51RxHw1LgDqv7mT18hCYOEGkUyw8z0mNOxZaAhSOwEGmUqgW75RlMnawM+fgGrCDfsKpujAWCrlZtUmK7JxHUFWtJw4IWdcJ44UjvaZdAT8NRRQoB52lFQFAWjsNAupdlEyPUp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355249; c=relaxed/simple;
	bh=nkZ+R2UOtBKsZPfK/IOLnFMw8VnIYdPXzZH+29yp6D8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fwseVjz/kX+FwdfeE2jBrxtD9vRkFXCFC4iXrR8cXFXaQUSD2iiyUqztB5jU46tLZyS/W5Y1oom1WN/T8iOA71pFmjCMyiNGuPmZlHzPMOnS4nX/vU631fRAPZZgri38zv10R4hlK5oke8fJUdX7E8HPd8C8FHHulqItF4ZiTb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdHjGOzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdHjGOzx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F9A7C19425
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786355249;
	bh=nkZ+R2UOtBKsZPfK/IOLnFMw8VnIYdPXzZH+29yp6D8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rdHjGOzxVNzafpJaKxNBiWv58ofiuZ0EezR8GmhKk1CtGTOjbjwe51v+OmcOs6UMo
	 H84drkny3BX9ZlQ6Sn125xH64ZCAy3bL3sm/zG4UBScM17RfVFJtS8spz+imtw5Nxm
	 qNkr0KxwGGUKAvXODd2ChmRYZTRzoQzEFWF0qq7YF4vdDlX4g470Q3rlp51KBudm3M
	 xafSdND73tKy20yOQpG7p83R6i1f5w1DPC4irIuh4bsY9mDkV7fxctGo0OMedfytH1
	 NWcGKt2pg0GcgzL31h5lFwovs/vJUblHAyWwGNsa27lEk2SI07T6KLf2uHP2EUzI8b
	 7daEkgheSIS/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 34A56C41612; Mon, 10 Aug 2026 09:47:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Mon, 10 Aug 2026 09:47:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220193-208809-3XyDDA0j45@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220193-208809@https.bugzilla.kernel.org/>
References: <bug-220193-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

Wei Huang (huangwei@kylinos.cn) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |huangwei@kylinos.cn

--- Comment #1 from Wei Huang (huangwei@kylinos.cn) ---
Hi leStoppe,

Thanks for reporting this and bisecting the regression to commit
4cc01410e1c1.

A fix has been submitted to the linux-usb mailing list. It narrows
the OWON match from USB_DEVICE() to USB_DEVICE_AND_INTERFACE_INFO(),
requiring bInterfaceClass=3D0x05 (Physical Interface Device) as
reported in the HDS200 USB descriptor. This should let the VDS1022
fall back to the generic usbserial driver as before, provided it
uses a different interface class.

The patch can be found here:
https://lore.kernel.org/linux-usb/20260810091322.2201740-1-huangwei@kylinos=
.cn/

Could you test whether this resolves the issue on your VDS1022?
If the VDS1022 also happens to use bInterfaceClass=3D0x05, further
work (e.g. a probe callback checking the device string descriptor)
may be needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
