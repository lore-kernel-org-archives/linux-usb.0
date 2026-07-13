Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC0345CA1
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974642; cv=none; b=txiznCk+PBml69/vopAMisNpGFQDsbLyNORHA5DlEg2GDTT5nP2gw429Wn8NDEhlrh/Wfpd2AcI+aVzsMOLmB2GRiOklX7N0Ha56YRJAejjnCfVTplRkkeZukKPWbMxyF4uVdiTsnFzI3iooKI2Gfc8Lmq/HZcxu6G4avWH2u8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974642; c=relaxed/simple;
	bh=noHNBFQmWsVPL7/NmkYj+qN3NEKb80oshAz1s8HImQM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PoBpztcXA29g60i3q+DUOGSbmOiFFyJeihhNdngpge6TaNeDuTjsx4wRLlRn9KqzEYPPkV3tkOgNkWcT/LqL42p1NiE9n9QBrocbYyG75kiuwVvjfELHtw1ykJXqobeR7GtrXo4bc9nZFou1HIQi8+rUOAnej20pSgekJwehwiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sz9j8tTL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sz9j8tTL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BF9CC2BCF4
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974642;
	bh=noHNBFQmWsVPL7/NmkYj+qN3NEKb80oshAz1s8HImQM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sz9j8tTLp6uPRLTS8yOvBvU+/5b/2T7FrDznAQt1FsJVkihIg1BMXMTrA58GLSnXI
	 szk9Czd0JfhNm35NRihcRj+Ll9Lvebj/aOTJPocs5d+pyYzRl9kCYIHEM3zTz+Wr/g
	 /ITJt79ZB1FGdSNJ5b003r67eA78wHtU8n1YxOhk2EoQvNj43yo4rcjiYYGZmsB8Te
	 /oirdA+GS8YYM8zkDOxynAICQJhwqCC0G0WCOPOe3tZmogjte+3RWiU925TrgcqKL5
	 KTw1P7I1QmNc7RnC8K5ytr56p2bwQ/08GdTw6Q8mU3xOVBDfTVSc6aiyHWA+gPRp02
	 gGgcSfqzVeXDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 087DDC41612; Mon, 13 Jul 2026 20:30:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 13 Jul 2026 20:30:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-rxtY3KJaxm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #61 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Did it fully apply?  It "could" be from older kernel; I test booted it on
7.2-rc3.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
