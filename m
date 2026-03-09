Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC23E0C73
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071899; cv=none; b=tFG/kTG/GNu2lmV1k4cqrlc06MwCu/pjOPkPiGny0xeulE6ys7vsi1ITvjl/skA3Nu3UcssyqKjHABI/rIoMKAnZAzVgDSTt8WtVncZbaUdaNjZaxCqHjT6ObC0rzJ/Qkfp0svwlnbSpVzerzqdsYBXvIJcSzkpQrE5IWeo2Gas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071899; c=relaxed/simple;
	bh=1JUeVJ8/EiUM+eYFcNJ9hFH3QAz1lSzPDnY1Vx8cJQ0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EyG6VrAOnqUdLGTyuGJF8nDh/AOJF6J669JE7BBrmTjvsaorcaOlHapowlVLvSIIqh65M0BdxSfCckDDvWjkBdG0KUjfYZj/ylb8ZQ258/fBvc2oZtd2DswpCM5khktGrf/rrZEr9XGavOAX3akuijhRJPiymQJMnrB399xc52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSSwVzfS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSSwVzfS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 275E1C2BC86
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773071899;
	bh=1JUeVJ8/EiUM+eYFcNJ9hFH3QAz1lSzPDnY1Vx8cJQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TSSwVzfSNipo82nKKyJPx+NuI6NPbHmVM3UulshD+h5r8AysV0auBdBY+MHTJQ62R
	 x4EeqAzZtOxId9YjW9nrc3WcF/QFBIDl7p2jUt9F/kMtyxRhR8t7l7wOLM92xCjTLt
	 kKE2u4vrH6kWHDiwcXzBn7bhiyCtlHhpCL61eGIr2DHr7PM2x3EpSJuIu2mzzUiWp5
	 fJpbUzOAaff5W5jN9bOEgQdnuq/PUzPFXio1ZQpdAxUlR1ncyOY3HvRKt+JKAk5WOA
	 LKwKmOw5UM5SdeafXEft5HRcEzf34TurJLc7alkN1/m1fK0ft8hkQDDv7ZuTJeSvEi
	 HsdnPumukbS+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1FC5AC4160E; Mon,  9 Mar 2026 15:58:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 15:58:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mitchell.liam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-EU6zklYrCA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #23 from Liam Mitchell (mitchell.liam@gmail.com) ---
Here is V3 of the patch if you want to test:
https://lore.kernel.org/linux-usb/20260309-usbhid-eproto-v3-1-23bd841dfc91@=
gmail.com/T/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
