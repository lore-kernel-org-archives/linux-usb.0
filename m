Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30A43E9C5
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074366; cv=none; b=f38W4FRvVD+4o5114j6qBPUQROdafQDPFcR3XH24r6Geo1qDTufzUA6Q4bkyWy6QsVXOuQLhGdFQlwCQPFiRgArxGoNULZjcp2FXZqpbXaJFXYRx1l8iMuJcVKtm+S9wZ79VlXK+jWYEivbIKorSO+QZBLElmtpYF7xxSj0idIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074366; c=relaxed/simple;
	bh=4oqhKxSl6S1RsFHdGwmf9PotM8LppS+cUllkvGeDkVs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R63RHcUC287hNeujoAkYIIfmxrRJNtvyL4xT5HkSCxG4C6pvTz8w5VfiLVOsN2l49936ujnyOlSIAqFoIU27ID7v1glkDy58VSUGgB0l+txIE6jWxEWB6yIsNMY/q3SL+kSbs+1ZOTnNBR8b71RTeq4RX0BddPlLFzh0eyfjF9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C149KTbY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C149KTbY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03DFBC2BCF7
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074366;
	bh=4oqhKxSl6S1RsFHdGwmf9PotM8LppS+cUllkvGeDkVs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C149KTbYCA9U61SCzgzCm70rO1JgPLfEtMIvzT5CW/2ZP4UbnwVKDKSXNhto32tii
	 q6wA0e1oJO3M9DugcDsVdj/hsqr6MNKb96Mt2NPBz8NSA4mY1sG1ci3Auj3DfeQkHb
	 sI5//eYYuMhZN31pWyR9VxaFCd01gZV/WA7JFv0n1BxXiMeX0+5p2Z2QUThpRUNcaJ
	 2UfETqBSVu/bEJCstqpw+01X30dlY+LiWvVjI+9yDgoVli1wXORX50mWZQy7S97OPU
	 5dUpxP9r08smbgIT8Ui9GFVs4FC+QkJtuS703tQATquvkrB9uth38aE8SuM+CoQmYv
	 ztzBkxJk96R+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F07BEC4160E; Wed,  6 May 2026 13:32:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 06 May 2026 13:32:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dylan_robinson@motu.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-c6cal7Ef1H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #26 from dylan_robinson@motu.com ---
(In reply to Micha=C5=82 Pecio from comment #21)
>> If, for any reason, a service interval is missed, the alternate setting =
must
>> be toggled back to zero and then re-enabled, and the stream restarted.
>
> Does the same apply to missed service on IN endpoints?

If the stream is interrupted, the alternate setting should be toggled for t=
he
input streaming interface as well.

> Or IN endpoints with lost/corrupted packets?

This would only affect the ability to maintain implicit feedback
synchronization. As long as the endpoint is serviced during the service
interval, the device's buffer will not overrun. However, if a packet is los=
t or
corrupted, the driver cannot determine the payload size, which means it can=
not
correctly derive the corresponding OUT transfer sizes.

> And for the record, are you saying there is no hope to predict what the HW
> expects to send and receive in the next interval and handle it right?

Correct, the hardware offers no mechanism to predict this. The device relie=
s on
implicit feedback, so the correct OUT transfer size depends on the actual
length received on the corresponding IN endpoint.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
