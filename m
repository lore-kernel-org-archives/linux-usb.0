Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792857907;
	b=A4/8TysOCV7koObDWdVEhy2KKdp5ORXmMdHp3Ks/kJTvz2Iuj0+Ez0Svkak1ydEJK2Es
	 fH92NhDUnTBH1lef8g1pMpx36Vasy9fCYJ1nmZU2mnmYqasu2S7M2AMXQmLS2WKzjgPsv
	 wI7sr8ojCi0chx1PoFb+toNApaSybkrUxLMjwAg5mkn5qbL6lpFjFf0iq8dFMEG96mgin
	 r5kl5mj9nULLSms/0nVEqYFJVKBDABBjxG7+YwfXoPXBn1c6TXyuMUui9JIrst33KhOmq
	 qWmK9Sq26zXIcqEg786kiZJi8H80ePWJO6oBDOs1RYNoRbYLyVMlK1KyUvYkc1M0XtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792857907;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=KKchaePIGv9PH3P2jPdp5ezNGKojdt+++owt2fABHmI=;
	b=h9Yvf3fDo76wpjvbwQtVHalGABpLKCHlQ40a3rlp5ynkkVckgxnRYXf2cHMZA3IqrUsj
	 YH3nl6xw80zofYiz/sKJzxdoL4RRKuNZqGFJEuwxKcMnFBaUFjIm4krIuL+cnHWe2Dq+i
	 0qIKddpR6p5y2bqsQg1VF+Z9y5ElElLp9LR2E3dcCzJIrVaicd5RG+YL4194za+Qx06DA
	 0J8Et5zTI1Uxh6KyjerFcdGt2K2aXPx34SuZ2++THBSEME218C/FofNFmXft6jMDsf0EH
	 Gn7O0UnduJbFXrT0EWg/W7AhKLu0S84etexzmWH45Honawxnyc6aMipKrb28crOuPVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T6u90IRo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2D4606A31B
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Sat, 24 Oct 2026 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T6u90IRo
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130146513C0
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792857907; cv=none; b=g2Y3c72VwbG33jvqjew/+AirFtL15C4DwtACp1HUdOf9DDbBLdXHdODiBKarAw9eZQrUgqZqh/mhw0g8OTRfZF8KI02kroGCTgH+O9NoLLFakuNyxhykvUrVqYw/t58LnzaiF+0ldv69Hgn0THipIPSV+7AsxvBQsFqRkLK+HHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792857907; c=relaxed/simple;
	bh=KKchaePIGv9PH3P2jPdp5ezNGKojdt+++owt2fABHmI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qGQbxaAit9AiOdjlxvwhCmSiyA6bfaT3DY4iVkYqi3l1tOmDBQnOHDJEKqGWh6Z4/1Hi5EkFMkPffQH7aAwBnkD4xsmfTPS71mGk5aiXcotnmffIJDT6EmdHDBuof7x1b8GFlad9kHwPizpiVsCnTsm6jGAEspGuataUiKUmWfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6u90IRo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BFD5C2BCF4
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792857906;
	bh=KKchaePIGv9PH3P2jPdp5ezNGKojdt+++owt2fABHmI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T6u90IRoZhIr3XbRjnqi7SUIRSSiHzE7wquCp4tq3eXXPKrOFD8j+zxjoX1JDJ9iy
	 Y6DUfW5qyjQj7PYg768D7HoVlyAB32UUBnZ3LGVbd7L1t6ef6ZJbA37XLejUsrWn3s
	 849BO/sCXQ/5hBztjCPPBwlf+rU9gKKxt7Bs4DbWBW4eAY3tFHtFHjoDt/Z69X5gk5
	 KaUCFi1gjuBWhJ/sMRpUew1F5H+SCi4e1yINJp2Mc70Dm9OQxlXf2ec6TPEtZ9TAYX
	 fOgXB4F80OtNXCPvpWk70kXXeOYGDha9IoZqujO/wd3wGRBib/578QcOEXXNo5bhd4
	 gLoJx09ohox+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A442C41616; Sat, 24 Oct 2026 16:05:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222188] ASUS ROG Flow Z13 GZ302EAC (Strix Halo): no DisplayPort
 Alt Mode on USB4 Type-C ports, partner altmodes never registered by UCSI
Date: Sat, 24 Oct 2026 16:05:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222188-208809-fGf1CnchQV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222188-208809@https.bugzilla.kernel.org/>
References: <bug-222188-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222188

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please refile here:

https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
