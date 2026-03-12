Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2D539A04E
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336638; cv=none; b=RfRrY2S7n9JXGA+o6PpubzT1t+F/HB13iOrVoAxIfpuCTEGOfNq7zjqtqmi/4s8pZvaMElnBwIlFBvYx4nJBSpbpnnaC5Zsi9IF1XlKMAEsASzWT5kACUxjnsdxTWZFJ3PhUSWXu1ULwkMWB0btFHEbO3kA16aXvDwJAXhqqVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336638; c=relaxed/simple;
	bh=W49QW7M4WFumM80s/nF7FQ67GFQPYo+wjQz7zxHx1wg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LMlIePVZQpJ8kiVXRCPiEki7W8kJLTTUhX6jGS+uLmNdpbpqy6O7AuPq9p6BTR1AuDIX72fQLiQq9gjYtb4lHpvWrKl/w3K1gAGYFHDHFM4Rp0Ah/8+dyBlQrvgoxoRiZssTk3Vw6/3DMNCApw8eHoPKZVqsKucUCANtSEVtmrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcU2qcbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcU2qcbN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39EC3C2BC86
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773336638;
	bh=W49QW7M4WFumM80s/nF7FQ67GFQPYo+wjQz7zxHx1wg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jcU2qcbNo9kjwbdcnI6TTntMN4JJFcFrGQ2WaB5VujIFvT0Qq9rR39c07kNRo1ri9
	 U9epNb/IJbG/cu1PCas/RkHWk8mtcDxQ6JPBiNYgO3ehviFf+djzZ1KJWEYizJ3FKT
	 IIsG2ufsI/O7wYotAhy1Yg1NWY6J5xom4T276jLzL0q5jC6BMmimq95rDO4CHc9Cui
	 3ex8eoEycOnp3FUOxwcqfURzMitWunmy5HUkrepqbjLT2QN/8AQvkgcrqw/QyccunI
	 +aM9+3pm7B1d0cl3xkF/0XE5GyqBQGNTmC2Llhc9mnXD9EWxBsNYCj7y5gEADfORMy
	 O9wXsDQUes9uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 31FCFC4160E; Thu, 12 Mar 2026 17:30:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221216] ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs
 usb speed
Date: Thu, 12 Mar 2026 17:30:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221216-208809-vKznTAkHlz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221216-208809@https.bugzilla.kernel.org/>
References: <bug-221216-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221216

--- Comment #1 from gregkh@linuxfoundation.org ---
On Thu, Mar 12, 2026 at 05:15:47PM +0000, bugzilla-daemon@kernel.org wrote:
> Hello, my new capture card works only in 5gbs usb speed, with deepseek's =
help
> I
> applied { USB_DEVICE(0x32ed, 0x0401), .driver_info =3D USB_QUIRK_NO_BOS }=
, to
> drivers/usb/core/quirks.c quirk and now it's working at full speed.

Can you send a patch that adds this entry to the kernel so that you get
this fixed properly?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
