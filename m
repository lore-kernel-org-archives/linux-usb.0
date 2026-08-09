Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BDD222565
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786318430; cv=none; b=ZQQD5YOyHCI4xyKZFNP0Ihr0W0wMSzkNTiAEVK/qdNzFgVgojXTa7d66/hT8/WMq3z1YoOMjxaO68FqGHnSS5pxpnu24zo8x4UMXM7Z60eubvqbFTxYKrxYPPGl+jJ2YpxaYMOtPWBZ7Y2gvVWrsfGnH/AkTrh6s9qV9ZB2kZ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786318430; c=relaxed/simple;
	bh=G1VrlOZWvFfBcxigNDqEIzusDxYfoauxItF2X3HUBWA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lNaiuuXVUh+nKDNQu8eLHXfClNQD6TGE4KtL3pTfeWrhqkYuddh2RTw3uQbisDM769345Ns0jdTzjCrSaO+BjC9K796xqUu6hnXZm00JGXEQRbxykb3dUWvdut2tjaKnvG+gNa54xBknm5ynCwysfgMXlM1Peg7/jaRnD/LGeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FScK91Oy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FScK91Oy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A67F7C2BCB9
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786318429;
	bh=G1VrlOZWvFfBcxigNDqEIzusDxYfoauxItF2X3HUBWA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FScK91OySey9iHTxUcsaKRWrCscMqH7MBXPW9lfFlKkUqIn/xbD+C00YtV88Gz6bM
	 TK8xoQPPoPDw/Vagq5rQ1qINBygaQ11dpbF0xGRXdfnn+eNHvvMfFcnj1AY0bg7F2p
	 1ZjsirY+y8PkawclZ8FkVjsheG/yumIfyJIH230W0ddlRHAuyKBVWICFRIOLf/KwQ3
	 6BNPz3rmHf8O1189L1v8ATldC2M+Tgh2ATYh9xAYahUUYWKS2wuEzKFtHg1l2vro/n
	 sWsUKZNGQ6z4d180WGnZSnkPJGuPQj+qPiWBc2W292UKlLqQa9ridukUmdPEW5RCAa
	 cPoF3Ue+PGnbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 95C13C433E1; Sun,  9 Aug 2026 23:33:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221861] ucsi_acpi fails to probe on HP EliteBook X G1a
 (PNP0CA0/USBC000:00), USB-PD stuck at 100W SPR, cannot reach 140W EPR
Date: Sun, 09 Aug 2026 23:33:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jayden.blain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221861-208809-iw907HKEAY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221861-208809@https.bugzilla.kernel.org/>
References: <bug-221861-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221861

--- Comment #1 from jayden.blain@gmail.com ---
Created attachment 310608
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310608&action=3Dedit
dmesg log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
