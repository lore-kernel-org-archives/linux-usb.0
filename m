Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9826C31ED8A
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579608; cv=none; b=VR5z1JHiI6HUeTrAY4nltfdJuyYpUEoRTOyg0Oeag8bidIlIgYpwgGcYX9Q0cyXtp/ENfxt7dqXIQ7C/3OC1xdTqqCXhAQQ3BPftH8OKH1fnQFl6nAUFyPFYc4qch+lUzGIjUI9M+UMSlbvEQIZbl/NjBdVonMinVG4RhuHxwtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579608; c=relaxed/simple;
	bh=rygYI7+8qhKnEA8LHE/5Nlcv73/INmfqVE7fd9OwXCs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gnYPM259OpawETih+eOdCSC3/alLWXIqVi8DyHAlnIG4BDq/bfRItp03c3HUnuLPJKOMjwbto+WpizHXil46gyaiq050K8ggOYSeUeDGd+m3xCD0k67S8FWplanpzexCUg3q6fzZKbwgMjhIkfo7CxLjFvoDkbjru7LJgzSWOt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEaP0gXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEaP0gXf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3450BC116C6
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579608;
	bh=rygYI7+8qhKnEA8LHE/5Nlcv73/INmfqVE7fd9OwXCs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pEaP0gXfNL55BjtyiyW6CCNbvb2FivtSjMV6KuQmgLs66q9t+WII9nxSvO0sUBQyc
	 69lkTSUu9kjlh6WKz+fR4ro+qnJ2JmIktORDRJKz8M3F7vkmGXaQwuhU/+FZBVzaDe
	 LQgiociLgh5oQbq16MFBAIzXH1kOIdC4H0aMi5eAUBsyagGg1l8qIoki1QWpADTvPn
	 XyGwK0s/9A8Tgb86JaWqMdMh35VGNC2xLwtbIcItHeyvk6jgRGzYiNkEIrThAVye2o
	 pwFYh0x0fvZLfit3NC7ATN2mevifHfu9Kn8YIfwK5w2km1ck0hPMlBYaOHqRsa16tT
	 3G6R65AEdwArg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 28068CAB780; Fri, 20 Feb 2026 09:26:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 09:26:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-Sedto4sCdX@https.bugzilla.kernel.org/>
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

--- Comment #6 from Paul Alesius (paul@unnservice.com) ---
> Works just fine for me here, perhaps this is a bug in your USB device
(or hub) that can not handle USB config requests?

I don't know. It seems to be related to boards with X670 or X870 chipset and
Ryzen/Threadripper. From what I can gather from ADB report comments:

Asus Strix X670E-F Gaming BIOS 3402
Asus PRIME X670E-PRO WIFI
Asus ProArt X870-E (My board)
Dell Precision 7875=20

But since it triggers so reliably on that specific root hub on my machine, =
it
made me suspect that it's in the kernel. The machine has been restarted many
times and it's still while opening that specific root hub, which I think are
created by the XHCI_hcd if I'm not mistaken.

> Does your system still crash if you remove the ioctl() and simply open and
> close the usbfs file?

I will try removing the ioctl now

Thank you

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
