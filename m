Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90694C954D
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 19:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526954; cv=none; b=bBmWm1Hl8TmDnGdijwohD1rCYhgY1yTTDi7o+E8CfXcG27Pyzrl5xcr/37YmV0xVhEulFNduwiQuul3u0RhpRDcMScvotturvSk4rTJZ2MRm0A+eBDmY0vxtp6xVTQ9+kT88BSsEA51N91eNRHGYT/TuaNpylYi/Yue7r34M64E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526954; c=relaxed/simple;
	bh=njybTAjmTTFET/gaUgVvcojm+Mw66oCLvw2OO9m6WIE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ejGth0FzJ95RHK00bcYvSnMytmNU3b6c6gZwQeVaGrFp7Uz+3sx4MgdYPkdTPqMqIteIZFiP7B0ngYpTmfBBWzsSv3KPeEH1t84FAZq6wRTrJNLkh9TkMuBnQR6s2d9erPVUUND8fbziVEj6yNr6GYKT+qTQ1VK4YnoT5ZNXC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qfp8HBae; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qfp8HBae"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58D4EC2BD01
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778526954;
	bh=njybTAjmTTFET/gaUgVvcojm+Mw66oCLvw2OO9m6WIE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qfp8HBaee5XH90vhNBzsNuH6BjFMSLKXYTMd5pM81mfGVCSX/KSL6iBVXRCSSntgP
	 Gr/a6O75R9mNGMn5VItbaFNWr2RuE+IL45oJdZKb3sdow9h07LagunTs9H7EbQ1/vY
	 iXBtLxdho780nbMr9Z16Nn0BB9VmwYsr3n8PQeQZuy2MtpZBGjhPYlMw5z0i9+7rKc
	 ZwRodJww3DHZYgxSQP1sBhv+B1i9LQoTl+F9xSQYZ1em9BGf4tJtuQSpvxwnfOB0LI
	 VBCWsvDcd3il6lYKSYmsmijUkn0ntBkLFLELlUnZxIR3Ra7FYSYBd9rA3ygGc7yYZi
	 CBkWEq2RYMHlQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 519C5C4160E; Mon, 11 May 2026 19:15:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Mon, 11 May 2026 19:15:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-220748-208809-xmTWCsGIHy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #28 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 310090
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310090&action=3Dedit
testpatch set and check xhci frame id correcly

-Aligns frame id to full frame or esit on first urb,
-Always sets urb->frame_id
-Calculates valid frame window as in spec
-checks if next frame id mid stream is within frame window, print message if
not. Does not alter frame id even if outside frame window.
- allows next URB to be queued mid transfer continueing mid frame (endpoint
interval must be shorter than a full frame as well)

Commit message and some comments needs cleaning up, but code should be
testable.

xhci tracing shows the frame_id of each queued urb, enable with:

echo 1 > /sys/kernel/tracing/events/xhci-hcd/xhci_urb_enqueue/enable
echo 1 > /sys/kernel/tracing/events/xhci-hcd/xhci_queue_trb/enable
<transfer some non SIA isoc transfers >
cat /sys/kernel/tracing/trace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
