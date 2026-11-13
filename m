Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564237;
	b=pxuE8fhiXlhNba2MTSHibHFQp4PHyvYXHAfaO76DnGngnEmJqIvxyCUOfNbQ4oYir/6P
	 vC+PZ7h9ktoaM7mMdx2b6E6mHv9HTV0cyHrW4U8cOq/r9JKUodWqf5T1zdfdolut0qnz/
	 ACEBplDFWhohvc5zn44m+oqSir659A5tHWS7meuoeJrrPkUPE7WHT1UFHg5wOVh3pUiT8
	 f91ngPUSyxfdFkDfnjyQLI+Uqv0YCiapSYXqLEJFJqBdbAwOPUfk8SPTq1LXIHr0bEXFR
	 Q4BRXcs8wINtIz9u4OcDfgCFq+L3EeQuk/u9D6QE5Ev7HBJoXg5gkwj2cet2bCnb1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
	b=SjO2qRvD6mXhuhwnnQN86RdJxaZYH4NtNSrZuiOzre6JcTL44N+kpyYzuHKbWF2xpCuq
	 F26IDoDGIRiE0Rk95O7gjfn7enO7q3yJIZ279p9w2bv9HRDzdDT4zgGSdET4GeO1K5HYJ
	 G/uB0LE0MdizK7jMYra51Afjwhi4ejArz7Nkhf15Ys96Ov8tPnWZiqGVcJVgr/qt6K+IJ
	 6XYHYdqTpaEnnePbSWVe87tTa47/6vYO+pUzNdNC192KuY/hwt9gFEEEjTSa/HqDRobId
	 3gGukPJMgY3g5HTljSszTCx9WX/GN7duK/WFZKT7y1hB7OfqJoRaAqPwHTk94Iluzcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HmOhZp1a;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2BA606A32E
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E2BA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HmOhZp1a
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b704171bc9so1238358a12.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564235; x=1795169035; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=HmOhZp1aysVRSGcApaAZDLI81xyeSldeu7ePLUPKkH54FsFfnK+QDVFY4+VQQZDD5I
         H2HloBZm5LZmO+0yz1W9rfEhaL+YICMUwpLNmuFaGXNfAv5LYB2fsAN36refSeHGX9fO
         cryYVQ+kM2KCw8u+OcP3112ltvgpCHGvfl9d9GfdLtqmNcwNDmKz3KTPAT46qO03zj8M
         uuWZNkUaGTWe7Ooua9eiEAKQiiHx3qf0rn/l3lNWMOa2sfege5hzg+R5XNTSj8AN0bpY
         dCBAZCrR4vjcQdomnF2hzC3FA98LaruL1WYTiCQ1DC9kzlEXZqoLyeQdM7U6VrMRD1VV
         Lr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564235; x=1795169035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=sc31IqP0jTrYNQIxuyu4UVJZHDfn59g6FzSy0g01tY2mddXyUgE2Sk1IFw4iDykdBo
         6CQstg1w9/ccyWsyoyqchHlUTRCPiH9DEqgubiXHlV+FF6xHX/zBlmDU2jSnDRqrDmPL
         l7Udrew9DWEq3VUoyT5P1V/C4mYOE9d5Qj7sHIV9I9HKgs/1C6++ii9Qv6CE8e3oNS9d
         5SW/SKLhNGCjs3LA4ZnDopFyo1TlgeDTrSr43FxPPKFqpRcq6JShlt+icB80cTWrbDJY
         hQqsJrFr/L0AUPG8z9UrKbWKi5aAXTuVelDj2DYhLjWELNbZzyE8tKE0r9sD6RdVf+Uq
         UnRA==
X-Forwarded-Encrypted: i=1; AL+hErH+gEQh6zjuF2pxgrt3QKkkm65/J2iCggmChKEk/AsyXlxuQcGj8JudDRJuXTteubofcTMoFkn2y3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z86gEVj3a4HsRKDXizA/7wAQnQGaewRahDYSA2jzJdg66/I5Wox
	uehUrBGuqaDpQCWaYdN1QiC0OXVb8lJLewY96jajVlBmOx9xeByaDD1j0e5Us2IXB+Al
X-Gm-Gg: AYBFou05vAFAmPnULmuygvGPHH/NDICAbKGjudSSDzV0yh0+rG3ERlKbp6bmSXDUXFw
	D1Trnp7Ioftvc2UUAzrpGbQmjDnfqgLsORYokDQkJtXoSFuwhgeo1SGZ/vRbkiAOem4WyyTW1Ci
	YfKZaDbfVZInwyaki5YQ2YO85n8Fmj3Id5/y5qvFgebrptMn/xqNPl8IpvPadq0US3pKwyGb0sw
	ejDDFlkAZP+GkfYMkQCYMWokOM9gnLoQ9LH0c5q3FNCekuKO6h2r+xQxWE3yoO9yP268gkd74p7
	T9qBZGMvTgk7bVWWplIhhZ5t/b4H+6/i+y+zhPdquKH6aFKRoJH0Zvdn+lFMLdG6A8suEmYMKsu
	V3QfJZnGX+mFoEtBIMxLprBkb1EPDw5O9QEkjZr0vX5rogKv3UjNJw3b2EHedSuLRoDmRZQPTWb
	0Lfi/fAhWhVh2lgsTVLpnzEFL2ckXGCXAftCGZUk43bT1x8BrHkcig3tLZr4S7bmvDycZivYIUG
	Deq9rrvr7RX+2pRVaVOf1knWqlLa55rItwusevdisTNn+BY0FoMRyMGPfMx2Qt7IrmTLvOOcD14
	etgsBipCZRz3TFxCCI+QjKF5HYpPx3x6wMLuQ8yjcG6dsPigyQTylTcOMZ7wRVw=
X-Received: by 2002:aa7:d556:0:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6b7c0ccaafdmr1234919a12.34.1794564235160;
        Fri, 13 Nov 2026 02:03:55 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm766458a12.9.2026.11.13.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:54 -0800 (PST)
Message-ID: <16dbddeb5cbb9613dc806b43fc681eb26aa3b0dd.camel@amutable.com>
Subject: Re: [PATCH RFC 10/41] nullfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
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
> Initialize nullfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/nullfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/nullfs.c b/fs/nullfs.c
> index 319c2f5c5a67..2fe24cb97160 100644
> --- a/fs/nullfs.c
> +++ b/fs/nullfs.c
> @@ -2,6 +2,7 @@
> =C2=A0/* Copyright (c) 2026 Christian Brauner <brauner@kernel.org> */
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/splice.h>
> =C2=A0#include <linux/uio.h>
> @@ -174,7 +175,7 @@ static int nullfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	fc->ops		=3D &nullfs_fs_context_ops;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
