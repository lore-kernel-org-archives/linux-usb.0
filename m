Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE32857C7
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831072; cv=none; b=jzu+g6R8WS6lR2gZacuFQx7F2L6W41JTRdZszUnysz8tBHhFqtGUYQWKyTdpeGLMluPSZwKe9KUmp5yPzIYO1msJCR1V4hnKWZqf63cpfivEWdhI704nBkno7o5mPcoVap2Hqsw03T6jionm3WM7LSHG/NUqX26+WtcDBek04tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831072; c=relaxed/simple;
	bh=PP53jUA4Txx8EAhPx+LJWEjZA1ABgT2wN18vP8lu+dw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hw6RJk1uovHQWexOZQGJj/vfyZcB4ISa62yTjcB66Z/y/mR5N5uwOC5V3sMEcTpTGFgfnDgYqIOauMIySc3sXMNvHpqPFP5W69qcNoLlnV5amZNY4G2d9IvScMqbXNkm8E68Qyz6jd9WNrJdVVaRhFQ8mhVO25hE/FVtHfN5H8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAI+Ail+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAI+Ail+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E76ABC2BCC6
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784831070;
	bh=PP53jUA4Txx8EAhPx+LJWEjZA1ABgT2wN18vP8lu+dw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WAI+Ail+65Mz5yy83O6W/iu8e+xOxf0m8RIs9H+Y8o87ivsceLupwGloxWtRoMZIb
	 ZjnH2ZBd0Ia3m1XUqkr620nK16ORZ/dkB55DNplQGwYi/RjTYflLwsE/7R7OUaTmkf
	 Bc0ubz/eb5/2gyoV7PZFXynEUrZ9SDmaPj+D+EWuWj7ZNs0Es7i8zxIvs8EiHbNoMK
	 iZP1itdctn8b3JmC7zyO8oDnlupkNH+lIiwWqvrZHgo+8Wd8EvKeIH1hurQVuwssiR
	 xzcEcTrdZVFEy1JFziEzTmVQyg65Qf8GXqtU6QISAnUce2JdhF0bEZJKiiUnqefYhd
	 W+dk8OLUPeKJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C00EBC433E1; Thu, 23 Jul 2026 18:24:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221774] hid-multitouch: report ID mismatch check breaks
 touchpad palm detection on ASUS ROG Flow Z13 (2025) GZ302EA (0b05:1a30)
Date: Thu, 23 Jul 2026 18:24:30 +0000
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
Message-ID: <bug-221774-208809-mQ1fei1sy0@https.bugzilla.kernel.org/>
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

--- Comment #5 from mayhemandcoffee@gmail.com ---
(In reply to Lovekesh Solanki from comment #4)
> Created attachment 310490 [details]
> HID: multitouch: Add report ID mismatch quirk for ASUS ROG Z13 Folio

Hi,

I tested the patch on my ASUS ROG Flow Z13 (2025) GZ302EA.

The patch applied cleanly and I rebuilt the Arch Linux 7.1.4 kernel with it=
. I
verified that the changes are present in drivers/hid/hid-multitouch.c,
including the new MT_QUIRK_IGNORE_FEATURE_ID_MISMATCH, the
MT_CLS_ASUS_ROG_Z13_FOLIO class, and the new USB device entry.

After booting the patched kernel:

hid-multitouch binds to the touchpad (0003:0B05:1A30.0004)
libinput list-devices is unchanged

The touchpad still reports:

Capabilities: pointer gesture
Disable-w-typing: n/a
I don't observe any behavioral changes compared to the unpatched kernel.

So while the patch applies successfully and the kernel boots normally, it d=
oes
not appear to restore the expected Precision Touchpad behavior on my device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
