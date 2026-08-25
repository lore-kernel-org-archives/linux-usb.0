Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028FD13777E
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787657488; cv=none; b=DVDB/hUevfn8EsTK1um0m7FWxXl358bKyeyGHBIpDRwfBQB2C1w13kist7VrkNe3hsDVAt77aHTHspR8oH2mwSOvsvGfx5G1Ua3PcQVV/ibjN1U+KUymBG8Ma5OWZkQtvzqCwyH3AjyNTicO1ZWxtbSWco3PqiXT5BmhmHcp1yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787657488; c=relaxed/simple;
	bh=A+VI6FEKedo1QLCIxNChC2rNT1vVIplncqNzyqLRPeg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E56BflF0r/jTB3lwgn01tCbruCSkXizDOM19cpV31YICtgiKciFI6vRaHS3lCUpFD3fo3zgOrHAzAdkJuFoJ4J5A4udaj3TDNaZiD8eNJy/0iCB8O4HqPi6J1zai2r9iwSUNUE22V3WrYcqhmCXXLYJWzE4BEOcQU1y5dFtx8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rcr5EFR3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rcr5EFR3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 826FBC2BCB8
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 11:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787657487;
	bh=A+VI6FEKedo1QLCIxNChC2rNT1vVIplncqNzyqLRPeg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rcr5EFR351Ecf7rJXSSbaIxTArSugSnTMUzbEI4fboxnbN9uFeFo8fIVdV3G1KDby
	 WgJKG+2hHUfjTHqOpOa8KWNIw3OC7ZeI+tDi32tJIeKnMPec9+as0z1KXjWIdfE4vX
	 dSkB+oZ4D4Zje/tNsFSpY5+x+j3LfKQckem8LUZ7R0jlKJmWaEHKFCAP67magOiOOC
	 nvlU9FVTFTt7AFq6KkRw01/dm2Uc+jJ75ePjIfanvMecu/fz9RDVBqXmOVYz92TJlt
	 lqoFQkn+NlF1I0iXA0lIYAQ/vXGhkMyh4aDVWEQo4E0/HDE5EAFIq11PnNAN5PrY+1
	 nF6b8BGFl5byA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5FF90C41612; Tue, 25 Aug 2026 11:31:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Tue, 25 Aug 2026 11:31:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220936-208809-DW0wIdH6Jf@https.bugzilla.kernel.org/>
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

--- Comment #8 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
"Clearing Run/Stop failed" is same thing as "xHC CMD_RUN timeout", somebody
reworded the error message, that's all. The chip should stop operation with=
in
16ms of clearing the Run/Stop bit, but it still hasn't after 64ms.

Passing quirks=3D0x20000 parameter to xhci_hcd increases the timeout furthe=
r to
640ms, so you could try that.

The issue occurs during PCI auto PM attempt (shutting down the whole contro=
ller
when all USB devices are idle) if you are seeing the message in normal
operation. Does it also show up when suspending the system?

Can we know if there are successful suspend/resume cycles, or does it fail =
on
the first try every time? Enabling this will produce some debug info in dme=
sg:

echo 'func xhci_suspend +p' >/proc/dynamic_debug/control
echo 'func xhci_resume +p' >/proc/dynamic_debug/control

The cause may be some remaining bug in the chip's FW or possibly out of spec
behavior by the kernel. For one, USB subsystem is not particularly good at
stopping drivers from trying to communicate with suspended devices and some
particular drivers may have bugs like that. The issue would go away when the
offending device is disconnected.

Are you able to compile and test patches?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
