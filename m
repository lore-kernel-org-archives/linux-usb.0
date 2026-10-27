Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112633;
	b=1sESMdvGd2rHqjdOld/LQKyDOjyLZEQjxHGUn//tEEhXdGJbaEDciNiWetdqp/4njlX+
	 IAZU+CcV+ssjsm3xaLFVai9D3xNgQAKFIIN6HzjxJXIFoGCmP0zOYQxfT4WqqLM6JzerN
	 fYPbNQbM1stNmv70VRS/bgl1V4BCQ8kf0NYMT5U/AlZdZ//51QlryRaon55P+AGotTWPq
	 tuwa1E9MNqVAfvYzThjrMN81x5RDoQJza1rzxkrcjMhHWwkNFsQg5qsCVDU884c70pYxW
	 +R+z8EVSncS3FNwU/oqkixpLjt7QjtOuT+pRHdOXG5XM8pPyrNe0QU5wYDtgWy9Ma1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112633;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yTgtiAv1UeWEPYPmapM73abPYQDYmu3V0xm54Amz/yk=;
	b=D5WQyAmuWtlVdLX4h8v3odheehLhf/tCRnqyQCLtOz15OIMvlK5soB7O36xd9WLkj7ij
	 46BxHLS/i+W+9yhWVMPbu62y3G2LiTfbTf2Op5CJA/gTNzZVCmmMDGrSyTRiWxMFXFLxN
	 B1o5wixvd2saRniTvy80SFyHghe4yd7L0Scw9kRoQBM3rUbF8Tecvqwmi4gbJswpAXdP9
	 cN12K9SkK1QhMwC49elWf99Zv5eQbBvLutSwZa4i9ma3aL0KDTLyi+ISH3W2V85mcxUM5
	 f/dYURm9BHvElfyzhKXiGc8bvQrYtB+jpfjeSoTJcP9ESLPLn/yV3XX+HiUSJFFWjGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJY6+X89;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634CF606A323
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJY6+X89
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCEC1F031E2;
	Tue, 27 Oct 2026 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112633;
	bh=yTgtiAv1UeWEPYPmapM73abPYQDYmu3V0xm54Amz/yk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hJY6+X89dJ3bfnpUk/En4S8BeQ1eIllYYWfp18z+zsh2nzOqywlNvBdVexG5M4Gwb
	 jXNySphBEvBzUh0HFy22dMwRn0sfQb559dgTfSm6ZVCzpuUV2QaJFmfzM+zp/GuWFm
	 zqSrdd8WjX2pK8NA61GJF+VVr8Xg7g1YjrYJCY58WUjWXBfEBheKRcZ3qbG5tpAlo2
	 utJ6qxvegfjaPNoqhktvKrKKpAdgHjRoduW0SO4VwTLdNeUeG4csIo3c1H8X+ipP80
	 X3nK7o5WOoY9qYZ8Y5TLtArxhpsxFqS0t1koq7uF5cs8RD0wAIJmoX2bHPF43oEcQb
	 r1L9uzwltjZ+g==
Message-ID: <sashiko-outbox-186765@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] usb: storage: sddr09: bound the unused PBA search
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-storage-v1-5-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
 <20261027-llm-usb-storage-v1-5-d1655e94ed10@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:50:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> sddr09_find_unused_pba() can read past the end of pba_to_lba[] and hand
> out a physical block that does not exist on the card, which is then
> recorded in pba_to_lba[] past its end and written to.
>=20
> The search resumes from lastpba, a function-local static shared by all
> SDDR-09 readers and kept across card changes.  The first loop is bounded
> by end, the number of blocks in the zone, but the wrap-around loop only
> by lastpba:
>=20
>     for (i =3D 0; i <=3D lastpba; i++) {
>             if (info->pba_to_lba[zonestart+i] =3D=3D UNDEF) {
>=20
> After a write to a card with 1024 blocks per zone has left lastpba at,
> say, 700, writing to a 1MB card (256 blocks) whose blocks are all in use
> walks pba_to_lba[] from index 256 to 700.  If any of those out-of-bounds
> words reads as UNDEF, sddr09_write_lba() stores into pba_to_lba[pba]
> and goes on to program that bogus block.
>=20
> The bug was found by code inspection and has not been reproduced.
>=20
> Fix by also stopping the wrap-around loop at the end of the zone.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-st=
orage-v1-0-d1655e94ed10@linuxfoundation.org?part=3D5

