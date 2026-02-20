Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2682D8375
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771586351; cv=none; b=QAP1AtZHm+9oiEfQ+p0mxUk7sESgWY8oQNUDi9zXxKr5IRSiK9O90LM3mROj5+3pMJ4qXil3hGL5wPNCF9LaehIkiudRzX/eW/iC+KvXAiEQp0l/BKzpPDuKTeO6X9tCNOJfPwPFMQuAJmxCxva67OzqfDaVO3F+vGZ5SW5zgU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771586351; c=relaxed/simple;
	bh=NlNhSqWFXjzK0x52R6zXyoZ+sjmhQcnKzYzTsdfmoCM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o5W6e/0cL6Bzzvl1rRqr51zSQiBq20lgkoLkMWlmxgHUx3bbV+ABG/dQiBd+i61ov+OET8QkmaEWJRt3k/c9astfIqNApDQv/XyX5ZokTB8L48XI7IEht9ZCzQdR/UmKr65/61Bnt/vezO3dLfMcCM3foIJSclHldGWIqqYb0kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEBqI6xP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEBqI6xP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E92CAC116D0
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771586350;
	bh=NlNhSqWFXjzK0x52R6zXyoZ+sjmhQcnKzYzTsdfmoCM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aEBqI6xPFw/hmzZMcISZ+AXRE80zW/iIdRxBf1QzAudxW6F2X3AnNOTyCFvSSxZbH
	 n1JfHFNa+nwfqOuwrlTOvIA2IeWLJ6yCsgyLv7dRCiVmveTnYUWnbLQ1oaJnYb9UlN
	 MFt7WRVQVWfTB1SkBPKnXc1LesH3W1HCo3qt6JwUK+n6+qrPo17yWlsW702RMVl4GI
	 J5IRZM0b2/R/LUhh9u/j2nB6cMlxaJDBxyFhPMLgh2xu3RahEuVpih28GbvbTEmWnQ
	 OK6d0FzMfBAup/fdoFXMr0fc9e8KnyYOhTLq7UQoWQt9ehdeTOO7BQM/rwBW7vFHpa
	 kdVVa1beR6C9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D1B1BC3279F; Fri, 20 Feb 2026 11:19:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 11:19:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-eZyK4WlNGa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #12 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Isn't the required serial cable identical as in 99% of motherboards? ASUS is
usually decent enough to show all details, including pinout, in the user
manual.

Maybe one thing worth trying is to enable dynamic debug and run an iteratio=
n or
a few to see what gets logged in dmesg, check if it changes or is always the
same and compare the "bad" root hub with good ones, particularly of the same
speed.

echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
dmesg -W

The most interesting information may be missing if it actually crashes, but
maybe something will hint at any unusual patterns in your system.

One thing I see is that this code tries to check status of the ports, so yo=
ur
crashes may (or may not) depend on some particular device being connected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
