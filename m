Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413925;
	b=Jw8c/mTeoO3w98PKW6lVxRIKfdznGMpvvJ8V6K00p+LlP48klWz2FG6q95lkUvtj0Yny
	 yAOafqbMRcxUSisO/tFed7DH8jobD6ZM98IVhdBkR4IQRChOTgipGvOgaYfZpK4zwdwY5
	 ECVGzIVqsdsJuGILggIc/bSNu8KdyOrubf0pZcPKUKbwwKfEctFssILHxxyZcmWviKpe4
	 c+4FRHIToAumj/5Dsgk7+9IxE6+IOAPqKAUBvStIE/WaUOpLsAJ1l/NXb6dBsJjw6Nkmu
	 5+QXRUP0X9e1lp68D8MZaTlh40ysFoqHrD64p/TKbHqZR9FsVN+gdhtAr3ed5mTW8zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BoPMzq/H4bcFf9xXpkUKgg6/usrYE3+jCOXC4NOkfF0=;
	b=ZR2RgHWAWnnha3OkB8X9A0NQbBxwKHRwW2e7mLh//M8HSBnrMVWcvtuUPb2wkTinEpW6
	 o9oCDIPe9Sfvhgz0GAofNHCbA/0uTszP+OaY5IZbUDAsBCmACOLcaeRexeXvkaqEYscCC
	 E2IWEpxLnVuL7vgRdrNrKTZM5GNfYSsidibOEb+4IHhcTVPnt4cZ+i1n626OWDvaMzZ9X
	 KWoG8QYieGebzsPkzYE/aAZi3vETz6ye1TH4bWsLhKSWyF1EUTNHWcijZ16iN66RbWbUc
	 fHavxN1kEyMLEh1H5MTLeWMZiER+FvMFzF5e3XX+QS5DkXv27ESPwQEQ9FbEoFMlHBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKRDejlf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7C8606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 06:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKRDejlf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D71F000D0;
	Mon, 23 Nov 2026 06:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795413924;
	bh=BoPMzq/H4bcFf9xXpkUKgg6/usrYE3+jCOXC4NOkfF0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GKRDejlf2d31rOxDuOPebJseJz8q1UI22ggiYdiUIfTgevYcfZxH4wySG8aZK6Hka
	 viwQAoCLEHHtoXcW/jjXb6bs64+Dg0QVK8n9ot5JfhF6AcUsVLns0llQJpQO6q6J58
	 cz/lWdxrV2/PzsOLdgWGUzzlYQbaBGNewxdNmaRFY7cPWQTcLZa/wzcHKBNlllZ/RY
	 a5yJoyUlfzkWf6bZPupCDIToRiEY6zeSBtWYKJfpgewyDm3riIUpdtLcmlrEOz/MfH
	 we2ra5pFGImHhJkEploK4gXl3hG5ThufdaJS3FFnyY5JoR1P5fpkFJZwxoAaiS1TtA
	 AYfigUgJX8evw==
Message-ID: <sashiko-outbox-228751@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: raw_gadget: fix memory leak on connect
 event failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhijian Han" <hanzhijian1991@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123055027.1141887-1-hanzhijian1991@gmail.com>
References: <2026112020-sesame-uncut-fc8b@gregkh>
 <20261123055027.1141887-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 06:05:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: gadget: raw_gadget: missing Fixes trailer for gadget_bind()
  leak fix
--

commit 94d8269bfbf48dae28738ed0656c12041e15b31d
Author: Zhijian Han <hanzhijian1991@gmail.com>

> usb: gadget: raw_gadget: fix memory leak on connect event failure
>
> gadget_bind() allocates an ep0 request and stores it in dev->req.  If
> raw_queue_event() fails to queue the connect event, the function
> returns without releasing the request, leaking it.
>
> Release the request before returning in that case.
>
> Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=3Dd83b3c49738aea97c0e5
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
>
> Changes in v2:
> - Fix author name and add missing Signed-off-by (full name), as
>   requested by Greg KH.
>
> - Fix author name and add missing Signed-off-by (full name), as
>   requested by Greg KH.

[Severity: Low]
Since this fixes a memory leak in gadget_bind(), should it include a
Fixes: tag:

  Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")

Also, the "Changes in v2" entry is duplicated in the commit message body.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123055027.1141=
887-1-hanzhijian1991@gmail.com?part=3D1
