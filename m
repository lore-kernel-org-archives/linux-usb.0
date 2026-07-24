Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713473B6C18
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926723; cv=none; b=FvSwX8LCyuKg8oFUvp0OHs9tXt1aFyDXzluEZXNctkAeaRjMepn/Y2CB99JmsbpspaVHEi7Er0ILzwWUzKG9c65oOqNbNILL4QfTGSDwmJ5KNo8vg9/cXkSQsX2crLU/H9hej8XyNvJjDLvwa+wobjPpcxmKeHBwOnuXHZ9392Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926723; c=relaxed/simple;
	bh=FbZ+uBdu0QsOe8BPZtw3/7IroufDZ3QtEZmBbQPWXlQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XAgDkj9qwYtt2XKOk3nI245SFoFbnI4+/Dy0NKW6PFgOPijlv8Z4kgI1W+4RY5VUFaU2rPCytvS6YxPGvxzNQbUrBZ4bUuHgo7YKQnPFcSvUBkziliLlBadg6BrlFjQsFM+onOKc/LIQtOmb3wSkIbeUb4vNqlh4boFWAwRZyl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCJ1ZrgB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCJ1ZrgB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E85CC19425
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784926723;
	bh=FbZ+uBdu0QsOe8BPZtw3/7IroufDZ3QtEZmBbQPWXlQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nCJ1ZrgBMdJ7Zb1bb+pNuXMhGOLHxxwu2S6OHBvGJYw0pAojkZV12AP9IlmPoGQty
	 JA7UR/TAFP/5OPeweWACKnIjRCE1gs9ZvIg0pYAYxbx434u1U6IP8sBSb9QCTiTz8T
	 mUYA2PUQbpxSNZNbCNm5WaWBv7SpLeO47JmwYnfYgSVZ9AJmaTPY7S/KhaOEbfp5Bm
	 p24iWfkr6H1vpi3ttJ2/xvHoMZ1oZoL3QI9M0+XC58Go4ZLQyFR8pN6nfop0duDeJZ
	 R3w/khsK/ey6CQ33FYeZT1htBY5FjAOZWdzEXAD9gCjpasForwkEWEaYGvNLH65IX/
	 Q1d5LI2cx12hw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0DFC9C4160E; Fri, 24 Jul 2026 20:58:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Fri, 24 Jul 2026 20:58:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lkorcm@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221785-208809-3fWezfXn7g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221785-208809@https.bugzilla.kernel.org/>
References: <bug-221785-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221785

--- Comment #6 from lkorcm@gmail.com ---
Created attachment 310505
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310505&action=3Dedit
lspci -vvnn

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
