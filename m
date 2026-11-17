Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904090;
	b=Yb+b9OYQWcmsO7+N1IP0Xra1oxE0oamZKIetcx2kq1gyUhydWyTnMByv0NMDb13QvXcX
	 cy7izBadrZCUWRsOAlipT7uPHgEYoluk23ju8SNUkAjlqNt/LGdaqyaF/20osLOzfjtIK
	 G8zCL6gP1PrKxx9PQdU1y6nBooCy2Mruuw0TkbbssOKZZ002Hs0P9axjPW9WXO1LAmP0t
	 kEhhhZvDFqVrkdqI532es4g+0JZizuJqi2tj1jL6Z5rYQiL1RQliNQSzXOIYpBZ1eOVSA
	 T+rUu8ZBkZtsnNKJODXUEwXxBiW8iM+SRSkZgwZSca6Bo+sVqULwAQetuW/LjJLCc4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
	b=YCLYC2+sbnM2+pWjG4C57Jd+HL6gOMnuL37nJIInh5lX2Ay7LlJGhg8hlcHi6pj3wROM
	 q4jH/CLplQD+iC9OsYPa006wl93Ik5sMe42qBmOc2Nz7GagUDAzjwFBXi4yRHb5Bm48rE
	 pvTKJEyYTilhwWvacFWr59rT9SipS1WdkQccllC90yEUkU2AlMoU59ovxopv5r8zAlHrJ
	 1gruE9sbmz4T9uvyj7sj905xg0lGV8miFFc7YcEKvI2iq/RydOWTpV/Erl56/MUlCVIZb
	 h52voi7lb7fbFtXQqzsEk+cxrNXtYfyRs+sVQkqYRdtdPouQg6eWj1iwudKNoyV+PKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G5kPAzk6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13557606A89C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13557606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G5kPAzk6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso31738385e9.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904086; x=1795508886; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=G5kPAzk6YKyHaocuCdT5IFslrUJH5/ldhNVhV6xYWUthrOIppv7Y8kBtZdevqAkpzI
         BDRFsu2jrF+YCozPia7EV1j3KLeZC6Lnc8BgBdPYFaePytvbOESC0m4eRkryqhoEbPxE
         WM5n2Fa2IGRg+WkSIkgfyoTemIrDdEbfzZV+2Eacmamzzj+t+HuCPRqV+GPswkKxuMa/
         2fm9UdrHUV6v7jtlgmqycAcrxGUcSbURHcUFMMj9LS/XjgTFJtp8hDDDARovdS596Fjm
         xwkar34XXNuYsLWY+RNo1AZ45FE/L69efZRvwjPbSAF3CGRgr3AaMHZz6Kf/cz8pCVs/
         RhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904086; x=1795508886;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=NkPY5V2X/9O01ejMNLqH4UHtzN+lyQbhBbFPZv0nEzY+5J74kAIOhVUjYd1LtIE4JL
         iWtOZfaIzSDITBqFxm/9SND4lGg6H4edg1EqzUVrIhMwkO0DtfbAVmvvj6N3zBvSNdx+
         8x96cnX364bVNJ7EB+dYpG6rkJiEBu4tidEB8KcuHV7OfW0qdAzmOoQMQDrjHGFcppOc
         IA1zIET9xMjVTKZhElufNGkdbDJjYsQ/N067MjURXXAd0BN/uKWn+kDOQvTRx/jxebZP
         4U4trx8V5QVEV3A2y0752D/nmjsT6DmhnLiBPSloPcuPWckoiH1+musTCMWsWr63lokh
         fCkw==
X-Forwarded-Encrypted: i=1; AL+hErF7dtIYEp64OgrkjGavXRENON3IUhdsKrnQ6GSbqTKepHXP2iqcXtALAHWgr3drB0uB4Ed4BCwyfHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9D+vxTswSouf0Cl7vAwXvm0dLZn/G2Z5gWtPIwyudkmdAzh/vT
	yhp3y3FiN4RYUVah0oN783KF17Yli20t/AdShcmf8w2IlVid2cG+if/n35Uo09vxAFce
X-Gm-Gg: AYBFou1YZTylSYwOXKljap1fisxboFJ53zW2kq07796u8VdyEDjjCW9TmD4kyTEYyfr
	Eg1tu1G59lDh6bXCbygZm88DGbJj44FXhCuLrCu2J6iJ4nvTI3d5AXAifODym7Q0bMl67zpYhso
	qQb186KeSZ3Op6BHtuTcQkB9sCZSn6bxGkOOKE6g50Wr0thKJq0m8fb4+j8uoz13DO2kl8qjtZU
	X34FnkZRP/LZEm0WBUro0r8dU9AUv6hKdTGg58mhsK3QOxM6YuPSCzfqr1u/6IOfviuJMoKuMys
	5o3zMReOYeicFidJbGBGJezYn9zZ9q+7nUS1zuWhjEy6nxwyGooyPVeCLfb5kX1zTnS6YmYEUBR
	wmDBJ86V/Jbb28t1cIz2TvtD0Gzp7xEy6R/YAjt1EkoCj1lDJEctG/+kF0VR6D4k5JwwiqC3w1e
	z8lt/TiU6VKG1+GM2y+Qx8U2E033Gt036tNTmMIazcNtlOGCkSqaJ7RY1SuAkQ+3QTpv58FWpre
	LzrUmz6dXhNpoSKg1TPOkV6ZF/GLEraEL2SwVRtR7U2j8aQMXDB2eg3Yrr9Y8OzkLkzPiTtp3Kw
	Fv6sLADrJ8RmwPLyN1jqwPe/lVTiCn7ZscBdnFe5hlr0np6dulKy8tRNztRUrS3i44qk/cg5cVj
	wG5G2UY91Npm4yklfOua0Dl2BV3SaGbzYaBB/IfFnUTkkl2W/I8qapcYu
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr209766355e9.19.1794904086313;
        Tue, 17 Nov 2026 00:28:06 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm74782845e9.8.2026.11.17.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:05 -0800 (PST)
Message-ID: <fa0ce0f7ecdbe91cc6773bcbe86be137d2129944.camel@amutable.com>
Subject: Re: [PATCH RFC v3 21/44] nfsd: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org, Chuck Lever	 <cel@kernel.org>, Chris Down
 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:04 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
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
> Initialize the nfsd filesystem as a pseudo filesystem. This raises
> SB_I_PSEUDO and also SB_I_NOEXEC and SB_I_NODEV. It never holds
> executables or device nodes.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/nfsd/nfsctl.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index f32311f2d7cf9..ce2666deddbd9 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/ctype.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0
> =C2=A0#include <linux/sunrpc/cache.h>
> =C2=A0#include <linux/sunrpc/svcsock.h>
> @@ -1375,6 +1376,7 @@ static int nfsd_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &nfsd_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
