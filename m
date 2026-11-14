Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794635821;
	b=stRDi4VwyLEPF9mK1/usqE/2bQW+vwFLcBJZb9w4CBs88ai/pBC/m9bw91deD9LGVeeu
	 sBeoNvOvTi9cxGTUV7+E1glsOSpwSWw0ShF15KGSVUNn63cqcXW3EJrC/IGxvtbBPSQbA
	 FBgovETwGnqs/H27bFn7pWKpfZ6Cd5cdIDolB5Sx981w1sUx3Kvv9KJa3UX3eQoeXnlRV
	 bvvxJzluU7P+uOmh0bssf43RPrAptHOqHP3LkrSpO8f/vc/gx9ubs1yxPoqsTZp0p9GVX
	 r94jXXk6VrfFXTnfIYrR2CoN2iJfJeHSzzg+aiRBE7CdGiCUCeo/r2UyhZpgekIi48Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794635821;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KeUNGXUJa3boi8WiYmoize3LKJqHl5pMz3nwgzbqWkM=;
	b=wQ4bBHN6aBWxwyRi9utwaOAlqx/jHzBs9oGDge5QPq0GbQnfzddBowe1HUFfV7A2OslC
	 DZQzAdpuDUeuVmxzGpmWK0rJtgH3tfH/P3RWdundmezpLm1t/4D8bh0i/uYpWGgGyMU5F
	 WvAnXA/kpvVsaLQ6CW1481lMKeJ9x6iayMx1fshvdS42JiZVCnAedH/4MP4AzXiswjRzW
	 9U2ontKPvd24qCn9GEKn9ti/9C1e5HvOsbvDJXp/AWBPdlEqIBSvkc6WaFbnfxazDi8TM
	 qcfOP1isTz+yMivMDb29FTzTuxdoVY8Bd73Ndnjr4UZZnGXBT2dwFWW+UNTXbfp2jYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aqhSPTF3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C26606A329
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aqhSPTF3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45431F000C4;
	Sat, 14 Nov 2026 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794635821;
	bh=KeUNGXUJa3boi8WiYmoize3LKJqHl5pMz3nwgzbqWkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aqhSPTF3Qm7SBiWqEki/u9uo5I9UnV1vRvK7r27SVv72QkSxSmLyWdtgJ22KHJh75
	 WdKlkZILckksaJUowsxWu0bID+PpkBL32Oyg086aZmptF9/dffmj2xQWQHSMPFtu8J
	 pE9Qsr3r8AlBTlo/YXAGdqMsm2DXn3GCksMUV5mX6Xl9jlk3Iv+XlvbwiQM7KI/wJg
	 BlK66sHF8LmJwZteVTSlotPsP9vWZEcUBp2K3m5cHklZ0oNtcaXfkEu/A2ZjHlqMeD
	 4L63igmGUBT5WyhUANDPKUAffdoDbzwvF1BkymvcHO4JRcXGnfjV+IeDkou18+gHZN
	 /trW20QXl4d/Q==
Message-ID: <sashiko-outbox-214194@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] configfs: fix use-after-free of default group in
 configfs_symlink()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Izaac Chong" <izaacchong934@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-configfs-symlink-uaf-v2-1-48c9cf068a91@gmail.com>
References: <20261114-configfs-symlink-uaf-v2-0-48c9cf068a91@gmail.com>
 <20261114-configfs-symlink-uaf-v2-1-48c9cf068a91@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 05:57:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> configfs_symlink() drops the parent directory's inode lock while it
> resolves the link target, and keeps a reference to parent_item across
> that window. When the parent is a default group, such as
> ports/<n>/subsystems/ in the NVMe target, parent_item is embedded in
> the containing object (struct nvmet_port). A reference on the embedded
> item does not keep the containing object alive, so a concurrent rmdir of
> the port can free it. allow_link() and the final config_item_put() then
> touch freed memory:
>=20
>   BUG: KASAN: slab-use-after-free in nvmet_port_subsys_allow_link+0x41/0x=
2e0
>   Call Trace:
>    nvmet_port_subsys_allow_link+0x41/0x2e0 drivers/nvme/target/configfs.c=
:1059
>    configfs_symlink+0x59a/0x1030 fs/configfs/symlink.c:196
>    vfs_symlink+0x18b/0x330 fs/namei.c:5794
>=20
> detach_groups() marks a default group's directory S_DEAD while holding
> that directory's inode lock, before the containing object can be freed.
> So drop the parent_item reference before unlocking dir, and after
> re-taking the lock return -ENOENT if dir is dead. Otherwise look
> parent_item up again, which is safe while dir is locked and alive.
>=20
> Fixes: 351e5d869e5a ("configfs: fix a deadlock in configfs_symlink()")
> Reported-by: syzbot+b0996ac2197dd7420c3e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Db0996ac2197dd7420c3e
> Cc: linux-nvme@lists.infradead.org
> Signed-off-by: Izaac Chong <izaacchong934@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-configfs-s=
ymlink-uaf-v2-0-48c9cf068a91@gmail.com?part=3D1

