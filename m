Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026504BFE7B
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702360; cv=none; b=XE1jV2+lIRUOIC3am5rqzbPCNj7b1YY4srQRHhscCASaahbkrCTuSKuU2HIOb9POQjVsh8N8nHzGklET6+PkJZT3arxHWMvBcWK7EPiB2cPRC/C6MQAFI0KV4AE+IbDdndtp49uGwZ2kSW4RNgetwVk4bhTYQp5z4VDXAvBA/Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702360; c=relaxed/simple;
	bh=u011+EksPmbmc6Ln1+EeeKM1m9LECBGxapYvTdNVhSI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r7sI45PhWwHg9w8XBqajpfUoPTHijm+Lsvs94RcvjSV7XRv/A8WSwQK7GrflYOJ6HLjtpb58xHwM9o9FgDyk6H51O+Bry5+Au1K/NkGWZtt5yZWI8V8ZgESk87qJlhMRA+donsPPKuAyZQpyGq/EypHCNDlpebGE6BZDPhrMbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+sc8Mc3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+sc8Mc3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7983EC4AF12
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790702359;
	bh=u011+EksPmbmc6Ln1+EeeKM1m9LECBGxapYvTdNVhSI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T+sc8Mc3E0+28PoBEd09KZ2TAwQHF+VlT2M1PNCJdl4PXXh01O7RACCqVeYMUzUK1
	 BhiDzXqN0F2PpPYOErw2pqiIfGyXpPd9lyh/+ZqMB1j+XhJsNPOWegVeuklZpm19Fj
	 SMGDtQEEtCgXhO7Oj95O0kQv/hXEzU5eO/FXr2hXWl783L+4yvXhWUKZsJw5HuWxgq
	 OLi2l1P2qHZ7ue1wdtHWzDorCFxArNJErIMCh2s6NSK4gLe9gGKnxwmzX546xG1Nfh
	 LX1GScvmQGp/UXeiBtrHXhhU3Ff6Q2R5WAeFCD/Gb3bnr6KVGWVu3GmoVySOWAkIaw
	 EYm0ZfIBRVK+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5EF7FC53BBF; Tue, 29 Sep 2026 17:19:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 29 Sep 2026 17:19:19 +0000
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
Message-ID: <bug-222071-208809-mHF0SJEzpm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

--- Comment #4 from Lovekesh Solanki (lovekeshsolanki00@gmail.com) ---
Created attachment 310970
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310970&action=3Dedit
Set num_active_eps =3D 0 in xhci_resume()

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
