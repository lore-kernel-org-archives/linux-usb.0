Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7192931E0
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785708604; cv=none; b=hlCJhQWBcWfgrWsyPtpPA0kfDDioBH3chhnVu/UJaO4XU3xUHxVcMfbrDsyXIdhBYVjlSlNz+oGEl5g/97ayTVt6QtfObNz1k0AkDJkai+3AYJhcBcBdl6aX8b0gFJSio6sTrpm2CsOdKf2OCZd7qIlz0JJsQkshSxJfAWylDUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785708604; c=relaxed/simple;
	bh=QhEwaroE0CJpn0C4AieOHzet6/kg6zPOgY/HvpvOzH4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rj/AqkGjmRvSVGmDOu4S95t65mEReCPIhPhEwHbdbieqw00vtrasaVmSrCPLcDbQtr6trZM0EllkmGo8PqlLzuKebYBa6s9csWFRr8SqEX289KCqvIwvGPlvp16kuCKCn4BRhYNA9MBxM7fVKTjR+zjBZb4ID5aiUAp6fjjYJic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qavGNpJy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qavGNpJy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B00FC19425
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 22:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785708604;
	bh=QhEwaroE0CJpn0C4AieOHzet6/kg6zPOgY/HvpvOzH4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qavGNpJyzmzzNFI3TYq2deJ8y9JSvEhrErNvr1HYZT7SG+RJ2nkRCXStwwfLpQSnp
	 UUu5XYNMQHp1EU7iLQ3Q5q7WrMsTlGD/mynW2V6i0d7yBCpd8nBfUflEbKL2NDAhfy
	 tAdowqrlAqN5Tt2okg/we3eLE4LuTK1ixdISr8enn/CqicId4fTOTrE3Csi7hyRUQY
	 ZhjIcFtubJ5WWiVHKnOn578tvgi1BJKxonRxJdBJp53QD6n6updnL8i+2kzbxKH4z3
	 evKQrpGpLBcHE2wnoz7pyQjHCjD3CKIR+EWGF2ZWElnns3I4zXSB88DWsZgCF15ale
	 0nPZ4NAIm6Puw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 34AD9C433E1; Sun,  2 Aug 2026 22:10:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Sun, 02 Aug 2026 22:10:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mayhemandcoffee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221774-208809-AMLk2P6dRD@https.bugzilla.kernel.org/>
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

--- Comment #11 from mayhemandcoffee@gmail.com ---
(In reply to Lovekesh Solanki from comment #10)
> Hey, just checking if you have tested the above patch?
> Please do let me know if it fixes the issue after you test it.

Sorry, I haven't. I'll let you know.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
