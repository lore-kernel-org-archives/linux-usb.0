Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842029;
	b=FCky6Fb73ENA1Slp609opCNiNOYKn0wqR7FIViRNJhmQ2N6TejcaQKD8DF4cP0/1ieN4
	 K6iYdXrenne1N4EdcxeuUy2qow5LnCB7zJGtrojdUISpVeojGq8jUb5QDjC61u0MqBDUC
	 LbN++qSKsAM5ec3uxGUmV2WjUcQqlweN3P98ddwKRQVFuYcmlLclroL2GUhcAGFaVFfZB
	 3L5cD/MGi4hgnUUCOH/1tTjLyrcrpulZ/cGyYSi7C0ge5LmC8wX2e+5vfLO+wZHLGK5UB
	 GUBMeKUXioFmDIVlbziyHfZbhgAhs8gisUFMRWARMxp/Ie3NlceDTOsURopNsUFR9Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EfLQHqR5FV1EH6ROEmts8dBe4NUf++djlkZDUjsnr58=;
	b=hB5CQw5kWZ/5d3o7ADW38CtP4BqscKlx1Yq9Sg7arPrpFDgNZP54Y0WENGvu8FdwAmqf
	 1JXDYwBq96Ek+2wJSqQutIFAowCXG9AUXwRVeTHBYmFqdPhjjx5p3u6BXkfFTI/CQBGZ5
	 IzZEAwSKHOvVyrBxtT3bWpENj/qN0Dw4BO3Sd+guizFwW0rMoo7GwrA+60V48MkIJwgsM
	 IZeK7tY1IlVa4VCj1b3hO1whuELBUHaTx3LkxQkNrR8BVF4rXgxjg3eBc7zekVPbDm4ry
	 S8tQonHAH6J03g42bn1DCWRvx+FuQ9e/lHClmIsCYn8573wKFGWDMoRVV+pNZKzeazw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkx4nbMc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1AA606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkx4nbMc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A451F000C1;
	Thu,  5 Nov 2026 01:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793842028;
	bh=EfLQHqR5FV1EH6ROEmts8dBe4NUf++djlkZDUjsnr58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nkx4nbMc+7c87S+/Zi/Vzr+ii166g99142PnhChdJWD51YdPip7gCyFSKGHzb6UW5
	 ynmesfT35LOnyuTvOoQA5tcuQFwBucZdVwJwZj5tXJeeb8EQ4nXeyjY7tVMQjOGt3X
	 pkRqUAV+YLbZZm6IiDs44JeVm4O1APQ5OkP9DKcCW1DmO5d9ShSWcrzYv/TKxhfdSF
	 ex3IYBlVop9dHrQuJIMfbM2gLSqbjzlGR0UjyTiSgS9oSsplMvi6QABLOlR8r4Ni5F
	 U6sRNpAn98KSAbSPnea3WM4XhdfjkiMRr4hvZJhphSEM6g52uHLVlR/CfUUPqzwy/4
	 vAZc1/PznoZWw==
Message-ID: <sashiko-outbox-198409@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261105011803.4058557-4-hongliang.yang@cixtech.com>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
 <20261105011803.4058557-4-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 01:27:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add USB4 and USB5 controller nodes for the CIX Sky1 SoC. Enable USB4
> and USB5 in host mode on the Radxa Orion O6 board.
>=20
> Each controller node is placed at the address of its glue registers in
> the RCSU and contains the Cadence USBSSP core child node at the core
> address. The mode strap register offset and bit position are passed as
> arguments of the cix,usb-syscon phandle.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105011803.4058=
557-1-hongliang.yang@cixtech.com?part=3D3

