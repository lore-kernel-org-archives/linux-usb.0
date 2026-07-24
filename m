Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770B342514
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784915969; cv=none; b=e8lbfqw2fceKXyXX45m2+hA8XD+iLkHessIoBinFn+ztkJe8FuW7hKWTpFLJm6P6yQ2cRzbjEUlDL+XLwXilF/NIz4CWfgdLtpViyjbDXmGWPY6dofm45wewA4+N3seX0nUGac2w0PFdqHl/XL/6NgvoVpyuWrbJLXX+nxh3gLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784915969; c=relaxed/simple;
	bh=DnTzD1gKSPWLGJmF0+bfHNxZpwMfqDjiEsoaHACjXOU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQyYplpYJLoy2Awa8S1PXJKPEYwzd4oqzEW8Iztob+N2GEQM24XbvKZZVXqc/wnegIHkmQxIzZ5d2WgKlxdqo40xA8oOqJ0UeqHx4TwGWSch0PRvk29S3qy+5Fax+p4oHhniHezI6zGZwW8xKCI2hGDoWuU/SLbbbJQuusXTdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VX/0BY0Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VX/0BY0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CEFFC2BCC6
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 17:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784915969;
	bh=DnTzD1gKSPWLGJmF0+bfHNxZpwMfqDjiEsoaHACjXOU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VX/0BY0QXELCBxCZKJYLTiYx4EhYUI1+zQbW35L7MHM+dCLeUb0+/lmZ//b0O92ST
	 JOdvwrQ/T8TzWGtUXxZxJX//YVpOu9GjZgbzRu7Ypy8NW8snsHJSjIICkOvOYXit3q
	 LIBxHO/cLaYW+i1wYyflm+6qo8xwMTwi8ib9dTceChWz6W50wL6eQuqXekaRVF5f0E
	 nFUL1QgNGtvaWY3D7FL1WkKvfAS99zRVu9QKGpWdTeiczByiOzIvxVJARJULOI6wBV
	 u8D8cT/R0w0USnP6Vjh+NRaVCKsqYuXrIfLWoCqVNXzCkOQ5xv/AH51LZDGtSlqb4O
	 qmnchEG4VTaUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1B38FC433E1; Fri, 24 Jul 2026 17:59:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Fri, 24 Jul 2026 17:59:28 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-mdPDDGxbXB@https.bugzilla.kernel.org/>
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

--- Comment #8 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
Okay it looks like the core fix works at least.

I think ABS_MT_TOOL_TYPE is missing because mt_touch_input_mapping() has a =
name
check for the MT_CLS_WIN_8* classes which enables the MT_QUIRK_CONFIDENCE q=
uirk
which is later checked for to enable ABS_MT_TOOL_TYPE. And since the device=
 now
has its own class it does not pass the check.
Adding MT_QUIRK_CONFIDENCE explicitly should recover the missing
ABS_MT_TOOL_TYPE.

I'm attaching an updated patch, could you run the same tests you ran before?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
