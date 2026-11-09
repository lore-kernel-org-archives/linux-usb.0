Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204513;
	b=JfLKzUgKizWPm/E8lq5i4cqiQH6OSuvdg7jmdt0NPWVjQ8aiSZqM/jF49bYlqmHYQVbH
	 /N1Jyj7K3jTmiPx+F/9XefjbTKRZLGjEJqj4PtZDkfBXTjig2OVT6utjwdycQK5KUNzf1
	 VuKwWnv0w1XhQLNNH6oBmcuGEB0tC86JbCMEGUeSrnYfQ+JdGqCHHCDLf/HeBGMVVLvJF
	 JhCHb00Q/CVg1qixvwbgkGasSZYc9tHuMMC6vrv+QWbotTb+YdtarWzFb6A/z7Alkvgr8
	 J8k7puA2nb/qICDNnJs04tt+l9dNU5j8tzPCr2r1QfOOR7dC7PQbdhLn7yj+RYBT+Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204513;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iI3BG1Rbc3VZQ5N/Rpxl105c4moIK+Xy8hOxv/WPZ64=;
	b=gG0qZgrKZXEyvYSCyLyIfl0An0qMwEqY0BqjS6B0F2g7d28xeOkf/z3HHMVYLQznln1J
	 SSlKuTowdWh3S/to+NdFLAS6RxZskth10vwt54VUzZIrMYvR91K6e/ALHEfW27AXX7Ixq
	 E/rb3unYpUT3rfik+zxsZvCR5DQC9xKMtEbzib+dh2s3t149hBd+oUJLkHV4wzAbvhwHG
	 bpNySEKyE+sFMD/4Yx71dxcrBR2gBX14bONftHCksPsecp2mTi2tYvsNx817tyIKhL0i9
	 ahFpF9/Q2Ynct++KL8rO0BNz+4OOcx5QY4GqXLUAY5y7yugZpzh4FU53/TQkaHpFP1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PArVZCTg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B40C606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PArVZCTg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089E41F0089F;
	Mon,  9 Nov 2026 06:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794204513;
	bh=iI3BG1Rbc3VZQ5N/Rpxl105c4moIK+Xy8hOxv/WPZ64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PArVZCTguL5bDo2SN9O8ElG+8UZZVFS5LvIw3GXrc7hPtMCZpNh7wf2Eu33CC2u6D
	 7gzvGcH//6Ef4PgDTe9Lp4WUAKc5KYBTnSSaoSKunZsV69xDuTAyO6OY3Ovf05Hqhg
	 T/SDKi0D7HKbtaC9pFKLxOjM533Ip3cvmy2zTX3gfj4tBKXj9tLTqtxABN8eYKaM5X
	 sHcqUmzIa2ZhjyvlQQmMSq6/c+cq5Tdm6dwKBSJWQfLsVWMcdSrfL70QEWxU/fO+Zv
	 E0qOiwW3qWDtj7ZUJiEVtWxM5SS3eQLzVusMRXIBpddDd/xHvH6WGiIhal7adIMI3C
	 h7XqRtmcKHgAg==
Message-ID: <sashiko-outbox-204485@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] usb: gadget: gadgetfs: prevent ep0 event counter
 underflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-b4-gadgetfs-ep0-v5-2-f16d0b648bc2@gmail.com>
References: <20261109-b4-gadgetfs-ep0-v5-0-f16d0b648bc2@gmail.com>
 <20261109-b4-gadgetfs-ep0-v5-2-f16d0b648bc2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 06:08:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> ep0_read() snapshots dev->ev_next, drops dev->lock while copy_to_user()
> runs directly from dev->event[], and subtracts the snapshot afterwards.
> A concurrent disconnect, connect, setup, or another reader can reset,
> deduplicate, or consume the queue in that window. This races on
> dev->event[], can drop newly arrived GADGETFS_SETUP events, and wraps
> dev->ev_next if the queue shrinks below the snapshot.
>=20
> Dequeue the events into the local buffer and update dev->ev_next before
> dropping dev->lock for copy_to_user().
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-b4-gadgetf=
s-ep0-v5-0-f16d0b648bc2@gmail.com?part=3D2

