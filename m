Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C3137DE9B
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136318; cv=none; b=BhZ4mF6mLXYLPuDEH+7U2LFS+36fe1KHTf3lg/UDpTW7A8/+Mq+2any4z0AiBHoIGG0X0nobNenpUV+UDsIb8rescy1MfoiJq74i27qfizkgiut3O3iQWXU0VUoeaS7wFeV1bHoOzv61YYKh3ejtXLKq9YgDZ8MGecGFhZzdr8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136318; c=relaxed/simple;
	bh=BvD7pGhN2SDPb/W4xhw1CXXcPB0u4RVTjrCSxZmAUa4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WXGgMOuNR9ni4iCfhTxaURP8Z5T6KqjE+UOBWgNzOVu8NsWvJZ88oqVccMK7J4DRkHQNzSF1WdGsmMeMGWhVk3sTNUWFG9vb3v8Ad+SybOER4fFUfyxnouI61eQziO7yijJ4O6Q9d8LuC7i9XPxPrbT4oeoBnCo7CBSoprlXTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0hyAtuS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0hyAtuS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F971F000C4;
	Fri, 16 Oct 2026 07:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792136317;
	bh=7VbNhFk3JJCTphsAngjcFpJpvpe30YDVRs3ij3QXrDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K0hyAtuSTqlsg2sPu0PvnR+cXJTjaSNi+igXeYzuewjb1cmDvYf9fZ/9bwa3a7Kpe
	 OrqqouYlxaBoCTt0xwZgUD9DNq9y8nHz6506r7TShp36MUCFUXnNKmSJIYSbliEl8h
	 XYBc7HeSzY4bqnpgr22A2AC6w3LKe8b7gV4oGnCbPoWLtb2Gs0QI75oLOGrmOk7JOa
	 oR3Co8gaFKFowDTWR8FQodOucOlTOTegoe4sPfqnPETaA/pT4wgGgD8/BdFvvebPnW
	 C3izvBT6VWhYIt5VfNzb8oSR9DLz4FOOwoa1PYSlHC5QB/lve4EPSH+goknUcK2Lmq
	 LFZcLRMmgssPQ==
Message-ID: <sashiko-outbox-173944@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: usbtest: prevent divide by zero in simple_io()
 with zero length
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016072750.34256-1-25031212351@stu.xidian.edu.cn>
References: <20261016072750.34256-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:38:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> A divide error oops was observed in simple_io():
>=20
> 	usbtest 1-1:1.0: TEST 3:  write/1 0..0 bytes 16307 times
> 	Oops: divide error: 0000 [#1] SMP KASAN
> 	RIP: 0010:simple_io+0x2c4/0x540 drivers/usb/misc/usbtest.c:497
>=20
> The variable-length tests (test 3 and test 4) compute the next URB
> size with "len %=3D max", where max is the original
> urb->transfer_buffer_length. However, when a zero-length transfer is
> requested (param->length =3D=3D 0), simple_alloc_urb() still returns a va=
lid
> URB with transfer_buffer_length set to 0. On the first vary update,
> "len %=3D max" divides by zero and the kernel oopses.
>=20
> Commit 564e69893c63 ("USB: usbtest: prevent a divide by zero bug") added
> the equivalent zero check to alloc_sglist(), which covers the
> scatterlist tests (test 7/8), but the single-URB variable-length path in
> simple_io() was left unprotected.
>=20
> Fix this by returning -EINVAL early from simple_io() when vary is
> requested but max is zero, so the divide by zero never occurs.
> Zero-length transfers without vary remain valid for the other callers of
> simple_io().
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016072750.3425=
6-1-25031212351@stu.xidian.edu.cn?part=3D1

