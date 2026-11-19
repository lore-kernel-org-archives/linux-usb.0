Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096143;
	b=YF8P9hhn0Si9Ah4xcHuJn8yPC2I03OmIf5XiMBZRWOh0rAmMTl+A08sgCyj0O3e3IQY6
	 LW5Nna9fqpqimgLO8TS16P7wKe3wdBBnResZBZneZXNmvVO5eVMKkTnBboRkLA/MASgCP
	 Ew6gxpq8lL255xXc2cvhAtUJvs9Fkh+yVl7VxQkQedvqUCmsrMhmbomzod9743Ht6Z4T1
	 mITnDrhQ4PRiE5U+AuYE3qrVPbw2Ew4oPkLOygVKI2X/RRb4kE9rTOgUhuyZZORxq7w62
	 uUEE2V533zpBHFuSmtXhEeXhbjfS0KV18OwiMn5E1A1zBvYnCdaRb5ChltDEJJ4S+Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096143;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HrToehP/qOaQplfbyQqWjw9uh5WTfktycYAGYQ5/e0s=;
	b=11plrHw1nQn2twitcNNrS8pQk1uzaE4CwIFMVFF0CX4mOA9FZHGHmgwtNiNNavFNTzpw
	 KP/CQCEXarIRS6Umr/hmga180I90yx6BcBoCb+0G34XDAWehQgNzQ08czxjylV4vX5WrV
	 gXQVHd4KBXCV0tDGO5T7e6Euy9p/EvuCxbBaFE5pT4bVMcQtbXLjFxzSnof36AwEHAP4U
	 Mck9lTLeMzj66/KgukkNV5JzRRYjCXcSMP7X88N6jLfC7sGTu0s8ISZiH2NhOuvXWHqJT
	 aRgulouer1BuYGQyCiPlbWylVrjdoabzELJbWnaNjy+c4lqejDP2gwp9q+/NTLElwwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tpof0Mls;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B0E606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tpof0Mls
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB151F000C5;
	Thu, 19 Nov 2026 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096142;
	bh=HrToehP/qOaQplfbyQqWjw9uh5WTfktycYAGYQ5/e0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tpof0Mls4Kpugvd6T7f7NSSSDD+SvLA+BEDvJRSmX82U/vtjpheV8moNjGfuiTP5o
	 HYBBLJEDzlE3iykUeBSxS58k0BBspjaU23RMQu/GbsYzCO/C8dwSoNcTqCgym7zgZ0
	 lFI3m4jhT88JB9MTcW+JS+9SDCckxsW6LOrLybw4Rq3PqS46B3GAp6PopRWSP7D4tt
	 qKaPzlyYhhmXTywNKPRh+Us09sQlM7wByoni7rKkgxvNqVEtOIUccnA7AukcE3legL
	 9WDWgp1Po9Pn6QosvZMpWg1C9AbuXSA6wZZdgQDutOL4xzEhunenC80cJ9rfoxVOwd
	 sDDBZlGq2hj4w==
Message-ID: <sashiko-outbox-223209@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] usb: chipidea: usb2: add optional reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-4-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
 <20261119-b4-spacemit-k1-usb2-v6-4-4a9add848728@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:49:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
> compatibility, add optional reset support.
>=20
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-spacemi=
t-k1-usb2-v6-0-4a9add848728@linux.spacemit.com?part=3D4

