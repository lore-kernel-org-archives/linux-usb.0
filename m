Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793676470;
	b=VPAcwABSuU1ylnhfWJb5DF24ElEv5oEQWw8/zBc+Klrnu0IAJfqFpuMhQNATCQ9uC/Sg
	 cH53HBt2nDoWg/LGeskNlZ4d3DMfC8rlT4zjesOf05nTgISwzwDGrnmpImYWd4MIphlK5
	 plB9Va2HjUI/Xjf7npvsqhSNuVMKf2cjGWnXpAmU5zD3Hp6+Sd200it7LNfl6D8Bfg+GC
	 N+NeA68FT2Vmy2Q9bfYXVVMKUL3+sCgLB6N4n93bRh5lF7FCfrZY+HQhQuR9LCYsyL7+7
	 7x0TUhpBwhpcgTX7eR1nGe1xRgnokXHQYJ3glewCAcAshr/AjgLgmBhPrWtIBL144Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676470;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=FMGXB8bTJN3Zfa8YKLEAGAr2nESomm9sg3m0LQx2qf0=;
	b=1/iYxFbvIANJRB2Rhi0i5cPxhG6N4DZ226BtcocUws7ellspNZVYQsx1wnMo378wCeDv
	 oZlCIj+7IuTrYoVIx3mFLNSVEa6hHkkUUM5mVM9fJNaVP0ZLRFpX/8KDsq0JqYxbTsZ0L
	 I9/g4AgT0CA17upgrpxCxpc8v21ymOTkXmKzfUD4665q5ZP9BU5sCWp8y/b9p5Y68VCHg
	 aP4wAkDicv/wcAoEwovBDZzb12vaSbsPeVj8Npztn6CCOZ915a/hR3Y6Z2Gzd0bOr/DEF
	 BC4wjZJM5rPmzctxFinAW2oFXlFiyqqSZCM97vihndJ8jYVkqMM48lzQHCu6gh9/r2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=enl3BUEL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8580A606A32C
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Tue,  3 Nov 2026 03:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=enl3BUEL
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFE26513C0
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 03:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793676470; cv=none; b=e6H7A0gphpBf8Q+5qRvR8c3mH7+d8UYif2+dL2De/+Qvs8JIs4kAd1HTGEJJkSJ4NebkHq67dBVu4HRTg9yBXhXQHHh7IgPHVsZhMY7/4CCVhzL/yUT1AwnA08tLT5ir8y/l60c/1zUEao4Z5o4ZxqtIVP0RA0OTz9O/wwpQ4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793676470; c=relaxed/simple;
	bh=FMGXB8bTJN3Zfa8YKLEAGAr2nESomm9sg3m0LQx2qf0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iWpV8hzDNw5LFZdt7AELbB7TFPw8MHF6rr2A//uxuazFPqqo9W6zaVZ2kWqjOrWF2IDLfPxjEEx7IQZFsZqK9fZZ7TVYgI/ScnDLnFRzY7TGZq4vfyI2ow4KcohS3ggRxBlW1x/U25Lyp6efYvRLTHBiPz2Ul2zTYekqdWOEkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enl3BUEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3CC5C2BD04
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 03:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793676469;
	bh=FMGXB8bTJN3Zfa8YKLEAGAr2nESomm9sg3m0LQx2qf0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=enl3BUELhvJSMumzH7nmzTaL0226FtKCMKHr16EJOQiP9SKRraIj9iQTNFL7Bwl1M
	 yB/P/QEAcNa5M8AabGexmt3hRLqwnMzQfSB64k/MRJYFS9M5c0VxqqftrQjYCen8Qs
	 N59Ckxa1a4cvsfdIEuvBhDeYUBu+2L7t6SicWEL02+RjWjunc1KzDojEeD+1cw4sTS
	 R7hFkk6v3Kq8xyGHz8/jGOyW4Qc6SX0dk10R/QRtcyk0INzhYNttgeYW/Zt7GVXuPC
	 MxfvdN2Zod0fi1Hx+mVhp5hi9re9esZ1eo9Kgz2YtxAjD5B9luYA/d/inovdzDN/3Z
	 2OzbrLs7LXa/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8C62DC433E1; Tue,  3 Nov 2026 03:27:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Tue, 03 Nov 2026 03:27:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: daway320@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220193-208809-m5523VrTs6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220193-208809@https.bugzilla.kernel.org/>
References: <bug-220193-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

--- Comment #9 from Wei Huang (daway320@163.com) ---
Hi Craig,

Thanks for the additional device data - this is very helpful, and
it changes the picture significantly.

The VDS1022I reporting the same (5, 0, 0) tuple as the HDS200
means the interface-level narrowing approach I proposed doesn't
reliably separate the device families. I've posted the analysis
and options on the mailing list:

https://lore.kernel.org/linux-usb/20260810091322.2201740-1-huangwei@kylinos=
.cn/

In short: OWON reuses the same tuples across devices with
different userspace needs, so there may be no clean kernel-side
fix. The question is now with the USB serial maintainer on how
to proceed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
