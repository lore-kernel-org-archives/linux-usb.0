Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055F1E5B70
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 05:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773120679; cv=none; b=BEDnsU3S6jc4LbYStUD/PxTlYWrT49RvhglYd1FZpLnWlbXIELy+Lyes/xeV/BpugxhK7bw2uNBziJtaxwYTxQwVAdltS2xTZAHTza5by/L9hl5FXYTu20IZvZKEZt6LQcCFWiR3fJvrwouhPCLvQcIrSKclpelUrl8WMhCwU0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773120679; c=relaxed/simple;
	bh=veDcV3GZQ+8+EqWC1h+9ZAt/mYfZ2Q9GPCTVi4A/IzY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZOQ7rs7JGWkjvV2PggBTIWL9C/zP507yq9n3CkhdznIjynbkC/versTa2MRPPBrSEEUdsDFGvRKPhDKAzV3jUCGm6aOeGnnlFu5W9HmgeItpbV1Or5On8WYIg89jimrlDPpNxXO7tmkLl+dl0SBmJIIacWwBTFxmmRSnjdb986A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEJp0jXt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEJp0jXt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 868F0C2BC87
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 05:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773120678;
	bh=veDcV3GZQ+8+EqWC1h+9ZAt/mYfZ2Q9GPCTVi4A/IzY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FEJp0jXt3Y5Hw88ioncLSXr4S75m3kPLXrRfbWwcPm8ObGq7TbAK+iO/RGahyIvNd
	 hTIaYaaeqigLLXzAe5Aq8qee9lPpl/RJnq85/Mtf3XPMUyXGw4RCuOczV8ycFCnl49
	 OnlW7encKQiKwRAyu59w6myL/XZFGe+X/VYmIswuRlzxpU41FZ56Fc7hoeLrX7XVTN
	 CPRMD52lPau7fbaaOFItr0AWyz95cuvaHkoJqtUt45q9lGkWjOViNhEap8reqP56+4
	 WZuDeia7TFNQNrzK5yHHNy3WGM4fua4du3t83GTqnvqL6FdbWzP6TyYglxWbDJ2nzn
	 ht+1OUql4QYnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7A505C4160E; Tue, 10 Mar 2026 05:31:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Tue, 10 Mar 2026 05:31:18 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-GzW6flpJrD@https.bugzilla.kernel.org/>
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

--- Comment #29 from Roman Elshin (roxmail@list.ru) ---
> Were you testing with devices behind a high-speed hub, or a full-speed hu=
b,
> or connected directly to the card? BTW, VL805 contains a built-in HS hub.

Super-speed, i suppose (usb3) - it is 4-port, self-powered, vl817 based hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
