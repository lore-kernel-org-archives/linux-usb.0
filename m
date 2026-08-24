Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF331FFC48
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787599130; cv=none; b=l40w5SR6zBJBn1psvzqviY8kS/LdYI+WctCVu6UGtI+jlSBU2Ouv7c7EmRGuUSsm6PIWv2VpEJWJBo9cpPWqyAJbcmIKrmsU87aCkc1L/3b+j3npAnGmS7MZaHBfCtZXCV7Oynk1NyIuTrvJIwPnoCpybDlhw/Je/W96xPpP3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787599130; c=relaxed/simple;
	bh=Bml94H1y7h5FyBSoDmf/tob5kU+dJ7UJTFQUGsleT3U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sKmLznJpAwlKma7VxHmkSTtWxnAfsxoJgZx9C9GI4P5Oanj3QZLSoNELlsxn7Uk/8+IeV+ezhUTJjb9b6IMNHnIsrC5/4ld5VeLxUZslHbU9NSqf8Xr6nYp0pOQUT11ceMGwop0DPeZXvhjMmLua8FUCmNmVCwWipma+DtW7+3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0H0Rm0L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0H0Rm0L"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C079BC19425
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787599129;
	bh=Bml94H1y7h5FyBSoDmf/tob5kU+dJ7UJTFQUGsleT3U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i0H0Rm0LzMDda2+0JLL+pOdi3GPKS8YlhEmDYeWyonWRPxI+GzotU7jXtpOzBcT13
	 TiprbNP1wyNoA+zM+2FWPVVOYpeixY0pnImLRIH57lkQ9+PeGvBI8FBtNw+OMa2hJi
	 2zokOvzd2+b9ntYIBQqLGgjUoWujWRzgz4A0+7HvoBDEypur4qhbmWxHivJ1eN5sEj
	 Y4FpiPmzXkdqAVFRXcuEQczFlXnveWYx6d/9LuBVs7wsbczUVBous6sMw2botkLuah
	 t8gbSlnEV54eqqe36GXbnp10tqxd94xoHRblMr4hwTIWzDhyNzUhEFtZFPaZFpVtIU
	 4r5PtyUF3eCsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2D0FC41614; Mon, 24 Aug 2026 19:18:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Mon, 24 Aug 2026 19:18:49 +0000
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
Message-ID: <bug-220936-208809-BVP9bawpmY@https.bugzilla.kernel.org/>
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

--- Comment #7 from Stuart Hayhurst (stuart.a.hayhurst@gmail.com) ---
To be more specific, I still see:

```
[  160.064098] xhci_hcd 0000:77:00.0: WARN: xHC CMD_RUN timeout
[  160.064117] xhci_hcd 0000:77:00.0: PM: suspend_common(): xhci_pci_suspend
[xhci_pci] returns -110
[  160.064124] xhci_hcd 0000:77:00.0: can't suspend (hcd_pci_runtime_suspend
[usbcore] returned -110)
```

But the first line seems to vary. I've also seen:

```
[ 26.056278] xhci_hcd 0000:77:00.0: Clearing Run/Stop bit failed -110
```

and

```
[ 26.056278] xhci_hcd 0000:77:00.0: Host halt failed, -110
```

I also still see `[  105.189845] xhci_hcd 0000:77:00.0: bad transfer trb le=
ngth
4 in event trb` on `systemctl suspend` or the resume, or sometimes when a
device is plugged in.

The new firmware has fixed incompatibilities with specific devices, and it's
also a lot less likely to completely stop working now.

I also see the suspend error quite often when shutting down if the error di=
dn't
occur in the first few minutes after booting. I've seen it on a friend's
machine with an ASM4242 (with a different motherboard). I've also reported =
it
to my motherboard vendor (MSI), but they seem to be having a hard time
reproducing it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
