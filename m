Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097647;
	b=XKy2yR8Fzi9ZgU5/2LNj7GJ2lfxfha+SPlha5RAeg5LAmUNX7bhPntiVHHfdHAtOKzz5
	 gMkatvEDZPjvLB7C3vCDzGtzskk8G4ze3HUv+sO/JJaD4MSG62xxvZrliigCzxj/S18o1
	 czwwnC6O89fiXSA3px+eLCKF5Pi0ae2uauED9yfvLMZL93EKh/oT3F7IXZivKMgTcmyDT
	 BWZteAwtOQrtdTH4UnNo4aA9Z2Lepk3Bp2wFRVFbSu47JnsIusiurhKa4e4FdQ9l9JpSX
	 yN+cg/rn+g65AaqLcJruUXuXAuqAoUYPoka0lLaej5h34S6YbRlAdlqanFqfOVRooaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097647;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=C6aRCj8wEciv94cvB4O5qhcQIEYtmvYygIebmG+eGDw=;
	b=NSYPbh1DMdUnmrnSUGn3x0mYnA1GovBrbZWkAe48a3EWKClICkyOmKQvR0Bw+GYLRStH
	 1yjiR3aj9YFdO0DWeVBnqvTxpgDZ5qq4D4WHtMAzkqfRwa8xHL4itBb1pyXknjtg0ZVvZ
	 E7M5SdkUQUAv8/0G0KHWRE7d3UcX0AuHur9z5lX29RQJnxCxmtH2FCJBRg0oe7KuJrnHd
	 o9cJrOBmOVeWjWJZGP0HxmKlloz1XbHctp+gv70XjywIBHC9gmQ6vqpxITk1Sx7/8WcXI
	 nfGr2RhogkFm/8vi2zjyXI8vvBElCDmKxttXvwCcCCSMcSDYA15TgbaOWmNe14nuVLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edTrFv3P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9A606A32A
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edTrFv3P
Received: by smtp.kernel.org (Postfix) with ESMTPS id 355CB1F000C4
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097647;
	bh=C6aRCj8wEciv94cvB4O5qhcQIEYtmvYygIebmG+eGDw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=edTrFv3PV/VmKEnuYVHBDuqWa0RcYG+L6eH2RelBXPbBnaZYfk9+kpJuW40M7dvZr
	 JOMBp7Wq/GYnZFRhFaOLL30I5TMXwKDWbd/7/z/akfSC/qruqEVQ6L0d2JEuZlBxDT
	 EG7eZ+SJDqN9iFhS9OFhvlc47T7JZd0y7IG3mUa/6NJOA1K9Y4Xqor5UnD2dtmDwT3
	 g2aL3lC7kdGY+V5bgqRVFrhqxxtEQlABT+yYycS0cCP4sC7p/48oKsd+elSiYsW5uP
	 dnqIRrTlmNHW6+e5PA5EggpB4JP0X59t6vHW+hApI22xHnvos3YCdTsoBf5fD5ibIQ
	 WBa6psPRRdZfQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 31A6E240040E; Thu, 19 Nov 2026 14:14:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222296] HID sub-device (wheel rim) hot-swap on Ardor Le Mans
 base does not re-probe the keyboard interface
Date: Thu, 19 Nov 2026 14:14:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daniel.matushkin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222296-208809-wpOEord9cD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222296-208809@https.bugzilla.kernel.org/>
References: <bug-222296-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222296

--- Comment #2 from Daniel (daniel.matushkin@gmail.com) ---
*** Bug 222295 has been marked as a duplicate of this bug. ***

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
