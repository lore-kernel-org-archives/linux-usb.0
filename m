Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219302D9481
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276707; cv=none; b=VfJ7/ckS46wrSKfdijNpa/v7IfCvz+A1VAXxuy29LVuqQ9gAKdDJdKo6h0xB7p3z/Te/iIGIpVPrIFP5DMZppOAmym6lMYrT2tOe4mlNRzBLHrOJTRmMM0gqSEYN0SwqLumXZZUhYX0x0ct3GhSDa+s7yAtyhxqZ3YUeiSZgGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276707; c=relaxed/simple;
	bh=EVQnQh+jDVmId7xwtRqi0lWaBBTT+CXhJMaQ9aHFuws=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g2pOend/U93cXTUvkFcSzqH5b5TQKlV2XNTLARI5VuuqFqUukC0rrfx0RzLavY4sUkR1ukwuFVJTF4fJQ7+ipzFhXOhLwQ9j1NoWu+UftfYWiUImBi9Ok8x96vwo0JlgRv13fz63Cs6UG8cdmva4v1mF2m75040znD269k+eHp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgNkR1RR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgNkR1RR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF491C19425
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777276706;
	bh=EVQnQh+jDVmId7xwtRqi0lWaBBTT+CXhJMaQ9aHFuws=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NgNkR1RRBG0Nitvq1OlsGmSNPJ/SXEBnKX7Inv5LZ+Wn23L/KllHkL8XST93Y/+L2
	 KfAgKlFbyGzGeorut73m7ETjJVMQtJE478if8aFLjNwqg4cZu/cFXDc51tA+tSGX+i
	 26Q76PKQp1DJjZZ8tvF2agkugvllC62YEbvzrx9uWrdH4En6CEsj+O4k8G5F70qUyy
	 SKna/L9nJ4F2qgFXEseAubobhlr/bw5+oEeJ060EczmaM8CWFXd8gz/9/aeEUN/fNv
	 kPe4LCXkLikU2xaXA8YgAjj41ObX6XmeyNbDouCB7MzWdSHeUlygP2VeDjLhjXIOSc
	 v5+zeTtefG5ow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B20E0C433E1; Mon, 27 Apr 2026 07:58:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221424] USB auto disconnection
Date: Mon, 27 Apr 2026 07:58:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221424-208809-jox7vJxXnl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221424-208809@https.bugzilla.kernel.org/>
References: <bug-221424-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221424

--- Comment #1 from Pierre Tomon (pierretom+12@ik.me) ---
Created attachment 309968
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309968&action=3Dedit
USB Connection + Waiting for disconnection

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
