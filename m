Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0CB3BAD9A
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926533; cv=none; b=d0mlqoOzOwwxN4jgQjUHkKbyQMgIfOmpFf6wX8XNTcbGCpDUCQjzfUUVIZBSrEz3baXgrb/RZVSvX+tgpzoiZ04RfZkPB/EsNLl8kNxxt+OjjciISraY9mTUIK75Wn1hm08fC4eqTwYyY02AfHFMSMY9TEM7mE2Vj7P5Gcf1Hho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926533; c=relaxed/simple;
	bh=NrsUmuSRvoigPeUYJy6BlAfT/Zu2MTju7ceSAUGYDuM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fLrntaZeHsLKmnTEWbZ7lObnDB2QTmxhENdqXDik1QELjeRe2W4tba9MPuJet8qH4CUdKcNT//2l9sWT61lYSv9/TrAbb5GhlmyE021hGL5qkY82LZRxPDjjqJA//sKJH/trciBFh5F58anBaR4UBlRk3l3NTQMVjBgwp/Z+o6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8kPpCxM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8kPpCxM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05082C19425
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 20:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784926533;
	bh=NrsUmuSRvoigPeUYJy6BlAfT/Zu2MTju7ceSAUGYDuM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M8kPpCxMQG0h7QRz5SN7+seuODM4Kj8B32ACN+W8+ACw5hkCLCPejoy5hetMKanwq
	 y1oh0xHAAXO86+PZho+v701GrI+9htj4MBPRZ0Vyo35GqIgO9LUYL7GPftTp/8Icqx
	 HMtRiTY21QnRxGjQO/FEEpyJOu1kPiM1A4gIexdRtnEwwwVxKJbtmX8sPyJa+m6EUZ
	 xGeYvFRB8qHagOfiPHyZHiVr3vDBeJ5CYQlvUtFLKTM9/E5PvM4o1FGkDH8w4eg1LI
	 0JLufdeoFsHftg8iSVnfnDCyzS/upSB06fYXTUVAeRlfAARqRqUJ6Y/Ne9zgGTXez9
	 IYdqZsUCjU2bA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2B2EC4160E; Fri, 24 Jul 2026 20:55:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3ODVdIEFNRCBTdHJpeCBIYWxvIChBU1VTIEdaMzAy?=
 =?UTF-8?B?RUEpOiBUQjQgZG9jaydzIFVTQiAyLjAgdXBzdHJlYW0gbmV2ZXIgZW51bWVy?=
 =?UTF-8?B?YXRlcyBvbiB4SENJIGNvbXBhbmlvbiBwb3J0IOKAlCAiQ2Fubm90IGVuYWJs?=
 =?UTF-8?B?ZSIgeDQsIHBvd2VyIGN5Y2xlLCBnaXZlcyB1cDsgVVNCNCBsaW5rIGFuZCBV?=
 =?UTF-8?B?U0IzIHR1bm5lbCB3b3Jr?=
Date: Fri, 24 Jul 2026 20:55:32 +0000
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
Message-ID: <bug-221785-208809-oSZbSzgsev@https.bugzilla.kernel.org/>
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

--- Comment #2 from lkorcm@gmail.com ---
Created attachment 310501
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310501&action=3Dedit
boltctl list =E2=80=94 dock authorized, USB4 40G x2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
