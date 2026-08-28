Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A645317C211
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 12:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919594; cv=none; b=dgamf1zJrJfcLC6gnxKYLQpF8btD3tMr1hsuww/XjbhdaR7l5b6rn/FrVyhnKsY0qLPON/fQzI/HGnSlJPCpnqjeMehLPSMKbYhABT1k1F2g5vA9atVaDG+ztO//ZhDK72VbHfKxG5QBr58GYq3mQ1UrkC1XkrXdMJnYiwbHJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919594; c=relaxed/simple;
	bh=r0zsjWtnL0Py9D9YrddnHzB6TOqGGUmSgGPEybwkyHY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QVRsISVsQGBgGW+WeNkeC4FfE0WuN9azjFRlX8oHu03mdAJQn7o6jieZRqXBWbb6IhSq4pnNcKvim1DPr7OW/KOnUoWGL65G+/LGBWcvkfBfYazMsRPu2xDMpBX373jh/RWIrl5gexeKg7LInOJZfJkMFfMKw5wh3ePN0iw8z1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH3EOKSa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH3EOKSa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EBF0C2BCFC
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787919592;
	bh=r0zsjWtnL0Py9D9YrddnHzB6TOqGGUmSgGPEybwkyHY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oH3EOKSa0GfCIZ8IHxJcSPu83d4AZjRKQeIszVz7sE0ZtGB6arOrshlkFGJa8xZuT
	 WpHPI23os+XJ5FrRqWm+2mMbbUAfTWQPsvvSqguvjE5l1aG0s7PJ9mUYLEdkhCnD8l
	 snRTAgSolj9BuBRLUSWEOCWBtIoRwFMHnypU4dFIO8hI/fM+rJ38+/yoRJa80oALl8
	 8F9bHvT2Eh5f1qqdvCuVJu462og8iOuJ2yowMvhVnSu3rCSl19Oqw33+HeJE2PS36O
	 5wyuE9GUbyUvnADWn9VQzaqmaON6BjUhs3Ktma5G5II6EXnFRq/qKPsqLT+d9NwXyf
	 XllWbkpe6GryA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8C030C53BC5; Fri, 28 Aug 2026 12:19:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 28 Aug 2026 12:19:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: voltara@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221103-208809-66PZfc2MVj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #29 from Andrew Skalski (voltara@gmail.com) ---
Created attachment 310747
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310747&action=3Dedit
lspci -vvv from affected wrx90 system

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
