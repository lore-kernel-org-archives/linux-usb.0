Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928719;
	b=Ls1uR1pcTufZh2X3DWD49lYKgWjh9JyNNp8tOIZu3dcaEm9/Kr6IOGoveIm6fr4+NBCo
	 J9AVl2T2Dl4Ig12JkMTUVEvrF0TKskJ0ZB2Uh+rwpUjFZG4iaRTBLYQIJIwugX0uzFCsp
	 wkmSmBYWCA0q4lPbRSBI4ZhSOIkohi5W/UAOoLtIBywyavlUBmR8TGyP6BdzoDerRHo4p
	 9L+J9ts/5j8CSNAnGKhVyPrWpSxKqA0HrGB0WcIKSqavm1Fwj/+KHOU/BkHEazDDSo68Q
	 dxOUtd/XTnGBYVr86uLwFDFi4Bi+F8nsNs+3uKGM9PJqLX0NfdpWVVItvr3907wSs2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928719;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3dNfWQJxV/DKwqCL+uN1JrQhQWRngUrXKQwxcN8FLF8=;
	b=T/QtFLttblzvQFtciIGRcatBQHAGChQ87MtPg7Oun1zM+LD5BsDfkuF5t2keAIOGmLOn
	 +oM2kXyozkjChVcRb6NLF4xpdFBrjle780n92VkGjQSCGULT4jJGF9sB8QPOxIcFTaD7I
	 GjoaHSjlLWWXNgajpHtURp+rgH8E6GnL54lkGgMKdNBIuRie8dU1jeFH9w/P+lHaCCNIk
	 ndScy2uZWHYF4o57B7EpD1L2OXjSeJYxh7CJzJIwgjRDbXcLMG1q6w3MjTo1cazjNSDlC
	 ZLc+hSUv+ejQswBjC2fYRRlbRysrs7s8p2k/Q34071tfBtWSXxiSApA9wsp9JE+arbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zh7o1qxB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91633606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zh7o1qxB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F611F000C4;
	Tue, 17 Nov 2026 15:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794928719;
	bh=3dNfWQJxV/DKwqCL+uN1JrQhQWRngUrXKQwxcN8FLF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zh7o1qxBAvDo2OCd/hmLpK/s8ZXkpoOkAx5MV54fpy0AAnxBdWqzWZGKI7Nr88POT
	 amP0/zIsR+YOmHUxvf2OmzeK9uUlvYezoib437G2OLANYL1JOr37LQVuussoT5NW/N
	 ePafG/BekIT8TMARN1A+FzCNgj0YBOWxD+Sn9o/+CDyhmnxjzqxU/3qcXptoy2czf3
	 jmWHjJ0H9Ya5TnPnCNRtpriFi8a4dCoNLMkJGG/TzKMMnerbT+ScaYg4apBZg7tl1u
	 9K2MNTqFF2tICCi8Dr7/YruUS4sRPLE7CLz9bHwT3J7gtZS33BzlQB2WY7zbTtGqUq
	 yxCJhCHWQyI2Q==
Message-ID: <sashiko-outbox-219045@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] usb: dwc3: xilinx: use device_get_match_data()
 in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117150219.1326693-2-radhey.shyam.pandey@amd.com>
References: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
 <20261117150219.1326693-2-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:18:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Use device_get_match_data() to obtain the platform init callback from
> the OF match table instead of calling of_match_node() and dereferencing
> match->data directly.
>=20
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117150219.1326=
693-1-radhey.shyam.pandey@amd.com?part=3D1

