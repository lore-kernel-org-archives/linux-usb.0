Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB183E9F7D
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060014; cv=none; b=oXpX7hLN34wTi0lamAWAdHTSc7ZiAWVAV4hXg+sDir3P7typ7wB233eC12JMIuaHIq9ql4Nc8+UYFVQwMN5W4B1MfsFzjN57ngycR+BxYS/Z+LyFGoB1y0bq94amJC56PpB26zAJJJ0iGx0dZ59jwmFby1/9Ur0uC/MJKCQe80g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060014; c=relaxed/simple;
	bh=Y882FqXpCHe0JBAEKxpZw2Tvr2cU/Kp2OlTGVz5WwNc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iPBGmXQAGlan2l2J/FgMeZ0j/YbiTz6nR/5juIRdJUxP8QHq9L3Ck6kOLgHwsNZIJ/sIHnBNVDMFUE4z/pAdtn2nqQwOMawyBHLaf5E6IVEcPYb3oBUOIcTPbIdcYtkpFCR+qZls9X14M07tdVzF7+nfCYX0Z0laTzzOdRz6vP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pelRjn+d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pelRjn+d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4ABDBC2BCF6
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778060014;
	bh=Y882FqXpCHe0JBAEKxpZw2Tvr2cU/Kp2OlTGVz5WwNc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pelRjn+dZD0TFvCGi/t7HxYH+HnSKZeTwPBVHu7482Sqb84LDxJN0FGDZ97CjM5Ml
	 zwERqDiqmjAnuk5j9DULR+rk88D3dikvEdmnoKOe00TrPqAe6JcLhO0ejZ1PHXTYc7
	 Zyr8KShfcj11FMGtDkWswuRgsqikcKCAi7/a1FB7OGIqQ3TmCeMOHMwB5zAVAmcqTx
	 IVjhr976z5AnefLP9TnACe5J9+BAwgK5OAmqW8LEbtb+Bb8IP2ttC83J5TVAVADRqU
	 JgwsaNNXCc1mstvPXMc5LHHB2sszxvGxc6ZV9uw6OYmRWgWyheIB7O5XLi0YegEtnN
	 X9Wa76KPja6Cw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 33F6BC53BBF; Wed,  6 May 2026 09:33:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 205841] Lenovo USB-C dock audio NULL pointer
Date: Wed, 06 May 2026 09:33:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205841-208809-0IeKk36I01@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205841-208809@https.bugzilla.kernel.org/>
References: <bug-205841-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205841

--- Comment #14 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
The original NULL pointer dereference was fixed a long long time ago with
commit b0fcdffdd626 ("usb: typec: Prepare alt mode enter/exit reporting for
UCSI alt mode support"). Unfortunately I can not close this bug.

What you are seeing something else, so please create a new report for that.
This one really should be closed already.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
