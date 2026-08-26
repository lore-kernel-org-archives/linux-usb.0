Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E864AA4
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713347; cv=none; b=aoUq29pEgxyBms7XAffNLVwzqZG8dLfW8ZqJRm0RyvTDnff/Y4AvmQ7kFQt6kfWEYcXgeiD0EOYMa2EGuAPdCpTqXGNeOYY8JgVkC36L4KfPK3TZMhqyrNTY9SmpBcyYcmPzfrD6Y4HJy5p30m7zF3Znm8hK0vdGs8VOpMGanyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713347; c=relaxed/simple;
	bh=YrGbFb17cRKlajaFbeicA4QbnRh0khz+5wtzwCDo3qk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=chsj5EDEAFADqcM9ZDO9q5uAfUD6/cDXzllaB+ExA3FOi5wFO1Vj60AqGtjzb0vPblsJ2ce/zcKiXln48dw0bqtIwQHST3yloBlCjQzC8iSu56pgMsOPtCofxplDy8aa6OCie7BSVi8Z758tE+4eK3FAUTxR5Zv4iIozv8+OddQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQ/J5s7J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQ/J5s7J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22AF9C2BCB8
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 03:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787713347;
	bh=YrGbFb17cRKlajaFbeicA4QbnRh0khz+5wtzwCDo3qk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OQ/J5s7J/5J3hNg1YMopDa2HzRRKfqBrG4ORreHREi/jbzWHmnsBGixQCeWR1k66/
	 FKPxm1rrUR+m1VajsCRIxkoJiVnw/GwxorbSOE10IEjWe8p4an+EI4OkZQ7BEqOH4h
	 O2e4CPL9NEbPIIyaK7clE0yxO0wS3bq2Zt2SbpCz8kf0AyvY5dPiVOqmRpEHaAlDcO
	 Tf2dq/0ELsqfvPAvHRb3Tbzz+PAyDf9U02FaA+o2nLJsOZnOmKYYFqJ7VXHD6jmLxG
	 qXUtJ77MJOGhwL1Ug9KCPn5hSNGw2NGBCFlI1v4fXms4oXqDxwrhos46h/fa6Mq4XQ
	 QS9gaIhUqHO/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00693C4160E; Wed, 26 Aug 2026 03:02:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NDBdIHVjc2lfYWNwaSBQUE0gaW5pdCBmYWlsZWQg?=
 =?UTF-8?B?KC1FVElNRURPVVQpIG9uIFRoaW5rUGFkIEUxNCBHZW4gNyAoQU1EKSDigJQg?=
 =?UTF-8?B?YmxvY2tzIFVTQi1DIGRvY2sgZW51bWVyYXRpb24=?=
Date: Wed, 26 Aug 2026 03:02:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221740-208809-fT5ZS6BwiX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221740-208809@https.bugzilla.kernel.org/>
References: <bug-221740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221740

--- Comment #3 from Wei Huang (huangwei@kylinos.cn) ---
Hi Shofiq,

Good news - the patch discussed above has been accepted upstream.

It was reviewed by the USB Type-C subsystem maintainer (Heikki
Krogerus) and merged into the mainline kernel during the 7.3 merge
window:

    usb: typec: ucsi: use UCSI_TIMEOUT_MS for sync command completion
=20=20=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Deb4573cf2fd8

What this means for you:

  - The fix is included in v7.3-rc1 and will be part of the final 7.3
    release.
  - The patch is also queued for backport to the supported stable
    series (it carries a Cc: stable tag), so it should reach
    distribution kernels in due course.

Once you get a chance to run a 7.3-rc1 or newer kernel (or a stable
release containing the backport) with your dock, it would be great if
you could confirm that UCSI initializes and the dock enumerates
correctly. If everything works, this bug can be closed as RESOLVED
CODE_FIX.

Thanks again for the thorough report - it made diagnosing this much
easier.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
