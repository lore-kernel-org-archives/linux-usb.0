Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765425;
	b=r8wwXCs3Us176QQpePu4RU93//6cx4Ftmojst+SWhS/dLhe14w5sA3v9dJsxfuEvQhJq
	 JtiHfmUj4qRd9a66FM/aoqzCn2tG3EYDOH2B2qNOeovM5hfKzFfakSPkxpxZI9F+ir85L
	 6OlGv9AbYeUFs1EQ7xqFXDvyhPDtZYx3RXZGOTJdjO9EpLSFBHSZg9CSyK8e+Spz/t0PT
	 qfsFqBviEs6AWGHr+GR2wgq9KksUY73sAGQotdYMsouyCxAmbUemW/+qMTmqMlPiYClKi
	 pZKZstEMBXNSHMUnPCOUeteiZs7GmuMrn9GkfLjGIosI6k7l2qblRBA68W85GZTYLlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765425;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VUYe1d7efH7+VLXgIb2xmVfKrAICqszZJsQ3Eewbhgo=;
	b=TIGE/kEljt+xHxZL+zyXDgyqrXDoo18l+v3vmBvMyL7ANkq3O5DtsxugMYs/C0VCB8ez
	 k6pXcJGt9+heod173H0RofTXtmeOF0JfXrgDv2RnCZtBpooHX9hkRg4TIOhpSOVls1pmj
	 2eGJmyuqRq1N3jfVTOUSYeRJOKhwTnPZvCeqhngIcfNJWByrS4/hZ0a30ZWYyVwmYytAP
	 sId5grNhC9Fk81vmdJpBhh/Es7zefqOCv36tPTLfyrER3m3KegVhzU/pVCf7y9g/Hb+0x
	 /mSZ3k1lV+NKlXjygpBMH2RxG8d+t8sSAsGcgzTwoWClGgQ3C1E2TRd6xAIPymBqT4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvTAtzEH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749ED606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 04:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HvTAtzEH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F191F000C1;
	Wed,  4 Nov 2026 04:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793765425;
	bh=VUYe1d7efH7+VLXgIb2xmVfKrAICqszZJsQ3Eewbhgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HvTAtzEHxgha7So9tON5W6yWSeKSbOJglzb8cXMEYv0n720k2w5LiJkUihGHMx7WP
	 FejhizaZkj5rmzaWHCykP8QRvZVgsMAlaocYCHThKxQehT3gDvqMzXNd7xXS2hbypb
	 NO5ra+HaPEg4SoUflXXu2ghtQO0U7cE7Frn3METNJwAuxyNJwWzByVfgk0ECAPnaZQ
	 auJRyLCs+EP2z+5WU9q12xpWP9ynhq+QfuDS9zk7CSNKfJPxzfee9lvfNNv8/q9nPL
	 mKhzbKXvaHc7yxZlQJMw4hrpB0aU6ga8b/RDEXQGJP1ivX+ZgzugMVS7db8hxL+/cF
	 PNBYvb8onU8lQ==
Message-ID: <sashiko-outbox-196643@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 04:10:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A KASAN slab-use-after-free read was observed in xhci_stop_device():
>=20
>   BUG: KASAN: slab-use-after-free in xhci_stop_device.constprop.0.isra.0+=
0x395/0x430
>   drivers/usb/host/xhci-hub.c:479
>   Read of size 8 at addr ffff88804e85d2f0
>=20
>   Freed by task 585700:
>    kfree+0xf8/0x390 mm/slub.c:6566
>    xhci_free_virt_device+0x3f/0x50 drivers/usb/host/xhci-mem.c:881
>    xhci_free_dev+0x286/0x350 drivers/usb/host/xhci.c:4131
>    usb_disconnect+0x6b6/0x910 drivers/usb/core/hub.c:2391
>    ...
>    usbdev_ioctl+0x6f05/0x86d0 drivers/usb/core/devio.c:2826
>=20
>   Allocated by task 572283:
> [ ... ]
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104035637.3325=
-1-25031212351@stu.xidian.edu.cn?part=3D1

