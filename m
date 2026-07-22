Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241535A933
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716870; cv=none; b=eClACg5Y7rn1nL4FB7pRo4CI1o1cJzXv2XIf24irT9FVWpqNfKg6vIOthY7k73Uyz91JK59akt1sA6vdWs16ShzUJr+SXgWS13KO9r5RAQezsV+pDAteIxvYMECmBtBbFZ5opIhtniFIamMDTv2ICz7CltbUMxZJ7Gu1NUwpSnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716870; c=relaxed/simple;
	bh=KoFrnD4IfT7CAvz1DUlfDBBW+p6rof30bphnqJlffcY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nOJt4YlRv2bkJK3fhuyZfR7Q0DsRvmcCCg2jrsSQ7fD8XwtJu6DZiYXgceyA1lHToqEAkVpGgNgfAzrl+JfVZM+KNfA+0u3AmpHFTthxiPWoa9SBAAZjGbNAgF7fW1RZLncA0X3cYKHj5d9apxWBSrIyoSoW7TKeVv3Ev0uVjgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHdswF9t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHdswF9t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B520AC19425
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784716869;
	bh=KoFrnD4IfT7CAvz1DUlfDBBW+p6rof30bphnqJlffcY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mHdswF9tvCAZZN9IX3fWWIm6UPbLMkhdEIIG6V58IRzy1rB4mT1zKvuswBuvQhETN
	 PT47R/bWpHT8tofa8IYEjxQTKxUB1diUpG7K/pyUfLTl1HoqrVwGxIZiFfBbrgJI9O
	 boRiWGSin3T64q+AHgVNziPmr72rk4DuIGi7wXJnp4cdBsh+/VZ177ercXqagKLm/4
	 HlzK3CHNifTqOyirLH+BH0EwBSHMaplkYrZKh44Zs5QSDx2v05/5BgQs7ETNVWstdy
	 8T7bZJgkjo0HzzDG/o3gWi/kA8GtVUsUZMHZMjJf3Tl/HRYsnhZcA3AsD8wT4qIBEO
	 w9rKcBHFwk/qQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 990C1C41613; Wed, 22 Jul 2026 10:41:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Wed, 22 Jul 2026 10:41:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lovekeshsolanki00@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221774-208809-9J9sEBk790@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221774-208809@https.bugzilla.kernel.org/>
References: <bug-221774-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221774

Lovekesh Solanki (lovekeshsolanki00@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lovekeshsolanki00@gmail.com

--- Comment #2 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
It is possible the commit e716edafedad causes mt_get_feature() to reject the
Win8 response due to firmware returning mismatched report Id. So
hid_report_raw_event() is never reached and device doesn't switch into
Precision mode.
Rather than reverting the commit, which would drop the ID check for every
device, it may be possible to add a quirk for 0b05:1a30 so only this model
tolerates the mismatch.

I have prepared a patch which does that, but I don't have the hardware so I
cannot confirm.
Would it be possible for someone to test it? I'm not sure how to send it he=
re
I'm not familiar with the process.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
