Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156283FE359
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 08:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844070; cv=none; b=HMfHeS9PEUHcXU4MetWGo6ej/N+xEu6iiKUOeK45Ak5zT+p8PzcfUtmsrQFkDsEz46VLK5nXWEwBEIu4bDCGAQhqqeYCH9tLAqbmKr98EcvS+fdpjY6mUnKPy7CxJgXsPAgO6aTsHk2LAwaNrTtJxjVmkMOLhoafaciLWUeabZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844070; c=relaxed/simple;
	bh=2JYqKH/qgHsmP24gJEISTRIP9JD9wnQqSq2ZhOOF3qk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aHCKEKv86/5LeaKtlSR2k8KMB7UrFv2faMbNKxfFMZGHhKmRLkeO8GE1tbQ9W2myYBsGdUuRz8sTD/wjAA1yxGpUUlgRCGxUIPZLJfNt6nVMpw41TnkOjCPFfj0rzxl3LiSprZYRWIRnTlcBXFM2idX3JbbcDXTSfRhl2lN8Jws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWbRoo0E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWbRoo0E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AF8FC4AF13
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790844069;
	bh=2JYqKH/qgHsmP24gJEISTRIP9JD9wnQqSq2ZhOOF3qk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TWbRoo0Emrw5qEbvRS8KXR0XZZbEaVmO6Z7rbaaLWp1kE/t5fYtXDx5p3ncmuWTFt
	 WE3q+wQ4b14WJ1k0W2oTV5ZB3aqOmc3zqgt4SIjgqPlDIVlJ5SHpoa1/57Fz803qnJ
	 FwfH5SSygsyV4MWZdCSyAOJYWKFLXc8RqiC6WUyR4F2rfq0WGQw19glNt8GI6C3L/g
	 ug5D40JG5jX0gQWFDQZ1aBpWp1aBsLK59GqHWF0ToTL+JqSTITt67ZhkDeLYVBHTN0
	 oatxQryPQNjlS25fo2/UB+8gOWYVOCiuz+YcT4rdV84W+NbrdIf4Bp0hXg1iTPeZi/
	 FjnjmjZhDaZfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56D7AC4160E; Thu,  1 Oct 2026 08:41:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222000] USB: xhci_hcd: Goodix USB Fingerprint sensor keep
 resetting
Date: Thu, 01 Oct 2026 08:41:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rppxj178543@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-222000-208809-kh2SbFFxus@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222000-208809@https.bugzilla.kernel.org/>
References: <bug-222000-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222000

rppxj178543@163.com (rppxj178543@163.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rppxj178543@163.com

--- Comment #1 from rppxj178543@163.com (rppxj178543@163.com) ---
The repeated "reset full-speed USB device" messages likely come from
usb_reset_device() in drivers/usb/core/hub.c. The device 27c6:6090 has no e=
ntry
in the USB quirk table (drivers/usb/core/quirks.c), and autosuspend is enab=
led
by default with a 2-second delay =E2=80=94 the sensor autosuspends frequent=
ly and may
fail to resume cleanly, triggering a reset-resume fallback.

Could you test this kernel boot parameter (no rebuild needed)=EF=BC=9A

usbcore.quirks=3D27c6:6090:kr

k =3D disable LPM, r =3D force reset-resume. If this stops the resets, the =
fix is
to add the device to usb_quirk_list[] in drivers/usb/core/quirks.c:

{ USB_DEVICE(0x27c6, 0x6090), .driver_info =3D USB_QUIRK_NO_LPM |
        USB_QUIRK_RESET_RESUME },
Also note: disabling power/control on the device alone via udev is insuffic=
ient
=E2=80=94 the parent hub's autosuspend can still affect it.
It would also help to know whether the resets happen during idle or only du=
ring
authentication =E2=80=94 that would distinguish autosuspend issues from a d=
evice
firmware problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
