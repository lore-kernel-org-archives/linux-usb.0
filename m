Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795312046;
	b=wykXGbcyXtBuJPO6aJ/dcfz7M9Ki//vp84vEBrY6OLCOdkg9HMZj7MTpIlkifSOq2eVR
	 uwOwg/gYgqftJIkaozbRYGrBTRm1pufkon7pZh9WG78fxNtChN5KgIt+JQgyaIw2j7m8H
	 t72jMezQF9/TLZXdxJHrNyYqBchFyzhf86+RCUksghCTHEwzvur3YA+GG+M+eA3YUWg37
	 QXDmpyRLW9mSHIczdPsP0NtLDi12nC1faOcSJDK0XF5eDHaVqMbb6KNJ/5rsD+X8e2KFv
	 i47rTHBiKMjo0S/kCc2Lu7NqgSIBKflInLAwPMJRpLwJOWSWmRn+BxGGqXb516iRRmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795312046;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gn1XUnpyi7mfxZPMim5hb/pCkb5gZCmKtwtEHQFpUns=;
	b=hJR18liTbXe8U3/Ig2sGvTgbVtBbeRh6tjyyVJ6q3Gi4QjgRPFxjXQFqf2Th0ARwZNZA
	 kI7AKvG/wgQ7DEURO2EueySrNsAMzGoXrWLVX7EZDNan0qumaFSSLDycxRys7BkltNprv
	 L7CVFOUK8prvQFBKsRlmdaLn9N7+cIZq2d7bq/1Z/9dsjlnVd4Cz9gjGH+KaBu2UKCPMV
	 qEuydwHubimRoJAjpanBMJlQ6wpwjNdtjlyV+B1nPcC44Bz+u01WYA+eDrkx+D+eRPDGE
	 YCN4hEpv98pYoxfxeab5IhtV16/QIpS8AWUe5b0kMmQBeojjRL/gm3MC/IKfQXweuPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nzd0+rvP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5B606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 01:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nzd0+rvP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D081F000C0;
	Sun, 22 Nov 2026 01:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795312045;
	bh=gn1XUnpyi7mfxZPMim5hb/pCkb5gZCmKtwtEHQFpUns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nzd0+rvPonundLalCoUtGWfyXkoUqyGjsvRShIMPU0+jWUxnNLJVWM3aI1s7XahNu
	 OrCyO365/4UqNzkV3Eh27ug3D7Mp+1qJ6Sc3c2uE4EpjbKhGU9YHLOn6EGe6E1pzBi
	 xyzUEEcsSir05DQDfsLU+Z1IjG7D6qhmGJjtrF8hnSC2fxaEM0NHoSMQtnVVCm/7c9
	 fq1y6dYwVubn+lU68KiMAocUqZ9uZfReTpD71YUu9WbWdBjoIHx/cgGwg24CukMFqe
	 WC7DvZS+U59wejjxr/OCXSGAFaUKFDbhn2NPU3h9E2SU6quhRpckQ247VbYRZE07ZE
	 u/B7bZCIyXRxw==
Message-ID: <sashiko-outbox-227634@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7] usb: gadget: uvc: Fix deadlocks in uvcg_configfs
 attribute callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saad Varshani" <varshanisaad@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122013844.4743-1-varshanisaad@gmail.com>
References: <20261106020727.6055-1-varshanisaad@gmail.com>
 <20261122013844.4743-1-varshanisaad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 01:47:25 +0000
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
- [Low] usb: gadget: uvc: missing Fixes trailer for su_mutex deadlock
  fix
--

commit 0bd36a770e5d04da64ebbd0e9d7067fa2cb829a6
Author: Saad Varshani <varshanisaad@gmail.com>

> usb: gadget: uvc: Fix deadlocks in uvcg_configfs attribute callbacks
>
> Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
> Done this due to the deadlock caused by the mutex conflict in
> fs/configfs_write_iter. Validated commit with the C repro provided by
> syzbot. No other conflicts observed.
>
> Also removed the su_mutex in the other attribute extension functions.
> Such as uvcg_extension_b_control_size_store. This applies to all
> uvcg_configfs attribute store/show functions.
>
> The deadlock was happening due to a circular mutex dependency between
> configfs (frag_sem) and uvcg_extension su_mutex. The reason it is safe
> to traverse item->ci_parent without su_mutex is because
> configfs_write_iter() calls flush_write_buffer() which calls the
> attribute function, holding frag_sem. Which prevents configfs_rmdir()
> from unlinking the item or its ci_parent hierarchy
>
> Also reordered fmt->linked in uvcg_frame_b_frame_index_show() to be
> under the &opts->lock. As well as reorder refcnt in uvcg_color_matching
> store to be under &opts->lock.
>
> Applied opts->lock mutex, to functions uvcg_format_allow_link(),
> uvcg_format_drop_link(), uvcg_uncompressed_make(), uvcg_mjpeg_make(),
> and uvcg_framebased_make() due to them also modifying
> color_match->refcnt, to avoid concurrency issues.
>
> Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=3D300213c2b5b55c0244f4
> Signed-off-by: Saad Varshani <varshanisaad@gmail.com>

[Severity: Low]
Since this fixes the su_mutex locking in UVC configfs attribute callbacks,
should it include a Fixes tag?

  Fixes: 46919a23ee87 ("usb: gadget: uvc: configfs support in uvc function")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122013844.4743=
-1-varshanisaad@gmail.com?part=3D1
