Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261883;
	b=YPIZUSjjp++rjAn67VLVgOja0byBtpPjxJnfAxcRGCyzNres4C74ruYU2aj8EWQbThTX
	 HXZm82eCSPRru8F1msDX6k1esqd9TTgUtEeMzkTpAyCQDSDMU+uzDJwk1nTSQ6XDak17g
	 WwTmCR70N3BU+6QTa/g13r7L5zAcbeysaHexbfeFnZjKYMVJlIh04BmPFdSWacYRsX3Fo
	 xDsLSNJ+QQEKY6dvu2U2410YHf7PrN2SmUIbP2ms1tblPBmNSJ9JIvI7JPYP5Tee5rixP
	 XQ3sjkF9RiF10WpznBiSLZVodGACLGol8xrmBxibPIOUxOVkfby2Nm4aR70YvWiSBbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261883;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rgMMhyjH4vRchvDX0nuzXTl0E4EinY1C62Glq5AnGRU=;
	b=lO795hn6/rPz4E0NGOeU6sdceN2/WLoaberlv2aeA2Thoy7ZheXshGsJnTjYZCxSBXN/
	 3yVqCxSbMELTde6n6ZgQrtZbcL+M6yGWryQe508AexzWPd83iVOF3O4S3SmNrEjKOxVD2
	 ouJErdOEAG1cdKSXKlecD01FsUFJbUgDacnRo82lGETdnMDBKnr1dE+cIv3iZ6DHJtZ2R
	 3bCkOyfZHjHHJ66mAOMMHwhER1lHX+KvbRGtaicHMkjLgADZXpsr4dtabtJ3kcQfoCGrU
	 kKIz/s51nbH2G486mHm41pd+IdozarA7ULd03BHMKaFUgIcAfMirRZ02tl6g+MJEjpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGyv9oA1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F49606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGyv9oA1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D731F000C4;
	Sat, 21 Nov 2026 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795261882;
	bh=rgMMhyjH4vRchvDX0nuzXTl0E4EinY1C62Glq5AnGRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YGyv9oA1QfAe866OkrES94uYi3mrnEJsNTie7YR/uum0e/hAmkA7M4fm36idt5MYm
	 2DekTnWq5YrAhRge3tSNWewbovOl1/2aICKuug0ljQrZHn12+KXO86AI+SY5IszPzG
	 5f+G/uhBX7ucmnoVGCSmjQado+st4T53iKdhX8WitAmv2WwDxDP411yVg7mYxUNxFz
	 c1ggWRxFg783+AFx/3e9hp7HMFtiE50C2IwRBk6JLZbAIAhmN2smAlnr/cvKjMvgcG
	 qXuX+4fhjAK67ODRscIpdg+DjBCq+Vy/BtNf0FdKDH06p3TWVW548h1Ba29Pul71zT
	 D+s6yjubY2KTg==
Message-ID: <sashiko-outbox-226993@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_ecm: serialize notification state
 with a spinlock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261121114154.30274-1-yuz08559@gmail.com>
References: <20261121114154.30274-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 11:51:22 +0000
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
- [Low] usb: gadget: f_ecm: missing Fixes trailer for notification race
  fix
--

commit 5f8ac3914708382417c9469276b098d970817bbf
Author: Yu Zhang <yuz08559@gmail.com>

> usb: gadget: f_ecm: serialize notification state with a spinlock
>
> ecm_do_notify() guards re-entry only with an atomic_read() of
> notify_count, then fills ecm->notify_req, does atomic_inc() and
> usb_ep_queue().  This check-fill-inc-queue sequence is not atomic and
> runs from three contexts that share no lock: ecm_notify_complete(),
> ecm_open()/ecm_close() (netdev up/down via u_ether) and ecm_set_alt().
>
> When the completion handler decrements notify_count to 0 and re-enters
> ecm_do_notify(), a concurrent ecm_close()/ecm_set_alt() can observe
> notify_count =3D=3D 0 in the window between the atomic_dec() and the next
> atomic_inc(), and queue the same ecm->notify_req a second time.  The
> request is then added to the endpoint queue twice (list_add corruption),
> and notify_state is updated concurrently.
>
> struct f_ecm has carried a FIXME about this missing locking.  The sibling
> f_ncm already serializes the identical state machine with a per-instance
> spinlock.  Do the same in f_ecm: take ecm->lock across the is_open update
> and ecm_notify() in open/close/set_alt and across the state update in
> ecm_notify_complete(), dropping it only around usb_ep_queue().
>
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>

[Severity: Low]
This fixes a concurrency bug in the notification state machine present
since f_ecm was split out.  Should this include a Fixes tag for
da741b8c56d6 ("usb ethernet gadget: split CDC Ethernet function")?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121114154.3027=
4-1-yuz08559@gmail.com?part=3D1
