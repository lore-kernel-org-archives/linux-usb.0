Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555973;
	b=vXD9FbDkmiiXdxmto1qEx2lOdRV7jFbuLycNmfiLkS9BQe6lvudYKfPA1UeDKBd2DDFD
	 ZMSXbFIOZBecLt1lz5/W14dQFOQYcmf6ocRNukusg92EFMo33FN50jE6s4BYMY44/PtxB
	 +/fBesRTuGfpzhpRH3d7n34XDGYCD2RqqUy+LbZ2qxZpDVSA8yAlEidbZ6asL5pIQCH45
	 9P8EdUWsCi0yQxyfsmz5HCjrgV4CQvuwfe5IGb4UKaRvEXxf8CrxD9xmFsfm91bdyJIFU
	 LCfwem8XuO2Idv4vJS1RuZ2mvr5M0PEQocb/OTopj/17zFDpyh0wjGMRhgMJTYujkoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555973;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qBFbAxocgTG0e3F+ec4yDGSt6C7/2S7J6wpkdP3kqvk=;
	b=aJa1/x6ulBgn52xMNdAxyRdI+RzLGFjH0m3IDgCr0zy1+oEEV8R5qO4VzXCzYo8YXRG4
	 gPRCDKOUwENNXfOBlo8UOf4d4U3EkqtKNkqAx9bnQWME7XAemmS2nr/bZMibU0c94S3Tu
	 MoVZwIvSbyN/CyzY9gOkwQSrn3+5UXo3Ui59KzYOl15FpCDAh/lVqR/9cBpH475Q66I02
	 3b0P7fIHVgAW03pp/7EUClo3igSOLM/+FSkBi5EBfUFdpqOn1DxVasbYNz7BErg2Pdchw
	 F9cUM7Htkit7uSDir4PwCZuQOZtUrIJNlXDWStCM8m2IxNe08TN5jyzE88FGlAUQKTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWxxV0gT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C5606A323
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWxxV0gT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94311F000C8;
	Fri, 13 Nov 2026 07:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794555973;
	bh=qBFbAxocgTG0e3F+ec4yDGSt6C7/2S7J6wpkdP3kqvk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=AWxxV0gTcK/w16OUN4bvCzNpQMRJYG0O5R7A+Hb+QcnfyzmaA0IC2Af65T4x7N4tK
	 oHfSTMmNOOI2+lo6pog+qGZs7+9tPrMu4QCK5m5cKiJql5RKEjOgnVyIyHqc/HYRT5
	 0jImuSMceXOMCKouK+qhD36xDQRs9oXO9NnQNKlqT8JMj9bEKa97kv4An8q17+PN6Q
	 i73qREy3TSyVRyAN17By3VhtMtNmslUHgheb4Q5vmXsX/ltXVAsN21Q/gCCqJXKKYM
	 p/fGQBWC8tNEvHZ6wCnXh7RnHbYtXVZamrFLpuOZEV9CSByyi77uSi9QNXIO5anSJI
	 8Dl9yiMoRyBrw==
Message-ID: <sashiko-outbox-212364@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb-storage: ene_ub6250: don't let the card-type
 probe hang forever
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>, linux-usb@vger.kernel.org
In-Reply-To: <20261113073638.1225998-3-xiehongyu1@kylinos.cn>
References: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
 <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
 <20261113073638.1225998-3-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:46:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ene_ub6250_probe() reads the card type with ene_get_card_type() right
> after usb_stor_probe2() has added the SCSI host.  The query is a
> bulk-only transaction (CBW, one-byte data-in, CSW) sent through
> ene_send_scsi_cmd(), which uses usb_stor_bulk_transfer_buf() and
> therefore waits for URB completion without any timeout.  That is safe
> only for transfers belonging to a SCSI command, where the command's
> timeout and abort handling terminate the wait.  A card-type query has
> no SCSI command behind it, so a device which enumerates but never
> services bulk transfers blocks the probe forever.
>=20
> commit 445fc368c6bc ("usb-storage: ene_ub6250: fix race between scan
> work and probe") added us->dev_mutex around the query to keep it from
> racing with the scan work for us->current_urb.  usb_stor_probe2()
> queues that work with a one-second delay, so it now waits for a
> transfer which may never finish.  The query itself has been unbounded
> [ ... ]
> Closes: https://syzkaller.appspot.com/bug?extid=3D30552b4cbe99d6d91306
> Fixes: 445fc368c6bc ("usb-storage: ene_ub6250: fix race between scan work=
 and probe")
> Cc: Liu Qi <liuqi@longcheer.com>
> Cc: stable@vger.kernel.org # 7.3.x: e350e5b223e1: add usb_stor_bulk_trans=
fer_buf_timeout()
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113073638.1225=
998-1-xiehongyu1@kylinos.cn?part=3D2

