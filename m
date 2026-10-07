Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFBF42123F
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359272; cv=none; b=FcZf7qh9jJVCG6Iz6C5h5tau4Z5yNaNLIdIGOtb0OWCI+bWO+V/AwFH+1KW1CLfkVq5rlvzacB0Jb1cqsFK8xSrqoLht0AWUIF/M/RSUJ3BD61P+SKgtm5ZAarzeSNpjUKkWR9NNke4ud1dcqsEVh/7s/3hwkWbOD/oRXMH68B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359272; c=relaxed/simple;
	bh=qFK1Ododzp0PyIZDaLk285u1wpxObUO6DAyGJRMkq6o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EAPyLQ4jYsiXlmTsq78Qx46qPceckSbdMEHuynVhVbdQx3JtZs70q2wJiEYgps7/W54ubqBI6xW7ESEcJ5KfPQicuZLOnO3rKPLreSRwqyVAcVUlDBOLvkcozGSwjsCTMWXNn+MpSrEZK9z8Flwwmc3FuG7fHQb4vPO+Q2UjmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COaTbIK4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COaTbIK4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 022E3C2BCB9
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791359272;
	bh=qFK1Ododzp0PyIZDaLk285u1wpxObUO6DAyGJRMkq6o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=COaTbIK4icINpydkd40+CNvH0NFRkGxiCNWOQmMxje8wfp4Xq5LdS+Dfe+wh2vhw9
	 K/hlgUrn0lWv1VLf51Q3SqptjRsmL3I6HpmoSyJmO6D95ikiT22E3lWyO06eisd16f
	 OMVboeG102bE77SCrFK278xjf2OfJ8/9yXPL3CcO/rUbVMFF4peCWQNB51efSe9AT1
	 FBM90SPQUhU57CoerUry3XLw0xhLzcvfMy7k1yilX84/kcCGpqwJPpXtjHTygyNcOg
	 zJO/gw+/CaOXPKL6bjyNwnrvv81NPVHfAGqXraEE6ldE6h0agcUhbISBHJI7N2thdb
	 D+OLQM6SJxwAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E28E0C4160E; Wed,  7 Oct 2026 07:47:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIwOTFdIFJlZ3Jlc3Npb24gNy4xLjEw4oaSNy4yLng6?=
 =?UTF-8?B?IHBvd2Vyb2ZmIGhhbmdzIGFmdGVyIExlbm92byBVU0I0IGRvY2sgKDQwQkYp?=
 =?UTF-8?B?IGNvbm5lY3RlZCBkdXJpbmcgc2Vzc2lvbjsgc3RhdGUgcGVyc2lzdHMgYWZ0?=
 =?UTF-8?B?ZXIgdW5wbHVn?=
Date: Wed, 07 Oct 2026 07:47:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222091-208809-QQqbyDt0dh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222091-208809@https.bugzilla.kernel.org/>
References: <bug-222091-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222091

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Guesses aren't really accepted here.

Fetch 7.2.9, revert the patch, confirm everything's working fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
