Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570A835C6AC
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784732846; cv=none; b=ao7alMHtyDmLoIsbX9eSPD/nJw6rmMLl1DpOJc/8YC3yA9MnlRjCFItmArOkMO/tfJ9V1J3aYtRsmXW+CDctNhxWuOshl36XfeohpvZ2Dt+L9iH5DSGjth81jTMfGNuA+PJ/s7ldGNTYDMRfZIHrj6Pm3lxwFoSO9QyiJ5gJQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784732846; c=relaxed/simple;
	bh=PhmOLtPMrTt31Z1XZm3JSvDlxLdefRH74wrQkIz5Ymg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XYDerRhrrYqAWPfWIR7sxUQas+V/qCBWEdfCKQ0A4Sdf8lAMwalztMBPWgHh9rG502s1gTDMlWYpWEC1P7C8GckpOuLkGRl6LLUmnx62dDqrVw/OH6Avi1GS9iSmVf3K0vfXSK2KqvrysUN7VuxxCl6B4ATc86bWR62Mx2rDQ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7ZKh3Pr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7ZKh3Pr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4A83C2BCC6
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784732845;
	bh=PhmOLtPMrTt31Z1XZm3JSvDlxLdefRH74wrQkIz5Ymg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C7ZKh3Prd8feuHuDCiTXRLQ177rrKre0g0o3BTIIShcJhDkW7cuh9Vp6SnhYNKiwH
	 TkI2E5GmQHW0nOBJvn7lWRusGQjjjGtnkInWW9dKtRPtzcEqs4UqadTRRdqgqTcT8j
	 6YH6bugr12U9Q+iAg5d+NqUR0PkM7tdyaHFKgXuop4J6quV0xxmswKJWnD8vu++erv
	 uISV/xsyJP3mptkNG8XNv0Wyh2hGkfiVCIDS4hJKCLOzbxitBm1wCSY3Wrt1cX5Ka9
	 nbHFLsY1FKJqhJRMV/yShjPr48hmXIC5O04XE+rpEbJoAbZ2SglpI6e8B+5ajoXFWm
	 /7mAxu2VB8PgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A449EC41612; Wed, 22 Jul 2026 15:07:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Wed, 22 Jul 2026 15:07:25 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221774-208809-uEFPZWeoqG@https.bugzilla.kernel.org/>
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

--- Comment #4 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
Created attachment 310490
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310490&action=3Dedit
HID: multitouch: Add report ID mismatch quirk for ASUS ROG Z13 Folio

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
