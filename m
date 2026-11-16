Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794805299;
	b=h09q4Udf4alJ9YVF8i6twdTgPt2cVk2yJfN33Kt6c0bj+cuGhu7Oqgo4woSIBlC0ZPcS
	 azYCaRRSD1myz/yvXiRvbHGu5cctLakDlPQzOeUzkwnkTWvthP3B/iueRbPRNQ+oHt+ZD
	 fWpRalVNHb5fg6Kd4Oib0mbgbDevewqgBcJv51yNdUtlc1ubCT4aaqj/5gUxciYHbX84F
	 Rl9cXOPSiOYyRjS+R1/9atPTqIqNhwoO+C2JNUXed6m1gjt3X0QNNzlOxkObldbKxAWZt
	 fBchxA0p4aVCxq3qshi2yAlgAjZ+nSoVuTRnHrjWY1/3ahL5xkJnIm+dXwmCh2OrC1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805299;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=1d/H0y5RPWl8zTaGoQ7cqLmEhtTmBvbqXpfZr/1DmOw=;
	b=R2iDi10LWSOPNeEBWmQAUHHrMbVHQKZ19XZ3gJbMlXk5Fem1UvKk+O7lK7bIFrsf7Fs3
	 xkuTAzEBYM3y4jDQ7sPm35FE3PL7QfAlNemZ0HdMNB3iA4CXP/AoJukJOJplSrxFtzORD
	 XiyHC+WQOXtnRelTY/iuccPq1JfpSQ81aB+fMIBjs+15kXDnnX5dosN4gJf63UHerN3qy
	 AYXbwXRaL9qLahVbP5lDlCT4ZczHaboNnQYZbleQ6LnUuZosiGvcUG9V6sXqa73GG6ntI
	 FGzFjoUjNEozjHTFHdfgd36stAAuN6w7Cah4XwCvv366675dRiwmhGd3ySloG11DcVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIAj4Erz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C3606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIAj4Erz
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0885B1F000C5
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 05:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794805299;
	bh=1d/H0y5RPWl8zTaGoQ7cqLmEhtTmBvbqXpfZr/1DmOw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fIAj4ErzEalK18IjIpfP2MfAjvreXHELTGYQsqMAgg1wdADvuIq0HZY7OCN4iGa8d
	 eD8TfeJexmhmqfsftX48oTkbDb57axsip9GIcc/ITk9VUfT7cWC8xGWflh0uNB6UXd
	 RcU6h4RT+tTNByPrwBFW/LaLqocC1z+EZNPQ91IE8CFhR9OEN5kYJcg90jXPPoLdTt
	 hQyMZ4gQRrzeORdn7nIfDGCG0iAMgC1TOy/58AWr2TaBTwJ3+3EHy83gLPEHrUl3lv
	 WFJU4/CGBxWKHtWsWYiZ0KVwCZULRySgFhC/4m3q/NWZn0+vB/XCcrYyQUuhPhW5zd
	 YQnEXpvR9JKPg==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id EFF49240040D; Mon, 16 Nov 2026 05:01:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219977] usb: dwc2: memory leak of hsotg->regset
Date: Mon, 16 Nov 2026 05:01:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kakapapa2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219977-208809-mQZfjQieV9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219977-208809@https.bugzilla.kernel.org/>
References: <bug-219977-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219977

--- Comment #3 from kakapapa2@gmail.com ---
Hi Wei Huang,

Thank you for looking into this and providing the fix.
It looks great to me.

Thank you!

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
