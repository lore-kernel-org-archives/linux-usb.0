Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01E470426
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248477; cv=none; b=DUErLeJZTNHBWDwA1YoF4AMm06oPfSGQaVUwqw9y14OUzWHJRSKBT2d/eHomznC2NckkKNFZSKFxieyksoF69+mvN2vWsENgeLvo3yhrmXQY4sz0PrybaNJTGj0HTawY/5IhYIk+rWoPx7CGfHlMMkgTPUUeAD6cdum8zfZHAFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248477; c=relaxed/simple;
	bh=cEVTj8FBj8Iv/QiVJZXOrycjSx+weJ4LTdFUBTItK2w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kxCOGLqVluAX3axZlFSb3lyoil3XkWGDbZPgmMwi1oL1LyEWQ3V7kPtQ1sT5dWrCwvahK2n6WuMFCxzrzu9w6duVmuDcPL0euj2DpF/0bu75NXtGXOjqPTjc10/EL28CcDb/uUIfFuhly6rOHTDFCBBkwJik1ZFHjiY1UqT1xEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrRjio7+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrRjio7+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86C87C2BCF7
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 11:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790248476;
	bh=cEVTj8FBj8Iv/QiVJZXOrycjSx+weJ4LTdFUBTItK2w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CrRjio7+odfelJUD9T2phluRKy3wB8IMobra2jzIsWK/LbH/+rQ88arlFqiuzse3/
	 YU3L0VcB8FXPoLPsqYwY2jKMrAaXGef+W/I3Bx8ZugfvlzSoiqjF51zyWQ3Q4TX+lq
	 PVORqqMqDlsMs64eWuESM30NOO+8fcEggCyBxjjTk5wJl80Q9HObEpkGyK9FVjHIeN
	 PhYws1ENr/nzg0s5XeRouJOww/zIcgtZqh9D2dihMObNA7qa06bcgwTtY6HvDOnCOz
	 4fMi5GxfBj8NjbCCRloflj2ZhRzpUGGU1qmmosmZK0x4KoznQ7KC42L7zpbcBWFbM2
	 KfeOApIPRUjfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7722BC41613; Thu, 24 Sep 2026 11:14:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222049] xhci_hcd: USB device on onboard port fails to enumerate
 (error -110/-71), delays boot  around 70s on ASUS ROG Strix X870-F
Date: Thu, 24 Sep 2026 11:14:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gtmatthews@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-222049-208809-ohQzo65Ttj@https.bugzilla.kernel.org/>
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

Todd (gtmatthews@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
