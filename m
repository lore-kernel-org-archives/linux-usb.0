Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870D34F46F
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884565; cv=none; b=mIeh3JDg+fQwA0RG0U2f67ShJeVE9I1lpSFRfqsEFeR/g0mMtJ3mpJVBHUuHjuFJrz2WV6VFs9SGtiBhQ6ed3aaXrtR8zPjxteCWYFSqLL1SPfgzjpPVEa430NSIxNBRRaOIQuLG1lTkkcBkoUdll/RWTk+CWQSmV/6n97wwVjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884565; c=relaxed/simple;
	bh=5pj7o/5fWl/hXZJcv7zohYfeUeIPwdqsTLUXiywzROQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ND1MWjakrDcvvE8ahyxKHvaKDRI6NGDHtR9EGs3kUOkC7KwEMxeBOAoSee3Ls6Lt1cwU6jaS0Yy4S7nw1/uegL1Fh9VpND/topzULPK9yDSKS0dIiaupOoBxI85Z+SenlFfgOl1H1759+y7c6yFQdlANDVI0IDmvdj0K8bAW6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=no/i9S+V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="no/i9S+V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56F01C19422
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772884565;
	bh=5pj7o/5fWl/hXZJcv7zohYfeUeIPwdqsTLUXiywzROQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=no/i9S+VwG5eugjV3F3o1RhWeDZIiaHPDDkZQIKPkvTGeHeSwuoZmVe3F4Yi8xMx+
	 zwrJLIJKdM0YXjpx1jK2bQJUk7VlBoHpL1eH5SO1gxLBo358xkx1GuixGJUtV5H02v
	 FAPj7pEakI11TXYsxdPmcL1g9T/sLTKSs4hwHoLcnSq2YMgxYIN9CMyI96Of099Khq
	 5zzzaFj5XFbKLLxkC+SRUQ5hyRmsvhzOXHt1G2SQV1HhoXfdfwj/1yfrCrn3Yrr+C9
	 GlEwHsqZPWqx4ACxcQWMHKfphWYY2rdEvFe0RIbHaGCiE3Kw71jBbvHge+CjKbimjt
	 H7wUyIAzlE3zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 512D7C3279F; Sat,  7 Mar 2026 11:56:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sat, 07 Mar 2026 11:56:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221184-208809-jcwUID6O9p@https.bugzilla.kernel.org/>
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

--- Comment #1 from Roman Elshin (roxmail@list.ru) ---
Created attachment 309565
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309565&action=3Dedit
lsusb -tv

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
