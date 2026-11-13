Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564173;
	b=EUb5j1G0ggd0Wwi9AXDd9hNzAC2DzV+wXEHKc5X3TjZXm1lElcnVseD9ekL4DAfd7A9J
	 EzM3LpA2TARh6qYBKl04LCVDSYdKin9xPrnyEURW8TG/J2mzrcBNoRG6xX/lzDXuaEpFV
	 jZG8R23sqcLXW5ZM3dDEZR5QXb5QJtiWPj1I01druzSbGfS3IaFaPMsa0PIhBs22BwdQ1
	 tR4/4GZbGU7nswzR5twL/EUrXOgxfQ8xrrDz01Q+YyYuF/lmu95pyO0O4ohhDchPvqM8c
	 R81+2GHylmTYZP1kZD/yUpoZgLYLo8LIMvdZx1s28bMpbn10D9Qq/jbY202Yc122kMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=QOKRfXbntKilXKCbQIPuMXmISRmnU6cXIBUGi5zYMoA=;
	b=yN6sxnRJJ/L7lnEDnKLjhnDL2ITOTzWxhkKVaD7ce8zIT/G3BZ7KjtRZToMSU8uIoKdZ
	 SwNiT5yqnewhPOjrQFr+pue5AwerHL6f74/G1xPlxTX7nIl3SiLsaM1TmffLi4WfYSl9V
	 3FhmLBo5hhc5rTNPchw0OLhWCFpYo8HLO6X+/QDg+O2xzsTQC4QDOGd3G1yCwnNIWfFEw
	 KhVlRy6LFxWKgZb9G4Lappj8r0WMw7UVMK6eZj8jqmgAgt73cb+Y5Ifzjj17lhzKkPiRv
	 Qptc3pVAY6izuxKy6/IxLxUOsLuekXniDsAU0AVKv1/PkYjM+QdIctzrm278W85vs+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BrRghWve;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC98B606A8B4
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC98B606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BrRghWve
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so1439710a12.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564171; x=1795168971; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QOKRfXbntKilXKCbQIPuMXmISRmnU6cXIBUGi5zYMoA=;
        b=BrRghWveZPMQ2lrGbo6B+XUgpff5EufUxldGFiTipoIaiFawRH8FVJvDBChKSCm+0U
         qE7NrwVrHQo2b1oiTPINBjADcjfu8j5+2hiB9wPnUB0Sj/3WgVbhatfBxMm3U8N4KnOM
         ecLP+89NGaRsX9nOgSryY2U8lUIJARrslqQpZFBfoMRf7b7aCNcM2ESlmVVEcyz67Zq1
         nmg/xl76oWVlPrwozco+e18C71yw30j2TPM9TFHhbc2tHwAu5TUUkKbNr7mrc8DWNqok
         L5mLyN847Ry543yO7VRmUF69tZ0RGoya4bqZfEDQ44XXZ70j+SgMCotFLrfSWds1gzqN
         VQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564171; x=1795168971;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOKRfXbntKilXKCbQIPuMXmISRmnU6cXIBUGi5zYMoA=;
        b=1C498stCZbTSRSXK+mDHpzPLkjv1Ox6IQGs//Sw7XBtYb0KN+X5d9BKf1APmx1TTnh
         VZF5/ImxFlxgdPakwRklgfArim4ZMW5uxQfQN/h2AnW1VO46/qdFxltQMQdcLMAH79tR
         Bj4fi/kC6O3dQw2fzc0EURVIOXOvCkRRgzMfgwUID+6qGK2AH7Hpo9z5hXQ7W3/NQhpo
         t+vLf2iHJn5EsOvyNgeDXYMr+9YbiNDSdCRwi8flPTtiBTZNmLGef7WcdDcbZDnuCQz2
         I7BZsCh/Vs+SxYVAES58wq6EQ/OYuPwxdZk+3Yp1iOHVGNcc3Ktaza5kXT8CqsiDkada
         1l/A==
X-Forwarded-Encrypted: i=1; AL+hErHCd43tOo3h1ONwdS4Ds3y+E71kwJvGJFY+VpKwatCEAaeZMsLnDIY1/fSbXejft62xOwzQa90ZhjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P3XnJLdGye/Hz97rPH7/2pOIWw6aVVtqD+cf/x2mI/ls0BryS
	Vvf8jGXD3jsJwvam3cH3fb1YebYwOsgVXHzhFp0jR7RVza9v2eSdDHeaC7Kbd/3dQSdz
X-Gm-Gg: AYBFou0oMwVpIIjlhfQyt3s2s04ydABjdEA9MXrMVwXezKYMEx0tM6bGtR9/MWYXMqL
	oKsmPGZpn6aX60m9LSjwe2Cbi6aHVkdYtohsECs3DkTblKwjBd+r2wNT7fxbg1Jnk0zhypa77Vk
	Q3ah9OSOKIZM38UMAdPb67YIBEuqBfqfnjL9IDstD6rUNb4ZBMiqQgxUB5zZVILufIcYZmIAeAM
	jEWMwVH0eqdhdHPQnNXltH89ivoaA9rKDaLuKBMJ/X+/axuwtHA2nSXJpcLO/KnpCpHLS9jl1FT
	uTHCgOThoWI94g4zaJp63+woTaL1pMMZXy4MFbcT6VxuF2XGGovkB5iTohvLGlWZqQMk0z9CBDn
	yh8W1oGbGzvgvugYc39awMLhOcgqxsWNZh/LQU3tUL5eQ17bHy1SL1RyjRWSH4CMCdeO7VXFcDU
	P1MmaYXFWLTMEUJOeGcdUoWhlcMIMo5vrFgRq72COWc6I7FcunM/j/5zzqBiLTRKSR+pKiCxoeN
	doClv72YqN3UYgjMBkzORqo14Kk7UKc7C70mS2Lg0pOsA9OWv5VzU0QvwSDymoVdq8VcDto+ujf
	5+16DTZzcDznTg3QPPWPKU67pIL6yekeWUUllPoorXeJrGPRpA7xT2YM7nFHaEI=
X-Received: by 2002:aa7:c842:0:b0:6b7:82cf:f69f with SMTP id 4fb4d7f45d1cf-6b7c0ceaefemr1298014a12.41.1794564171137;
        Fri, 13 Nov 2026 02:02:51 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c262338csm739270a12.33.2026.11.13.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:02:50 -0800 (PST)
Message-ID: <06b194053de4f4b65895248d1f2ba29d42a21b17.camel@amutable.com>
Subject: Re: [PATCH RFC 06/41] proc: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:02:49 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-6-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-6-4c998976c6c7@kernel.org>
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

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize procfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> =C2=A0fs/proc/root.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/proc/root.c b/fs/proc/root.c
> index 7fbbe92bf73a..ca0e75081934 100644
> --- a/fs/proc/root.c
> +++ b/fs/proc/root.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/bitops.h>
> =C2=A0#include <linux/user_namespace.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/pid_namespace.h>
> =C2=A0#include <linux/fs_parser.h>
> @@ -265,8 +266,6 @@ static int proc_fill_super(struct super_block *s,
> struct fs_context *fc)
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	/* User space would break if executables or devices appear
> on proc */
> -	s->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	s->s_flags |=3D SB_NODIRATIME | SB_NOSUID | SB_NOEXEC;
> =C2=A0	s->s_blocksize =3D 1024;
> =C2=A0	s->s_blocksize_bits =3D 10;
> @@ -350,6 +349,7 @@ static int proc_init_fs_context(struct fs_context
> *fc)
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(ctx->pid_ns->user_ns);
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &proc_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
