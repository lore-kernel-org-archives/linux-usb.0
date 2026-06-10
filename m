Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3733DC4C4
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087648; cv=none; b=riZRlQqLrJwfiS2gfuIXmXEC1SbjvcOs/hj4oHo/FHpnIWVarN1R2sGPm6IbqlRISqVanLs9KrV/2je5Pio8NhewReyDkrEtaOpNlYFw1m25UbwhMf+Vx92rzrzOk4tNQa8SX/OaKac89KX8U10uHvHOopDcRUhNOB4h9C1uhvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087648; c=relaxed/simple;
	bh=24Gams0RHmdjbJIfUw5kYDppzJUAHSdgnR/sq69Bwgg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=haQjR5Eoutq6nifosGoia0tISTzk+QLtt6NJfdFpSPDDo6c5eYazK69LsGYcLszhkqNPcTB3vLHW8NOmVSFlJVh7RgrVqJj7W6cT6CcpsMWk14bA62CBLZ9dGC7ZZZ58BmOnzZ0YVLtmYJAKsOGBSdieKUhCz4EyYqKOLSEl3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFAFGF5s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFAFGF5s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29BA2C2BCB8
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781087648;
	bh=24Gams0RHmdjbJIfUw5kYDppzJUAHSdgnR/sq69Bwgg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fFAFGF5sT/13MxPlr76GmSPtpZ5El+VAanw8APOPIMEmFfexh6T4p6HpA/PBHkjqB
	 YwLHM6It6/S39cjZhIyCFFOt7xufzZ7nty32YU518OX8hvs/DuLWWJlg1x9dD8fAQ8
	 WmGXIxgUfnL1zFgOL5oMsH1hl8xnnZXq3SHjOOBCzQKFo0RdDy4aEYq1y217TvzmE6
	 wa2nVha14+eHzY36vqAVp9n4GQctR21Ifow+yRK8ohs9jPaYvUaDnazp447OXWc/Fb
	 CjjxmmCrwG9lDTRdhqVDp0k9O2Fsy2EWMiHe2+QyokRDRxdZ4t7qbbofLNElXwBr3v
	 FuKVh9C1y5LDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18952C41612; Wed, 10 Jun 2026 10:34:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221633] thunderbolt: hard system freeze from repeated DP tunnel
 activation failures (LG UltraFine 5K dual-tile + active TB3 cable, Meteor
 Lake-P)
Date: Wed, 10 Jun 2026 10:34:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: allan.petersen@vocast.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221633-208809-XkEjQbamBe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221633-208809@https.bugzilla.kernel.org/>
References: <bug-221633-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221633

--- Comment #3 from Allan Petersen (allan.petersen@vocast.com) ---
Created attachment 310293
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310293&action=3Dedit
Complete WARN backtrace, drivers/thunderbolt/path.c:589 tb_path_activate
(6.19.14)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
