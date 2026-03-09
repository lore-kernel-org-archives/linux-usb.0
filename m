Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8153B4EB9
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072121; cv=none; b=VBuW7KAnNZBkcHUDsUiVHDldA7EWQbUIyhAdw0K1odi0teS8c+JcxvtgiJ4+MJAcXPDvIGoh1zm/eUCYLFlrwB9tEsIDVHGZlqKFgjhNqc6luRxiiU/hHvHwwJQwyBjBE2sgSgMhSvV/C/ecndWuBbQFnMrsENh+x5Lg+s/zTW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072121; c=relaxed/simple;
	bh=+HqybHorcFJKNpo+URkvMGv4O4VRGDn88hBOO2/ePNo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QCO0CvkwcOLtozY/1M8sDymP7e/WheUE/+e7EsH+lVtQR8mBBXz2EI1T3y+b/QQVn60IiK+dG/t4+Su7Wgy8fizLrFAJfqI009g5LJ+J9AXfZ2Cg7tRes2aw8hJUc6U32pSAZ0Fyvc7jotJCi/b556R5p0P7wzYp+LBVsF9YNKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcFNKRiY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcFNKRiY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44049C2BC86
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773072121;
	bh=+HqybHorcFJKNpo+URkvMGv4O4VRGDn88hBOO2/ePNo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bcFNKRiY+hj1JVxGvNMjAtTy9BFKkcCKgvKzBV95C+89QdNv8sklsZlnoi4nOXMte
	 xKCWp+Dh46yIIA+4bSHfFKiES7s+7l2RWb73CQiLb1I8JY7XDq+EQ+sF71rkKNChz+
	 bGGTzLo/hIPsrxGpjnIR8VkxQGhoPlRNFeC2oZRKFHQmj7uxxhtC2xVCtlhONAhOV8
	 a4nwgvJ41CvY+I11WJQ5i7xM+78IO5SdQizk5WCXbbd4TeHICxYkaCEEotT+oZSR/s
	 ufBwWNO4d2uQktCR2KlFl7hK+zDa1g8dXfHI+ZmXaz5uw6i/uylLFWmW+6UP08FPpm
	 lMPPmvya3820g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3B15AC433E1; Mon,  9 Mar 2026 16:02:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Mon, 09 Mar 2026 16:02:01 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-b4OLkbDPDt@https.bugzilla.kernel.org/>
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

--- Comment #24 from Roman Elshin (roxmail@list.ru) ---
> yes, but question was about is it right? (as it broke my mouse)=20

It is not possible edit reply here, sorry it should be :

yes, but question a still about is it right? (as it broke my mouse)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
