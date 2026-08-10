Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E58435531
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 18:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385438; cv=none; b=WBelUurAUC+qgJa1bFuD3Y86gztl2jf+jgEIcwVjLIKYFnWEo1tFNujF35Z8UmL44Zkjg2QNXyTAxWX4RPaTkJjgoYyE8yZgkU686AdWGJhOMVx2o1tRW45qiaai0feK779sKSJwAfpW0ubNrfzNHGSkgMy4RrY6h6p0JOIvjcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385438; c=relaxed/simple;
	bh=5ErkjyJyW5fog2QNblB5c4I9cSDj7ANqTaY7V/GrvKs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s5fHj1khxiV7yJ5L4PgxwEv6EYMI0bMT53sKqy9162BbsAPtSNcZ30ucBy0eRf945sIdLfNyktUkAFFHGrt5xJDc0nr3TgcC/XKFZArf5ZyT6DzqAzRz+ikYmGeLKl1vJPlHnWLiZWGPiIL2f7TZdwRYXo3Fg29JA8QP+camlMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmTzjRwJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmTzjRwJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4941C2BCF5
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 18:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786385437;
	bh=5ErkjyJyW5fog2QNblB5c4I9cSDj7ANqTaY7V/GrvKs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LmTzjRwJSn6wsxAM4krNuWGwcPSxWt1CFsqs34ZpBQjYLQcm/zzD0c0VBqa8zRFSn
	 fjS5r20lksw48oPhWxpZQxM4K92ZQrN88Uo5jMlSuSXSNwA5kKPcdQ4GlFxkyOO/fc
	 dk3yAYeq7wMDr3bNWuphdf6ouUtoe7ZbpNipYL7uo/KzNhiXSeyaIGviV0WAjUxf1X
	 l+Yk1RKGEWfbWr23le7BELL8lK2Wm8358xZ+/yX6Hhvq9TEGcfZ5i9P+J3cHC8Brq3
	 fILl0g+RErqx7OMs0l1povbE2FPV5quXACRDsjQV9hHXaoBondMoBe5soeR/S/7TAq
	 R69iBllkwXgLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A3A80C41612; Mon, 10 Aug 2026 18:10:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221776] HP OmniBook X Flip - Slow charging root cause: EC gates
 charging on _OSI("Windows 2022")
Date: Mon, 10 Aug 2026 18:10:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daviddelsol1998@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution short_desc
Message-ID: <bug-221776-208809-v7NNO8aeyO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221776-208809@https.bugzilla.kernel.org/>
References: <bug-221776-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221776

David Del Sol (daviddelsol1998@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED
            Summary|HP OmniBook X Flip - Broken |HP OmniBook X Flip - Slow
                   |UCSI firmware / Slow        |charging root cause: EC
                   |charging                    |gates charging on
                   |                            |_OSI("Windows 2022")

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
