Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847466;
	b=VJWGz4f3yADcW5+1Gw3+w/3jYXRX8B4IH0r+cBzDXTtUgBGbxQmfAn/kFU+RP2jQEBTb
	 lppLwGG7vMW19unNMV0brnvIoSBKALtzIi27cNq1dXRvFyk4iDvT7uOHf/SBqsDH8RxO0
	 20JqdEYQ4NxDq16P3O5NzOCTAR7HKUUyfDj0eRb0WaiuPtExbjiue1qICegZfArvO7AyI
	 FtaJYYUO2JodRQyPFkuhmOTyGlMKnpWqNInBVHTgipqNDiwn5JrLVu8YwPkZzQ0CmPDw1
	 zHQqGwVKnBs6DrSvpLQLRvGoo78ZoYdNvBHcLo4SxexdFRMsi+ehCll+nHWf7SKBvyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847466;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=grfJIuwWMa0JgR/m3uOeBe6gb0LE9dPJZg8rPGWkB9g=;
	b=TE2JkVdQfrPNcvArwBhvwc9lXn8YcYdMFJEpqCEeGahC3q2XpSci1Xhm0kUQRJyGJ+hc
	 3+cPnPIJV9yBwJk26EgTHHoooF/ujuC5cQCQIlM3UskkwOTWiCNtOcD8Pl3gVpaWYMLz4
	 RPxrGHpKLrXhZK529pMhMz3RNd33UBBZVEh5ACUi5h778H3ZcdSSHUUmoxmBy2BWFCfp+
	 NscUjudMlQvkPG98CzOGteS0GSogc4GXqbMpVSvDt95UF1G9DgkMu2qjLzdccKjrJa5lz
	 rPSXFSLZ8xiuDz0Kcz83StTvCjOxVAzovo3PBlsAKDFi4zAHEbmoatom80CiHOR0CSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JckUFU2X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76F606A880
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JckUFU2X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134851F000CB;
	Mon, 16 Nov 2026 16:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794847466;
	bh=grfJIuwWMa0JgR/m3uOeBe6gb0LE9dPJZg8rPGWkB9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JckUFU2X/ekSXjctgs/uf9JPQKyzGtjEEw6sJlG8LQpaFgjg7hUf+evB/+STxGFfH
	 iFXFjMG4oyiUjYKywEW5ZJSv6yLVyytbCSRxRkI+y961u4iNTUytvgekBF/5oSKAJY
	 krCUYIOkz6If9NuobXdNKm/VsJ69TMSAi6iceoMsimop9lyartHBpvRUAOgDAUwqVU
	 KS660Tn4RbEhhnKUOEfqbgCYpT2ssLvyT7KNMoJA8BFNSI5karu+/00XVldO+hueb2
	 QsTedPDNrFUgl6ST+yshqnkRE6I7LIlH47N6RwLg2N/8TjYL5TMSZOKIA77vsCqjJJ
	 bnkq4ZuRM2ouA==
Message-ID: <sashiko-outbox-217379@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb-storage: reject too small values in
 max_sectors_store()
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116163946.2502-1-25031212351@stu.xidian.edu.cn>
References: <20261116163946.2502-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 16:44:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Writing a value that is smaller than a page worth of sectors, or
> smaller than one logical block, to
> /sys/class/scsi_device/.../device/max_sectors passes an invalid
> max_hw_sectors to queue_limits_commit_update_frozen().  The block layer
> requires max_hw_sectors to cover at least one page and at least one
> logical block, and treats a smaller value as a driver bug:
>=20
>  WARNING: block/blk-settings.c:389 at blk_validate_limits+0xeb9/0x14b0
>  Call Trace:
>   queue_limits_commit_update
>   queue_limits_commit_update_frozen
>   max_sectors_store
>   dev_attr_store
>   sysfs_kf_write
>=20
> [ ... ]
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116163946.2502=
-1-25031212351@stu.xidian.edu.cn?part=3D1

