Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F326B742
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 05:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773032654; cv=none; b=ZkWRPcAsB78/95hyBZco6br9ls73mR24CyjFGFGcvbWSz9qfvpf6kK4YRHz2E0fpRV1xZHYxCkOjPjdCJ/dY3FY+ycgSCW1uZl9YYr4zt69f+DJXBHhx1gHxZ/KgKdRYuCDJDknUL1BPkC9M+LYK3wVJAqJI4Y+ajzKQ20DgXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773032654; c=relaxed/simple;
	bh=0BmTNpTtHsr/q6mP7wzBSOXKowGSUN7B1yU+l8wn3Ig=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=donVW0w7APxb5KgmqLedeZdlVFFGnnVfmghVbTStMDbmvmddr6zAsyYbr2lm6E+LWph4X+DpPJc/b9J9lyl0cDGA6JqgCmtE48KeOLClbUm/XXOMnEae7IQhV9+loHlQXvO753fGhwK4tcC6H4HLt7dbiz0CnCFmclP/CqdJEqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=az4lcN3w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="az4lcN3w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01A32C2BC87
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 05:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773032654;
	bh=0BmTNpTtHsr/q6mP7wzBSOXKowGSUN7B1yU+l8wn3Ig=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=az4lcN3w0VySbwVhDGmXXZ3HlFRrRimXsckf0RFRFawCAoybUPKPCGPedKmmPmzBO
	 dI1iydOD9dSP57TQ1n/6rYDTRJ1CNaNsE/kPBpd4hQO/1aGyf3+qO9n5Odk62PVRo5
	 bxhIcta2SkuMC5Df/3YDMIfqFoIgRJF0ZFXOdpkdMRqZl92LUSNcQntZFoh/Il3O7h
	 bODz1JK+A1TLfw6P9/tVCvjtvLp7Lj1AZXpsDjE0xQano4bQ3LX/cOTV/mmpSJi3ZM
	 XJFeyXPkKLvjpzZ9+861rZb8FYlaUycXwFRDcPUKcM+IGVbcHUEc5Xg2mdnw/eox7i
	 b01RZwmNMabHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E65C1C3279F; Mon,  9 Mar 2026 05:04:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 05:04:13 +0000
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
Message-ID: <bug-221184-208809-XAG9NT9Jeu@https.bugzilla.kernel.org/>
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

--- Comment #17 from Roman Elshin (roxmail@list.ru) ---
Created attachment 309579
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309579&action=3Dedit
usbmon out with reverted 64cc3f12d1c7dd054a215bc1ff9cc2abcfe35832

reverting 64cc3f12d1c7dd054a215bc1ff9cc2abcfe35832 greatly improve usabilit=
y -
it fixes mouse resets, keyboard resets still here, but it makes it mach rar=
e.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
