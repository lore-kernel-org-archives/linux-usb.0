Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D92340BCDB
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248427; cv=none; b=flqzriDBo7wX2CvqrmeXC3qyAmxQNCJNYaGDQ+CtZoWu4Ku8CT879v/aIZhdo9n881DK2Xe5q/a3oms4W0V/xlwnbghaj/7oq8h3uckYMGCOwzgkDsGqFM1zzjdeBP59QOCEaSAB3ncv+nu29nuhT7XodKer/9tY0+COS2kZAlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248427; c=relaxed/simple;
	bh=d6a4s4fC7LmCmw767j7A2NTzQhqT0+oJAtUOenhVUr4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IObePACtVYsZlBG550zgyZqj7TXQcABhPVbVf2AbBsJM0QQgV0X93EWglqEjVoZJ8GCaSkagz+pVBmOLZbdRlvMk3IphiYNQKwes9+4Mr59rFygojXTeBEsJuVj3i3Bi2x1KYGMGS/whLWfh1ItmSnFd9yOpNM0shvRRnDomGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LY721Kp2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY721Kp2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03B3DC2BCB3
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790248427;
	bh=d6a4s4fC7LmCmw767j7A2NTzQhqT0+oJAtUOenhVUr4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LY721Kp2+ZEqaGa6oPIXGgoMPlgez3hQ9Wd+0tczZmPH2SzazuVD44PEeLGJv5jK5
	 jjvMBoFrzjbtZFHhao72/aVzvn/ydDk39nCF+ZXOf6c5Essl5CH7QqD+c/PgY7CBHy
	 k5D9ul8jy1hGK/7jx/iFco8qiDK+9k/Gi1NLepKpz7/AAxobvvMm4KDCzmfS1IzrYv
	 Eq9mlo4z23g9SjQExsbbIDyPweYn7T13yk2zT1Wlb8lQpqfdl7boaKJb4dq5vpIXKV
	 H0eSi8UFGnwpdzjB4QLyWt+btY42rCPuVKAZ8F4UhhANRx6AVPXcP4MblGoB7q+wDa
	 imJ3gSe9kazag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D5F71C3279F; Thu, 24 Sep 2026 11:13:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222049] xhci_hcd: USB device on onboard port fails to enumerate
 (error -110/-71), delays boot  around 70s on ASUS ROG Strix X870-F
Date: Thu, 24 Sep 2026 11:13:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gtmatthews@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222049-208809-rBD7qz0Uo9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222049-208809@https.bugzilla.kernel.org/>
References: <bug-222049-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222049

--- Comment #2 from Todd (gtmatthews@gmail.com) ---
Thank you for the explanation Micha=C5=82. I=E2=80=99ll go through all thos=
e Bluetooth
troubleshooting steps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
