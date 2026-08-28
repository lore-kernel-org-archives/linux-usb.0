Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146072652B2
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 12:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920106; cv=none; b=QlRv8MzAH62t9ymXlRMp4MgX4uvMPGWoUTXVti8AmbDvXlay0fa/9rUlEge1d6+M7fGIlYojocy1K5dG554VyW+KkuuJzJdIMoEgJv07MsGu72Ebly7TF9atBrniLXa27WiB/gE7HxiaF+n852rIPF2Yul+tYIIlkd0whr4IXWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920106; c=relaxed/simple;
	bh=SjkYqKn9F/QvF427TosDzcd0ybI8tKFawjy0Op0L/eo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C3Xc787NmwbtS5/M035tQZRlHvFCXVEEJnSSkG/R0waSwDn70DDtuWO6aw3U3KrVgoTkY0KVHi5W8fkSgbFFRLcWb1y4Ed5j4qe5XYqbEPGdcAspAKOAvvl93kiHAbk9IJTjpwsq+sDkJCVDHZEiNEfzYIk3WsXe6K8AtjaF9Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKatTznU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKatTznU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDB16C2BCC7
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 12:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787920103;
	bh=SjkYqKn9F/QvF427TosDzcd0ybI8tKFawjy0Op0L/eo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SKatTznU0cxy1ZvEH/GiuDd+978tajUnK9CCpiVsnfGywaUhEK8qGfHZf1xF0/SLg
	 5YfzwbS68XKkLRM1pcqfGHwbKZ/n8NuV0/BhpnkqMpzk25uC4TGuR1PXSjYoMBNfrd
	 up2A8JI3gvMxjU+4PYf6iVJdrh5RXQBPPqcM1wG3vUIamuxrqEJ2cAgxd0dd7fTZrc
	 Km8IJaGVH45Ik5QRZgYF9+Ddntd3BPpJH4BRydCWyE/9uK5ekGTWkEfXivDFN5rEvz
	 it0k/gVPgRyVOOKDAC3XdKbrpjqPjUWezDSumlZFMNyTojf6pTsgs+xMYBMMTB/WBh
	 tSrDg7iBefBmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC1AAC433E1; Fri, 28 Aug 2026 12:28:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 28 Aug 2026 12:28:23 +0000
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
Message-ID: <bug-221103-208809-Z4bn5qhIIA@https.bugzilla.kernel.org/>
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

--- Comment #30 from Andrew Skalski (voltara@gmail.com) ---
Created attachment 310748
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310748&action=3Dedit
acpidump from affected wrx90 system

The "lspci -vvv" and "acpidump" outputs are now attached.

In my previous comment where I mentioned the "Refused to change power state
from D0 to D3hot" message, I forgot to say that I saw that message only rar=
ely.

By relative frequency, here's what I generally see in "dmesg -W" output on
serial console:

Most of the time: nothing
Occasionally: "Long readout interval, skipping watchdog check: cs_nsec:
1528817647 wd_nsec: 1528818397"
Rarely: "Refused to change power state from D0 to D3hot"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
