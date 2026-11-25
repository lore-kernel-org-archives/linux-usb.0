Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602055;
	b=VyeHJRmmj59c25F+SU8PJbQzwgL08Xz8FVE51mxe6CZlTpBXVfiZfT6kw37PyOYmKjjb
	 CZ49vJG4Ef8QyIuaVJWNzlAtcYDoJjCmpa6080Dgr32PCFUAlZI4/IXW5XOT98HIlMfSr
	 5IBDqlc7XF8zj+207iKuUNqlMY8sijEj5QmVg/sEzuP95bC6hU2AUSB26VcrtXw1c0lRu
	 vdA6HfoYGvVCo6T2abY6ny+YlWiRdCS8ApF7iXoGNilkr4Sni8o8hmc/62ZGutSJ2AOSE
	 KhpbTR8yGas59IWpf/rjl0KH3yyRftDRGLPjxJma73dCotyjQsUsNTmUByEB+IVgRjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602055;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=UufqHf/2bjYHL1rM16/i83St63lIGit3AwVgfo7RarA=;
	b=OYa4Fss8Fdu2qhoxK40qCaTJn7g5Hp4BoASjn2AHDHxe8ET7a//jbwxsFSPSBSTrCo9j
	 +7bO/nbp3H8SrESlQROlnLfaJcWDxhxHKVfb5mFR5kbns1D/YD2+bDE4hrXf8AciR9dH1
	 H65N+NfbxLFJZj0swF4JLGRQeI3ZqgHqMXupUU7iB9ZJ+Fsh4JDyLX114EbhFpRW33gKq
	 i6u0MdwFXUN/w7EzOKHT2K6QdatNtKDuP1SiSKuJVJ9daJczQv30XHZQeSq7AJPt4Bl4e
	 5mRLV4XiHw3a6Y3ZakbjEo+F1p1iDZhl4M1KUIEdazBRG78m7SI+3r6hWyiXeIdY1Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="pUHb/80j";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF50606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF50606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pUHb/80j
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8A6461A0D61;
	Wed, 25 Nov 2026 10:20:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 583B260480;
	Wed, 25 Nov 2026 10:20:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0F1B11E69DB2;
	Wed, 25 Nov 2026 11:20:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795602048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UufqHf/2bjYHL1rM16/i83St63lIGit3AwVgfo7RarA=;
	b=pUHb/80jKzrPG6ivmBie6pYcEDWOcEVCPFeRG+3EH8bjHwUXFvh55XUeYMh6s2jkiSLm5e
	wEwFJcVxi5BmZgwHNPKJXylRban91Royq38QFdeykKIhMj/yRFAXn3KGyJ2nCrqiDZ8P8A
	uRKWxMrUkfaUl9SsYlnEAlbu45zX8++nPIWtiewDYHIMIP5I6ucQw98BGn+f/VTX8/k2PH
	IBZqRTMNvpyyUKnQmAuWbpoLLxWpPyWfVHBsvn1j3RxNWmgtZhmTF7pT28ysU9Trf6ft8V
	pGrNsEvE0VpqRVXQYFvFwN/96a1y5S8GC7EKxn8HbJtne3I3rjWYmLNhaxFbVw==
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 11:20:45 +0100
Message-Id: <DN47SW6B9HLS.337QKFJFOFOLJ@bootlin.com>
Subject: Re: [PATCH v5] usb: cdns3: fix NULL dereference in
 cdns_host_resume()
Cc: "Roger Quadros" <rogerq@kernel.org>, <linux-usb@vger.kernel.org>
To: "Guoming Chen" <chenguoming88s@gmail.com>, "Peter Chen"
 <peter.chen@kernel.org>, "Pawel Laszczak" <pawell@cadence.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123075116.3868-1-chenguoming88s@gmail.com>
 <20261125090115.2993-1-chenguoming88s@gmail.com>
In-Reply-To: <20261125090115.2993-1-chenguoming88s@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Guoming,

On Wed Nov 25, 2026 at 10:01 AM CET, Guoming Chen wrote:
> cdns_host_resume() dereferences the xhci-hcd child's drvdata without
> checking it, and both the child and its drvdata can be NULL:
>
> - cdns->host_dev: cdns_role_start() sets cdns->role before calling the
>   role's start callback and keeps it on failure, so the next resume
>   still calls cdns_host_resume() after a failed host start.

That explanation is much clearer. But the fix here isn't to patch resume
to support being called if the role wasn't started. The fix is to never
call resume if the role wasn't started successfully.

Two ways to do this (there might be more):
 - either we unset cdns->role if role->start() failed
 - or we don't call role->resume() if state =3D=3D INACTIVE

Please provide the platform name + full kernel panic, this was asked for
in my last email... Or you say that you have never seen that bug in
practice.

> - the child's drvdata: __cdns_host_init() creates the child, but
>   xhci-plat sets the drvdata only in its probe.  The parent is resumed
>   before that, by __driver_probe_device() when the child is first
>   probed and by a system resume in between.

Here again if the role isn't all setup, then its resume should never get
called. Wouldn't the check for state=3D=3DACTIVE before calling
role->resume() be enough?

In any case, again, having a resume callback be called when a
device/role isn't ready isn't correct and *that* should be fixed.

Again, for this bug here. You were asked to provide the platform used
and full kernel panics (two because you are fixing two bugs here). What
is found below in your commit is not a full panic log, it is a tiny
hand(?)-crafted snippet. Or you say that you have never seen that bug
in practice.

> Commit 87e4b043b98a ("usb: cdns3: fix role switching during resume")
> only covers a role change during resume.

Funny you mention this commit; it does the proper thing of NOT calling
resume when it would be broken to do so.

> Check both and return early; the child's probe initializes the
> controller from scratch, so power_lost has nothing to act on yet.
> Publish cdns->host_dev only after platform_device_add() succeeds, so
> the error paths leave it NULL instead of pointing at a freed device.
>
> The resume-before-probe case oopses as:
>
>   pc : usb_hcd_is_primary_hcd+0x0/0x1c
>   lr : cdns_host_resume+0x24/0x44
>   Call trace:
>    usb_hcd_is_primary_hcd+0x0/0x1c
>    cdns_resume+0x50/0xdc
>    cdnsp_controller_resume.isra.0+0x14c/0x198
>    cdnsp_plat_runtime_resume+0x20/0x10c
>    ...
>    __pm_runtime_resume+0x4c/0x90
>    __driver_probe_device+0x64/0x1a0
>    xhci_plat_init+0x44/0x50
>
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to=
 xhci")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>
> ---
> Changes in v5:
>  - Rewrite the commit message around the two NULL checks and their
>    exact causes; add the oops call trace.  No functional changes.

From v4 to v5 you dropped the Cc to lkml and stable mailing lists. Why?

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

