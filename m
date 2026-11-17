Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921135;
	b=XEoOIoWslC+ykWzE+z0qYuTUGYT9Xn0Uebeh0x4dCIA4pPzhXoLzcKIFywHAdfKV6CKJ
	 2t8jzGVbHs3awDMd21/L11DMaxXTXHp+8b7OS8KXKPps57tnTRSwcstcmBc6JPY/1AlIb
	 IIhBe83PCCHu+j3Zbjx0caFhUUCJNWPysZQY4ZdrGfsrJE5KH670oM/dZWQxpUrL2uEoD
	 PTgqfRb7eb8tESMVfuGj7FHFn6rjtp6r4uL7m/XqMKxhwBL6jVJkQVCqNotmXRpGl7uwh
	 dyEeMl3mDp5B26/1DqU+c9FLnod+gJ0iReKrvgwgeqol+9jG+YUX7R+KUjbagbPFang==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921135;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wYyOhGSMTHjaHD7s4b+0OT+918m8QLd2g2vnE3fouc8=;
	b=sPu4wXmDeKk9Ql8PwFmf7S+QK/LsvuQackl2Zr+9q5LqBvtyX1w74RefErtdEXG0e3xT
	 HnbqDpbdij20DbzJP4kV2Tk3te5y+C6DSoZJ8+FKqgtTIoUz8joArzF645+VI7PS2xfUM
	 BpKpfx/hcVYj4OjCUmzVk9+JxAh+FnFLHk5PRCKErglUntwAkR7P23J3wqy4EsZz+DTUF
	 sXSepv3sK5afLUyrYg6fbm6iSvk+WoyIApX26oElLj2465LYasYTL4wJYsPes7t3inL/6
	 mnLTvCUNbCg/luv3e4cgRptf8fc1f+3ndHgdIzmioh8qOMmoDkB7D32p6bw9a6zakBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qx5ASjE7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD29E606A335
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qx5ASjE7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9F61F000C9;
	Tue, 17 Nov 2026 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921135;
	bh=wYyOhGSMTHjaHD7s4b+0OT+918m8QLd2g2vnE3fouc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qx5ASjE7DSA1Be8074czfUGjfIvEOV4fzE8+t3el16UniXgjGKpplMwYYXeRnUzlK
	 hZR0oiwhEM5mjiM3bTuNXPkqmwKpV/TNkDv68N1BrNziEnNbqh5pB2hApbuHOTTRDi
	 R0Mo/1NJCMWEFUKFgVJabAbg1GJ7mxS/NCQm1gI9I6phC/VOSMRhl9zM1lHXIYddxH
	 7vJWBixzwmMHvaTV2+10t6i3D8ewciC+tYetJYqy1de8yK5g6ekUwB0lihtfHzKbtg
	 GUpS3g9nIU6jBfJ8QHFeRG97SSYyEF18djDGJYIQbVm0xglijKAJXfOg2OsGXasbjv
	 tsQeavK7IcNDg==
Message-ID: <sashiko-outbox-218844@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] usb: gadget: f_hid: fix race between userspace
 report update and GET_REPORT response
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117125051.5646-3-shishunbo@cmss.chinamobile.com>
References: <179486710796.2938203.13522037990167268712.b4-review@b4>
 <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
 <20261117125051.5646-3-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:12:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The GET_REPORT response is served by pointing get_req->buf at the
> data[] array of a report_list entry and calling usb_ep_queue().
> The request completes asynchronously, so the controller may still
> be reading the entry's buffer after get_report_workqueue_handler()
> drops get_report_spinlock.
>=20
> At the same time, userspace can update that same entry via the
> GADGET_HID_WRITE_GET_REPORT ioctl: f_hidg_get_report() copies new
> report data into the entry while holding the spinlock, but the
> transfer reading the entry is not serialized against that update
> (the lock was already released by the work handler).
>=20
> The result is that the host can receive a GET_REPORT response that
> mixes bytes of the old and the new report (a torn write), with no
> memory-safety violation but corrupted report data on the wire.
>=20
> Serve the response from a dedicated buffer allocated once in
> hidg_alloc() and freed in hidg_release().
>=20
> This also removes the now unused get_report member from struct
> f_hidg.
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117125051.5646=
-1-shishunbo@cmss.chinamobile.com?part=3D2

