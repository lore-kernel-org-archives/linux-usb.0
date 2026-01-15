Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD547355036
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468523; cv=none; b=qHzKberC77288lTJs28VmjjYmj6veI11JynIkp1HYJSudxLs8ZBLSMAMUd0gP96Fz6iAW2RIizXEGA2H2yxqgVsfUuze9t11HaNbbOlxIpgQY24Bw9sP7Z2XRsYPas9mOosw36XmEqJ/HL3AQ4db/59OdlSQBy8qdTcVLLvlaAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468523; c=relaxed/simple;
	bh=ovAcWzyhlARqnTWUm5Dr5TcQ5wgWUyhHOXQz8CsZMtk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gvQhFBLft4+1K44DSJe01GTvdDCXZ2LXMC4o6k5HYDR8lLbRjH33tJwpTVW26I/VssJfYqXGmRsZpsIAQ3Xhi5kgWbhUiWz7AG9hlzFefvx/UM0GTIGI2LDRMrBN3dH5jF36xSP6tUrxxJPhI+4qWczwkbb0iHW8QFfS8fwBKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ledzokGY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ledzokGY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AFA5C116D0
	for <linux-usb@vger.kernel.org>; Thu, 15 Jan 2026 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768468523;
	bh=ovAcWzyhlARqnTWUm5Dr5TcQ5wgWUyhHOXQz8CsZMtk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ledzokGY7yaFwctbli4l4LGI5hOMhN70eEKw+YzodWQuHZ1GdxVtNYNWKy8ETwKqf
	 RKeqsIKGa0RHv+JQ2YLJRxqQUq3D/DkNdugLTFjtXiy1WyfchQuinbrQWUiXwdcmET
	 Atx6fTKtmEpUfPDEAzFRt5jJ8cYxRjz/iWG1J9XJ3KkFkhE0VpV2xEK6hVMwulbYcx
	 32AIiHO/tETTBtv6hketu+kCPr8a3S6NxhJbdJSUZfEi6zCGNRn/liFcvAG/x3Ubb/
	 kyh8UtEpXFofi+SYv8k5M2s2NbWflH/iGalLI5MY0PGkq++dYiMCxCdlHIupaWfYp7
	 etX8jdRw+UGGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19354C3279F; Thu, 15 Jan 2026 09:15:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220981] Potential data race in
 drivers/usb/class/cdc-wdm.c::wdm_read
Date: Thu, 15 Jan 2026 09:15:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: franci.vi@tiscali.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220981-208809-EqFeziweQm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220981-208809@https.bugzilla.kernel.org/>
References: <bug-220981-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220981

--- Comment #2 from Francesco Vincenti (franci.vi@tiscali.it) ---
Hello Oliver,
thanks for your fast answer. Looking better at the code, the presence of
identical spin-lock in both contexts, producer-only-appends discipline,
re-verification of desc->length under the lock prevents data corruption.

Best Regards,
Francesco

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
