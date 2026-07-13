Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0271F09A8
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980727; cv=none; b=jGZk/8X9uw7uuGzDyXXLdZq5tSqy8fQVld4wGGO155wqs9OwpSkWLf4Ge3gn6PflJcZPsapd9p/eQ6Q8PUFwjwrpfwiHdOZoKZly8SCN0FpQN6201W4IBfFiQLtp138UMGVxL3n+463Kbfk/OWVv6fsNzLA455vkFshoyJ7SGJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980727; c=relaxed/simple;
	bh=v09vyA4plcozx6aUJyo4TXaU2wsSE7QwfqBZuQ58fU8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UA7MY0uriO4NRyOZWPRHXKQYMwiHfWV82sj4SelcOU8aXFrZ/+reyuc2ofozcyW213zwUAaKn4/+dU+tAOExq0mz/yQ8+EbWrCFR3ttSW3X0iEu0/tJS3NmkAhRb/M+ZJSHm4ylBF801Vl92JYWzP/SAqiK6zXpcRjNfLcgFD9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hv11Yw0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hv11Yw0s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E3ABC2BCB8
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 22:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783980727;
	bh=v09vyA4plcozx6aUJyo4TXaU2wsSE7QwfqBZuQ58fU8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hv11Yw0sznI/XOcVMjxGuP7CSxkZk64EJnQvTeOQNvxeZGcbgmcRnLdrHiw8l40GH
	 4wFQkJuwM8Fw8OL3IL8mxHw1yath2LIH+3sQyz8Vlg03xvdXFIm9uiOZBAEftN8sxO
	 U62D9P3g88zQrNJh2MiQaRqDlO9gDeeZGr1xXDh9im1jK9wkCSPtuu4p7AfBkvpQ5f
	 J4iu02HzjBTAripjhggDjXNqMxf9HRXd1HUukmyLdAyqtoyhFtIn1ncA4O8t3PgKEk
	 nW0cEiOU3RGguhABbd+I5Q4y8lM9tJfO8kKY0YNtjl5f/AovULLZ84JQ2I30s0ewxi
	 32qECtb/ki6xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2C175C53BC7; Mon, 13 Jul 2026 22:12:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 22:12:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-Uj44OrA89L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #65 from Alexander F (superveridical@gmail.com) ---
it was 5 seconds for both rtcwake and bash sleep. But this device has very
annoying back window RGB backlight that barely manages to react at this rat=
e of
cycling, so that could be the issue.

previously though I even did 3 seconds for 100 cycles and it survived.=20=20

I'll thoroughly test everything tomorrow.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
