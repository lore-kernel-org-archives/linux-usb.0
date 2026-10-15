Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B33044237C
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089422; cv=none; b=MEgk5MP7Qq9h65Tr+CgoWajAdYm+1gCQURyd7KJWrM7+Iq3/v0TudmMk3ot2U4lJq1VvDpIT81fIK95VL7douNnnCbc7BoUWMD84OGfBz4weKovEtTog9/2Adffdxp0sGjwk4FAKD9u9mvoWoSTjTq4BKePEVKbcMO0VrxYv4+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089422; c=relaxed/simple;
	bh=Ii6KnEKrCgeq/UWQvYVYRz+XTN8YJ1+15BlHuUpKjXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ohzatzzLu7m3Oko8XgWKgvxC3ZFcrkDkXrmvmRx7GJSz8nZpmsLvVXcpP/xfOrISmHG0baeoRyHSVsgGODiLvvND0GEzKHQubRjJcWMtFz8gdA96/d7tmVQkM+VqBlNMzI6DQbtQ0Dxdq16p++aC5A6oAd2RUTutQxJT/qrNkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4wx0W8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4wx0W8t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E467BC2BCC7
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792089421;
	bh=Ii6KnEKrCgeq/UWQvYVYRz+XTN8YJ1+15BlHuUpKjXM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b4wx0W8t9yNFND6fGO75LBMifSdXhG2Rhc2bPSs6PHoPWbQCBkjAEK5z3DZCZJORU
	 M7uXN3/kQcM6xfrdzm3Nd+bORjkUr5k+ACZChsTZKOWJJUz5/zh3pdhOUXugHgZyS8
	 LaZ8o/a+yRZm/AxH7bohT5DrdtEG5buR3bHN+OR3zxWkuD41ujFNvSb1u1mvtG8VYF
	 c6AXunrQZX4TGKnE1r3fz4yvm3PmrSfBmL3r4/z2cvmKnoChyemKmGu/nzHpEsHG5+
	 I8irgQuCccIDMA3bwdSbGtRqh24xUgbOXF6TuLzcwIjdWs7n5OAMijl7Cpx8VR4U3L
	 v9+MhuD0hwtvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D15D6C4160E; Thu, 15 Oct 2026 18:37:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222047] [REGRESSION] USB xhci_hcd boot timeout on ASUS ROG
 Crosshair X870E Hero since Linux 7.0)
Date: Thu, 15 Oct 2026 18:37:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fastmichelebezzi@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222047-208809-asD3K40eIu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222047-208809@https.bugzilla.kernel.org/>
References: <bug-222047-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222047

--- Comment #4 from Michele Bezzi (fastmichelebezzi@gmail.com) ---
Created attachment 311130
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311130&action=3Dedit
lsusb-tree

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
