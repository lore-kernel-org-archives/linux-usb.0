Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3035038A73F
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772909859; cv=none; b=tx9QpOaOQ+MGt6GNUKslICIGUJ5Um2DWvRUCIDSgLFMnP8R7475Nuv2fwzYKVtK2cknQbVANoHONBX1UwahxETCBoG8GdRvzZtgSsSqX4djkpTPfT0B6MnWFMJJ37reHvpd5HsuCikINDAv++tJTBC4eFRtVvwF/+jvRmVCE7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772909859; c=relaxed/simple;
	bh=KnlSrcoi9es/SEeXlUnMCs0vRYis7G/lRGyoPAemODs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bQGDd0WWqivgDNyvsTkaLlByrVC11SyWhvqJ1e3jS6odq65MSVv/T+XBG7UQs0bB7f/mvUAIko0l6HxsNrOW3JZ//uK4yNsLxPtN1ibZFMcUbTwvVHOZHP8xI5sTbYGTpJhlN7mWE0QDYhcsRA2oxY9HiTBPLVNfQl5GmnFvoVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOfEqeiZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOfEqeiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA833C19422
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 18:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772909858;
	bh=KnlSrcoi9es/SEeXlUnMCs0vRYis7G/lRGyoPAemODs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZOfEqeiZ9QgyCMhbVtgJx7OoynV7zEPVOTZb9do2BUt2cp+xugfXRAedSdtiY+RAj
	 pgVnyEPToaHQ8OHhe4neYBqx4thnXXmYxd2WqLprcnxnObwYlJnKzoLVfys02w5YWu
	 B92VD0Mc+ISM+peaKAQHq8Ij8YotcEF0XW6hDuekwUaKDK2BQquLScfPrq5tY6VXmU
	 WaVrL5PYTTRYfDGwZ9iuJQDvWx5xZo2yfgJzF0h32tFjGaphF4zKUKHwZGuMg/PcAk
	 /wLcENlxbemZi9HLzjmjsbqo6eNQj6g0SY2PfZ7SZfPkg2ZIhmUkmXwajfC0eOxI0p
	 ovzeMDQimNEuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C2602C3279F; Sat,  7 Mar 2026 18:57:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sat, 07 Mar 2026 18:57:38 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221184-208809-q5q5Wp4C9K@https.bugzilla.kernel.org/>
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

--- Comment #5 from Roman Elshin (roxmail@list.ru) ---
Created attachment 309569
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309569&action=3Dedit
usbmon out

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
