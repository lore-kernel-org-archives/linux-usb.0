Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904120;
	b=YBDOe74B48Tng3/Q0gH64y4xks2uQsMwN9czXS5cIKTXrmaLsuS0ELlER2YAuSR7Gc2P
	 272DG2TRg/1sFHQr32Ct5nWEprtVRM2A4Xozb6bb9zD+qYDDxbIhtmQgTNAjNEBMp+Cuy
	 osWd2Lct6ly0qPRUphED3bOdil+e/yl3CQMdglh41kG8furWuD9blSR4MSx8DcYhaY9qy
	 wV/Qr7BN1zToRRcaurTmdeTZYFT1q4besFmJC8V3ahWCFMbol/A0NCMFi1qCCMOs0r41u
	 Q354yOle9LU9khBnbm0ILTroNFK9Z6ulq7FR1gc8WMA+Cur326Gj7qLpvaCW7ya5emQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
	b=HShERNlmwQERIu0gYfFxa1MIE/AC9eUQAB43umaV5U9dtSoWukkUc3RnQ0QKmiXWr6hI
	 /idtb/ozSIkLDUU2DBjnjVDyGK9cqoeVfVP8auLR4ihclAeI7qmUq3NR+oEgMR0KWG+4W
	 ZUPvWVgamYyEvPxAicPmx2FfE8I4e5CFrq8C6TcEdO6keFlQsUFAB4/jxiyhrwkxnletj
	 RDjJNa08sxgl1MF6dcoEqHwfwqSO1CL1K5K9bfrOE45Rim8uqQNcV5jomIjsI1mtlMaRE
	 mSTXqJvS9BWKQKROsWugDVwZj7KMbk25FakXRNbFcbqI2sXFBB9LqJe5gXXQKHfyzxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="lDHE/E60";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3119606A8B8
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3119606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lDHE/E60
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso36239995e9.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904108; x=1795508908; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=lDHE/E60fAF7y/GcfWe7zssqpibfABjaDWc4DbPAbANFwY7mipSCQzk/tGna/Yk9Yp
         5M31Ja6Q4S90Eg4jWdoE2GH6TurYV9Y9Yxd6SoBGFySZlSGgcD3Nf8Ac20Morq/IEeLi
         HZNDCkpilOoqmPVEk/N5paMQG+RjNO9OhPzIDtVn6k+5pNMY8rSlnV+zGCrptyxwBw8i
         uHdMwH/Pby0zhrQLCKl2b6izfUmExSZrUoQCnWP4NFP78u9vhGGyVwUcvE3no1VAV9ln
         DDlxdlg3j7mlBLcF1wQFzdXfstbmRKgVspXMjOajtHMeg5NsSNAba7k+RMZ1HFntU+s+
         8A0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904108; x=1795508908;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=sG0yB6/jDUAqDK0YD5h9J4UW/OgRYTjHpRKLlNlXvt//v/3bSEnbNbgJAQowfEsdmN
         GxtNWLv6juWRRBJM0jE8hbP8GQP/xeHehOaXx2KnoY2n2LP7nrS1yxbQfgqeHWpSSAcp
         ndCqTmOItdhSqEX8kIp+Y+7S/Kyo1Nf/YIkxTg0u1/xWKn6mukIT0Mf0wgp0YOO6NzMA
         b+PYNG7HYufMnJ0InjzgivRQ+vnqgSKA5RvCWt+vvDDPIW5w7wb6yHXGmwokvbq54yCY
         QrES+r0uKpSx9Lz3WrNRmBtwWo9zqwZQYC70g0lMUJ5Giyvt/xmUWawP+ZUK+YVfJZcT
         I2Jw==
X-Forwarded-Encrypted: i=1; AL+hErGMG/qEvJoWFDnhWNEyRcIpkRsDKJq9F60ikRVb/YYrGiwwd0pONflxNpTO5m9U2BRGATDvQRZDKj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U2/D/5sCOhb7jWiLLPxwISUZjiQsgrEKXOoiZLSaOvBJqg8DJ
	Tr+6/jKvVfQZT9TLylpm/AGI0E7dTSuwQcUamGIijkvicjA2yvEnMFk953czaRa66V2m
X-Gm-Gg: AYBFou3M79AP90+KxJuKYUJyOI7aS54fQ84bkO4ZD+epzINyhZNCo6S4bQEN+vZ7HiN
	Ik+VSGOSg7O2kct6KhyrkHx69/iK38l6pWpYxkbFrQi3RPO3goDtMLEP3niarbLqSXrvdiG4GkD
	12l6w7Zh8qgZD5L7cZOW5/JSKGSmSGd7y3RaSwqHqdss2QsozeRX/DiS7TnBX+E/JfUVi4Yg8z3
	TjGXa/TYMsdQlCT+1bpPE/mxTBUb+G2ZP7/az0a8dLuTAO6KEBs2AgeVRNRU1iWmUd4gvSUAUbl
	puuNZT2cVLJVkE+9Y1cYjrN+ya5CKnmyz6IOAkRl29cAbWmrus2uVPfv0ZtEimKvZTKCIh+L0Oi
	r8dP42EF1fN3hVCBlUsDyOAnPRYGkitPhM6rXUR/qS5ZxH4ABO/npnjUdzaTUINrx378vmbmjsS
	nyw/C7WFz3JfEJtUmxp90tHVSwpI/136s5mxfQwl8bPWjzGO1ChseC8xrtkyyLShyybWUraXdlG
	vS1JiHpnXjdm+PC0Iw1tPN4khPGAk+ApLyLYJoCDBZe36XZa25l0mWfpRrG5c1KiFX/fwbQ8gsa
	Zr8nQtuYxudlQ2MjHd6FXtwqZlSImW+dWw8rUQP7jePR2x9Z2ahbrZAczNHt017fJf4maAHoIpC
	gUOc7tB7UyKPOnp/exnqXxTfMTzSjsF7cjAvLMQ6i0oZiKpIy0qckdo6a
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr255399085e9.5.1794904108278;
        Tue, 17 Nov 2026 00:28:28 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm75197335e9.10.2026.11.17.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:27 -0800 (PST)
Message-ID: <afc070a816e3ae5eb3c9e2d62d4f25c59ee61df2.camel@amutable.com>
Subject: Re: [PATCH RFC v3 26/44] xenfs: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:26 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize xenfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. xenfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. xenfs maps the xenstore
> page and guest memory through privcmd, both data.
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/xen/xenfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
> index 37ea7c5c03469..aba7d038ed735 100644
> --- a/drivers/xen/xenfs/super.c
> +++ b/drivers/xen/xenfs/super.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0
> =C2=A0#include <xen/xen.h>
> @@ -80,6 +81,7 @@ static const struct fs_context_operations
> xenfs_context_ops =3D {
> =C2=A0
> =C2=A0static int xenfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &xenfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
