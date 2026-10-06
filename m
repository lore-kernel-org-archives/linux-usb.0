Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8E34A76F
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281964; cv=none; b=F1gm64ERRUshMv42sTsrA12yh0T6TFEv79pa4tyvgnGBbqSsY7mifNOIYzAw0wVzMeYFBMMPwGFBAfPp7mR47kVOPWM7u+Aizu6VRm97AUCEmc/d1zQuwR/xAVgbFZyN4vqzpmUBvdDTKP2Av6Ljzr46YZT91S5bfRGfnN0BQ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281964; c=relaxed/simple;
	bh=/DxHtlo4Yg8np9Glpz9hCOfZS2+AOKNm3zDMV9R4YJs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kzl2zAzWtPFUvifOQCF0wJ5kTsmza2kQDqhuh9y6EXWrXraDSWgW8GqNLGNFHbbInFosu9dkKzRQcbwVcJomBpzJov62YsUgWM3kmGCAeW0xB2ozGvsBfAOoarWJFkH2jO5bFuBX1Xo28POJvlXcz0chMMJlnvOwh7c1p2KRj8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApN41cnI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApN41cnI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0944EC4AF62
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791281964;
	bh=/DxHtlo4Yg8np9Glpz9hCOfZS2+AOKNm3zDMV9R4YJs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ApN41cnIBGoEoGaKoKEXajjVhEUtnOOaf3ivWRQMmhlB33Bb/tkVLDb04Q9g9PbU2
	 pYqOZ2GWDRB0qFCLXjrABhvNVec9Wn1xjga6XYRVij5SbPJXlnZDsZaySTX7GByY93
	 uvXj/HaZQJwONdNHAi2yhT77EX3DZOf75WbjeZgwaYj57pSxVPOqrd/tDhWuPvo8LE
	 LSTkBsZyJ/zfXNRz6w2s+FS5As6jCzvHWy0pdg6VQ1RfsuIFBNV6FdXzUsIt9gcnYG
	 +iDkCQTLbWyC8JdOy6k2s4gxichTUCR4o7eUU+Fu6R9uxSuZDCr2aX5PKQ7rjuO3VM
	 SQ3AYFtcNgyTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E52DCC53BC5; Tue,  6 Oct 2026 10:19:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 06 Oct 2026 10:19:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: niklas.neronin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-222071-208809-y3sJrHDhuc@https.bugzilla.kernel.org/>
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

Niklas Neronin (niklas.neronin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310987|0                           |1
        is obsolete|                            |

--- Comment #13 from Niklas Neronin (niklas.neronin@gmail.com) ---
Created attachment 311006
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311006&action=3Dedit
V2 fix S4 resume failures when using software tracked bandwidth

@Harald Judt, could you please give the v2 patch a try? If it works as
expected, I hope to submit it before next merge window.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
