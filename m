Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A512514745
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473552; cv=none; b=GQsy95jC2dWH9VPKFL9sFrX9Q7bx4w6GUFAANcWfyopz1ixmB9sM03AH8p1qLevtYmTM0LcApCRoOtg9d7F+k3pZSZZxMrZ+BcMnBgohcepfw8Gi0Hrv8QwaQCLWWDEfpyMjlq/DhyOwZbPpLVeyM4b+DW5r5gKkJaD4E+fmJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473552; c=relaxed/simple;
	bh=VAp+oYCCjSNtSAiMBPgaAiqZy4tZ/TVBYG6Vp3jGdX0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IkiXYcLzsLATtfO8ehhw6EIIDMk3V4b/OqJp/b9QXdnnITwqK9IAbczShUCnrjql2HbkC9DNbKQWbX/q4RbWhh1km8UPOAK82zVJB82v5LO4JfL/X+USMNWrbza/ZeE8pNZFKIcgcvRMSo/e1kCISk02y4vAAKFoi7ThKwsI74A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mq3ZaFHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mq3ZaFHf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1BD5C2BCFD
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 22:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788473551;
	bh=VAp+oYCCjSNtSAiMBPgaAiqZy4tZ/TVBYG6Vp3jGdX0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mq3ZaFHfV2Dd5iLyq9Ku8Ipy8vPcJVZYEeTVvvW671JUh6ce4iM+Yr/34nH/CP0bj
	 lxly0q6R12hgzafhE4ooFFYKYu74gdIO6HR9HxNzVOlAsIKFD2NrvM/ncReX6xHVNS
	 syVGBnyvBnEr/QDXhuuUg3X8eKFA6BOc8k0GCdGfCFW581PmSx5ovQgx4X3UExJ7hf
	 FlmkHGp1pIPy0zMbX+EoogLT4gocMUsUSjP0TtLeTp43sOD21un1OIkVEdfbjkWjdW
	 IRzUXKUgNElSX70fHjsEo0ObuJgX5RgPShjEBck3pGVywP6vczJ8p2hA/j83XYkVCi
	 HuN55v0+5eysw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 91EC1C41613; Thu,  3 Sep 2026 22:12:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Thu, 03 Sep 2026 22:12:31 +0000
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
Message-ID: <bug-221103-208809-Ot4yT54VPr@https.bugzilla.kernel.org/>
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

--- Comment #41 from Andrew Skalski (voltara@gmail.com) ---
Created attachment 310779
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310779&action=3Dedit
Test program that crashes by writing on/auto to pci power control

(In reply to Andrew Skalski from comment #40)

> I wrote a program that opens "/dev/bus/usb/002/001"

That was a typo, I meant to write
"/sys/bus/pci/devices/0000:e4:00.4/power/control".  I think I'll just attach
the program...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
