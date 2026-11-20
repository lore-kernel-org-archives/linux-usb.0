Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209173;
	b=YVfiHhSfPF/4lHtpkeGfVZMZ/Cdg6UuFZSn0vKTAu+GpfpqWJbFEyIWQRqkG9GWHc9Ul
	 saze4F+oMR7F9LefaD/mqrqwW/GsXKUazV/8QwqTYVVhWk3TZJCNUOMSp8Sr5CQ7PD/7C
	 7VtWlCe5/FOD2+U3lq6BCfoCpC9MyE4RShHwd9q0lb/SIvsd+VMVoiD+gnP1Q+8b5+I70
	 0ng5S78NqJjBYE4wqKl5K4arWYltmqFUjQcB/JQ4o9D9u5jcW5z//vyMGUSvAcFfUSuh2
	 gU/a2RFz61AayxLvsb0YeBZZrOyoBtPAnMPJ8cqoFCVixyyoB7edHfpLsR1Pj/vxAIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X1XkGWy8XkmHX3OiBR3MeMAH5Co+yYxagvEOn0P8ueo=;
	b=P1wS2jP0ac3Usx1rkQ4n4dMO61ttCTGB9WHeKYLPu4UYOCymocH+QV0zzo/cFn/KPI91
	 Af6YSTtY7qApuEshFwSsyn1bgHvrV0gDiPzJmf43f8rkfwGTayj/GTI+oU7GTq1J0wQrW
	 4fFph8egZFUavrwLIJSiHVYnoflAApjWk3EeBM5Y6uaJy7MvVBHFEV7xvR68DCeZSnhAk
	 i9jA3HtiCz+oerb6QIIi6u3uzi70VS7/OFXUzwHEc5MCQh5BMtCapizy4jdXg3ovITNOe
	 BQqV6CHJyufmCJKmFJW4EYY50yUX2CYMJghRnFCXxcAG7oNNcy0a93/ty0lGU5fhwpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crnGr3Rj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C9606A332
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 21:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crnGr3Rj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9470F1F000C4;
	Fri, 20 Nov 2026 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209173;
	bh=X1XkGWy8XkmHX3OiBR3MeMAH5Co+yYxagvEOn0P8ueo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crnGr3Rjwl+9dKP8v/9gdbvIQD5xftiGnFmgi2V7CO7WPGQxJYChTiyI5Xb20/dLe
	 N+IBFw2cYLsDlJzethacifTFdHqjm2iKoyRzg39ELDEZUfSMn/rQ01JJgFiHp4b7N3
	 WgLLAUa3dSOiel1fNASi6Lhmsp7DXN2mn5+updSr8NTJivsnf1LSQZ+TQD0VdZjsN0
	 89Kns1FCZ5P824shaLPNPEv+q/osostQSFuDJmjveNMTNNNL1DlEoD2v1yxMy5k6l1
	 NzIaeOvrzlrK4TlGvNDO1gM2v6OFEE2IzhVH5HEkVb/j1vLThw3Qsu/ykvegroarbt
	 Vp9Z6w/azx0VQ==
Message-ID: <sashiko-outbox-226143@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_fs: fix use-after-free in
 ffs_func_unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuangpeng Bai" <shuangpeng.kernel@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120210616.2293426-1-shuangpeng.kernel@gmail.com>
References: <20261120210616.2293426-1-shuangpeng.kernel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:12:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ffs_func_unbind() calls functionfs_unbind(), which drops the reference
> to ffs taken in functionfs_bind(). It then keeps using ffs: it takes
> ffs->eps_lock to free the endpoint requests.
>=20
> The superblock holds a separate reference, dropped when FunctionFS is
> unmounted. If the gadget is unbound (for example by writing an empty
> string to the configfs UDC attribute) while FunctionFS is being
> unmounted, ffs_fs_kill_sb() can see FFS_FL_BOUND already cleared, skip
> unregister_gadget_item(), and drop its reference. Whichever put comes
> last frees ffs, and if that happens before ffs_func_unbind() is done,
> the eps_lock access is a use-after-free. KASAN reports it as a
> slab-use-after-free in _raw_spin_lock_irqsave() called from
> ffs_func_unbind().
>=20
> Before commit a3058a5d82e2 ("usb: gadget: f_fs: remove redundant
> ffs_data_get()"), bind took two references and unbind dropped only one,
> so ffs was never freed and the late access was harmless.
>=20
> Do the endpoint cleanup first and call functionfs_unbind() last, so ffs
> is not touched after the reference is dropped.
>=20
> Fixes: a3058a5d82e2 ("usb: gadget: f_fs: remove redundant ffs_data_get()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120210616.2293=
426-1-shuangpeng.kernel@gmail.com?part=3D1
