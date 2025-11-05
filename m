Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753133B6EA
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357634; cv=none; b=k2OfJNdnW8USQMIZdrownJsvNC+Mw5bRRgH+TOvXT/I554NXzW+vlGkjvmAepO0l7iXiwHBbGHiuxxrxO5vtbI2B5o/zZBYZtCMoSXVV7kpvkh20H317TMka7cCswgWeFbjOJEHycqGej8fskYd8MNl5PKzi1PeEmeVjVcZmu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357634; c=relaxed/simple;
	bh=1Bu5YshwY9av4y8fRIuWg/0uAsWTBMqa0fw+NQBpSsU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mr964OZswvbAFVzp/dCpj0jDlyMBmbciMUd28rfVx8J7yoDW2dwqp74A4DLCCFlpKj8rD1EzNXBsrsvwJkPvm+/nIqLxeK3j4mVyPVpx/9IQwLBO3HcsBfKHzyOVNKPj32/OQoooytk8sXrAcG+KQvAPEVUb3vrttLnQKcPTfII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fl49wY30; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fl49wY30"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEF5FC19424
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762357633;
	bh=1Bu5YshwY9av4y8fRIuWg/0uAsWTBMqa0fw+NQBpSsU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fl49wY309GS1poyEV7Da7iwKDZYpp4//yr8rxhu3OajmQLPLkUEz63fuOcqmfEcrX
	 con7L0JuKoA969j9Wse+rMGGw1AVRs2V1PwE0Vzopfm9FmMXSI4zFQcWy9bCIPsj4q
	 wx59CuO+gJYUGjJVOO8H7phmfRHvJ1a9oXvmldj4QAndE+gp4zowbSWLp+oKH3emp3
	 F5ebS2WZvl11Gm3wnfbdzacFo6Ng4da81Wy1C8MGlONn7tg1EO65aqrc1wHgmJdVtH
	 gKTNnSfkHIHLfm6avTYQLsSn0IjKwB86sf9oFa/xJsmYwCQXtCgiLCoNn+zhUOT5f2
	 M1pNxSbK48RhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9927C433E1; Wed,  5 Nov 2025 15:47:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 15:47:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-Q4a7IgkhNC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #5 from Alan Stern (stern@rowland.harvard.edu) ---
For anyone who wants to know more about how isochronous scheduling is inten=
ded
to work in the Linux USB stack, see the description in the kerneldoc for
usb_submit_urb() in drivers/usb/core/urb.c.

In short, the start_frame field in struct urb is output-only.  The host
controller driver doesn't pay any attention to it when an URB is submitted,=
 but
the frame assigned to the URB's first isochronous packet gets stored in
start_frame before the URB completes.  Furthermore, the URB_ISO_ASAP flag o=
nly
affects what happens to an URB that was submitted too late to keep the
endpoint's queue going (say, because interrupts were blocked for too long).=
  If
the queue is just starting up, or the URB isn't already too late, URB_ISO_A=
SAP
is ignored.

Also, host controller drivers are not likely to pay attention to the interv=
al
field.  They will use the interval specified in the endpoint's descriptor.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
