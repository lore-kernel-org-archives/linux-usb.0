Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952697;
	b=pEg5C4G0zqgc+2DTy/HQ8N+m9mT3tfIuI44LAHER1FGjCQL/ZgzD7yX68W3W3Hj+JOM3
	 weLsGyXHeUpONxIEuhUpr4VRhzOlINQe1JHRfBhldgwz3mz4S61q1AAkSN73vVZ87j/aX
	 IdTHPNyGKDVSGtY9nEgjR0nl87Z1ijBwV5d/a71kBZKu8wGdGOUks4ZkVak1LY3+3ZYSD
	 JNZVLWIr8a6HrZJirlkQTUehBBSMsHxqqZ++O6At4+jyjetPM5I6nCTrPiSXyeIJhXIqN
	 IoI84Sbz15aLu58haqyOPsMej0h1HBJX9QOnv7YnBQ2NhCelCAlSY2TpvzNo80/AsTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952697;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IocbpS3nlsG0xtBJfknFY1eFnqJ3apGgCZRQyDcBqQ8=;
	b=ZwepjroWkf1Izkf3RLslr+ZHu5pqfMsp8efSaZ7NCPFldLg34u5FYeJCzT86zDzafj4+
	 AjtaiNU9Y2gDkZFnon5Ge3yAg+LsbN0MhPDkclG6iRaFpu5h6cVXOq3XJ4hbS9nssbOyU
	 4rcegMSVRpAJ+KLbonWj6LdMvqX527Lqa9AN9Zqr3kHx+zuwZlnM6EMGPD80lJThcwiUu
	 x9J8SHwgRL5h1YeYUcTt4YPIUZ4h2GvWB9IMwnNEQnP7joiWqsVxhJO8KODkm6odHsQAS
	 upB2/ODF+v/h9Hb8tRRuGZDUlaYiUtNUMp82FJ68tSLcBHvxY+fMtn/ghQdf3dOBQ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kbIy9NIP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FF606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kbIy9NIP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4ACF1F0089F;
	Fri,  6 Nov 2026 08:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793952696;
	bh=IocbpS3nlsG0xtBJfknFY1eFnqJ3apGgCZRQyDcBqQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kbIy9NIPpY4+Rm/bHHTnyxtVltliMLsBDTdUo69n4yylh7eGClqYHohv8kWrtCLC+
	 l/rMkGrAtxHinuCZIlq40U3fA4agPbYJGmVZKDHMvZ+JlIhVgIaoFs1ntHoFfRuGS2
	 e69OowkE0bVD7dgUNCsAEIzsvxCJYp/JgMTEuBaQtwWurIw6qT/4f2B2MFUXsfNas+
	 UePvR0oJDGYxuFLWD/WIdPEeXo2Geoc6kIRmUHprC06ggnDxcprp40LFkE5TBPqQJq
	 jwEbMoxaSeQnRnfAvT2au7Hug/NFT/Ya8ZK/UPc+NWIFnNyNhN2s2iR81MmknfXchO
	 ZCbdYBDVyfxTg==
Message-ID: <sashiko-outbox-201029@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: mtu3: cancel EP0 requests to prevent
 use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fangwen Deng" <fangwen.deng@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106080140.342107-1-fangwen.deng@mediatek.com>
References: <20261106080140.342107-1-fangwen.deng@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:11:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> mtu3_ep0_dequeue() always returns -EINVAL and leaves the request on
> mep->req_list without unlinking or completing it, so an EP0 request
> can never be cancelled.
>=20
> FunctionFS assigns its temporary read buffer to ep0req and waits in
> __ffs_ep0_queue_wait(). When that wait is interrupted by a signal it
> calls usb_ep_dequeue(), does not check the return value, and its
> caller ffs_ep0_read() frees the buffer on every exit path. With
> -EINVAL returned the request stays queued and MTU3 still owns it.
> When the host then sends the OUT data stage, ep0_rx_state() writes
> the received bytes through the stale req->buf, giving the host a
> content-controlled write into freed kernel memory. That corrupts
> whichever object reuses the slab and can panic the kernel.
>=20
> Implement mtu3_ep0_dequeue() following mtu3_gadget_dequeue() but
> [ ... ]
> request, which deadlocks against the FunctionFS thread holding
> ffs->mutex.
>=20
> Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
> Signed-off-by: Fangwen Deng <fangwen.deng@mediatek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106080140.3421=
07-1-fangwen.deng@mediatek.com?part=3D1

