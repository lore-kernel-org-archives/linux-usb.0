Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9FC3B27E2
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 19:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791489097; cv=none; b=FiQlqCGNmPZCM2ebT/lJf7UHy21efE4NCTn4TCvzGWAoY1P8Oq54S7xTAuN/mwDAuR/flE24zDqE4p4HU8UawJfTm89xdOyh5AqQDdzi6UMf2VfQb90PrYJAtzE2am3isjpHMUpMf8haVzfCfgMd4ke0ceQVWzVKtUk2/TXHvzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791489097; c=relaxed/simple;
	bh=819HYJF0p3PDi8ShBmxk6UXQFy/+gnGVQ5sXune2I5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kiotSDrQewfuT8V1Pj1wXcZSimhwmZODnjGDOT6EtFUdJuXW96V39wmgrAMcWx/EPzc7utNpACn3mr4z7QeuT2IeMU/wMPoDwnF92VTapY63CzMXDGsGvYOYU5tQ74ixRLnPAVBB1+Ewew6ATiQ06tzRm4dyTbxx+WDtXNozJOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giiMIImZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giiMIImZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26CF5C2BD00
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 19:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791489097;
	bh=819HYJF0p3PDi8ShBmxk6UXQFy/+gnGVQ5sXune2I5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=giiMIImZH8Mjfxe1no5M49BISdWVnKjX7inEi1bxjAOyXyo7bCtJsbRZkHqlHx2Lo
	 9h8Qhbwf8tgGRnHPvRAd0d+w0nQEm/0SLKQ+AYa9VpfO9+VxZCPcBcOyUYF+KkeCUv
	 qPgyCa9drwDdiavRVyu/bDG9/43GAscnjeN3T41iSA/JbbcLZsH6AszA7+UqJJxhLU
	 JEMzNRXSjWWEm02FZJtWO60t1xZSpc4UMJmsGb8RuiaXs4bxZID6K/vnHsnS6FKSJl
	 erEDoQ+EX48Jl7uze2WqA/m4yPsE6VCHtF7zaAlxUIGr+9mHZvyD51P61d5Y2uamdV
	 moPKVHDYYQrWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16523C53BBF; Thu,  8 Oct 2026 19:51:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Thu, 08 Oct 2026 19:51:36 +0000
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
Message-ID: <bug-221103-208809-Ywy9uhRUUY@https.bugzilla.kernel.org/>
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

--- Comment #43 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Did you try the known workaround from comments 14 or 16?

Anyway, this is supposed to be fixed in v7.3-rc6 by commit
29480b05e6e2 usb: hub: use shorter 120ms post resume hold for SS root hubs

Please try this RC or wait for the patch to reach stable kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
