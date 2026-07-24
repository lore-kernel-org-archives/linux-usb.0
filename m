Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772353D7D69
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784885297; cv=none; b=mQsnVm6Z4zUK9goV2j4wzXJziy0ZL+OY6wgj1N0ZAVCHMamHQlaNywJtf0zX+mTmrw+ZkMZeL9Jxo3xODJuAMDsw1RfJiuaBfUM8t+uElOVxxwEwUu9lWjYiUEPYZhS10csLgr2qjYhmtWKAt+tA9Wr8v/RoArZ0dRzi8ZzQisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784885297; c=relaxed/simple;
	bh=G8zhRGJ0olzjRivfuawr91M46SLi26HoxZexIM/slz0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZOflVILOHcReCeYpZgXEFlLlj6MabQymIgF4lLchpaRdpaNbHWU0/WA8KdCU74BiIxvOuh75yKkhhqZjg0510gVX/RzT4pTEg2g+Ctk481q8RXeRg8o+EJszQLXQjsdOGIyeTxZocfbmuCK3+cVXcD1USK/+YA6E1ZjmDP3p5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhAg5TcH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhAg5TcH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF96CC2BCC7
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 09:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784885296;
	bh=G8zhRGJ0olzjRivfuawr91M46SLi26HoxZexIM/slz0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XhAg5TcHw2rDwHULU+0WLfrYv57Bi+DC7qZv6dUvx1Qr7c2C3AXtSfnBILKzB4jQt
	 iHYon30IDPgmxoNL8obRmfBps0ssaHbaFDplFqJkT0h6t/t1mZyOs9SijSfMBy+XSE
	 LojQ0clFBfYLsTGi6Mo7uWD7AptpMjj/1Psk31Z+UEbDsTIVb31/R05joSDdrVNPLN
	 G/j2fNZ6YpxdnX+/Aeyrll3qV/q0RDM8w3JXGoEeM3a46GmATFyoelk/8CswdaJllO
	 NbeDvddz+S43QoZ/ExYnMXRI9BjanpYbx2xezuZj8q3GNHrpugireJUuozWbBNMNMa
	 qDM3GhnPud+5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BED4EC41612; Fri, 24 Jul 2026 09:28:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Fri, 24 Jul 2026 09:28:16 +0000
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
Message-ID: <bug-221774-208809-7tgMJZCCSX@https.bugzilla.kernel.org/>
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

--- Comment #6 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
Thanks for testing the patch, could you also answer the questions below?

1) Could you run dmesg | grep hid-multitouch on the patched kernel, check if
the line "Returned feature report did not match the request" is still
appearing.

2) Also run evtest on touchpad's /dev/input/eventX node and send the capabi=
lity
list? Specifically checking the missing ABS_MT_SLOT / ABS_MT_TOOL_TYPE as in
the initial report

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
