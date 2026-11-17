Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904032;
	b=VTgHAWAEODVO5hswLlPCA7Q2pOkX0G6443M19ZcBxYh6fppDW9JaXbUPLg0c6Vi+zMrL
	 OO8NA3FXPJBGgsAdQFxzGsvGc1YaGhkgadisRkfIu76OrLVy1L5FP21Ljxa5FWPCzik83
	 B/5vRv8K5+yIX4fZjKWXm4mgz4mcTgTnmhcBfmPnW+BoZXnsr09BHhAoARpNS55j8LkEZ
	 pg31gx4+SOvvIv7B2LGUwDJfiXzECrqsJqtqDTDOmt3a+PEqz/HttmxRTsCIothUqDJkT
	 j7tELhogy/X1PRa8IBrzj8W31SexUNWQTmapLE5XUV/9Q6Az60uVfLhs0EKgHMiRxoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
	b=TSYOlqcdh2wvT9AHIqoJJqDWAMyIIkxwqskPormOsEqxfmzusIBtXaK+nyKJiRTL/QRL
	 nQRyx5RF1wM474yU9cm+kKDLPWBwYoz0ANqDy4Pzx+MW3iWF2d2dp9xlLPuqZhBkuZxrF
	 GGc+48QGOPykIyRlYb7ipcm1lCBXW+5v0j10LoZ8ddrLMMdh/cZLNKDI/L3ShIRrx9XEI
	 VefyRcn5YgloTWsN4Tti28YpIebOJ7FlqE43mg3Jrs+a5LKa7dAjyrorh+BEJEZItrEXj
	 dOVV+BcNZBTDIGAI+XEkgxBNfuMmxJZEp88LVu7e0x/nKTL4Ip0NoDbgQ0Cp/bMIRVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m3Y+iV2p;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA6606A32A
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6FA6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=m3Y+iV2p
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so21934095e9.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904030; x=1795508830; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=m3Y+iV2pelmutPYORVxza4CHQMpjq7iS5lmecWgDjvax6Coso4uWa+KMaCm+CB3bWY
         yM9xDjlaUDqClL2wfFs+3EgMKFX4Q8fuLgup7VSVEO3iDYFOyh4nyeN0Shri07+KD82b
         UFGbuWvBELdRnXkiKa1GIWjPRb4Wz8WRQUErt4eMboeCaxWHABbQwTZk6BuPw2NopAXW
         5935wwOL0Ggt8LD7VeJmtmL6iC6DgtiD4S4DRbEtkaj1swNFS1XEbe90cWaNyokAE8Lz
         Ulc1c4G0eNVUIpLzTdbViN3HgCOMoyHpu6hnCIZ+utcpbQY02w1kBKtCyN8iaUfGq6tI
         6sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904030; x=1795508830;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7Ds5Sp5DChQJ6GHa3pEkVZuOErJkij7LbLCUPT9+Pc=;
        b=Fi94prtILHmgWsEPv1E+bsXKxrbSsyCCT7IKxLBY5SeyqfxfKFYjpkC7OCwrvpZHTr
         9+q4Lx6Hj2cxxvFkVITkLS1sMOr3sPM0Ihjwj3iVjd7RVZsgE9S+oSrY0UUuBNMSbP7J
         7MWr2GpbJp7p8d+DHLIIkHajTJ9Kmvq4tVDWMeQci3FEszLtjsTK9klusZHIP6IzOHo7
         fgj6tCww1YwCe2OH8KIgxuxjT1wDvKiGrQ2ON2Xo0De9T2QRYK9pv/bXLahH7zX/IjZ7
         M8SjUW2m0VdFLZI9cSG+almqt5H2A5K7zcH4E1osI2YMTYMAopuhAzPALKG30RpKkOCS
         CfAA==
X-Forwarded-Encrypted: i=1; AL+hErHi3rwTiDMz24KDKRt/VwK7nXT8kXSQ4n53yOB5N3m8h9P92twK6+djB1dME7GgHAexcdiXtYaztu0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eaz9vw2qdMOavtjINyhqM472bLFK44UCo4lgjdWubxj4/jZvH
	0zYd+UNWBpkQarzxipzpXJ//KHuXNwnvbhDGuqcq6e1VJ6wrkxCS7/hn1wW3i3O3pRAF
X-Gm-Gg: AYBFou3u3i+rJ9wFFZpZ7tUTEBpbRygB60bTN2VfJKjcBxyGW1RNUnr6/EagxY6BwOz
	vLLeKjH+obAuXiHUyCM/BAvdTjKsT+UBgccCw/DG5M7VzpJPYUQAffSVhipLRsgkWjXxk0g9VNg
	DX7JeX9cyvLAYFtzz94o/QaNWbE6woVTaGKuzW32Yhv5uYE9ggGtTiTd+lH/2vaAwTKluGIPwHL
	BMtzWBXvU4wbikI7OXF+Ep/R24JltqfHSD4CqWrK+o9zHKQWdD0oqWlGjdFNv5Ec5PDgjKM+LSt
	NgPyjuwaq5JPaIjPoB38XxGVyVkt3ButWh2ttsrIj1lHyGHoeAg2TcSL+r9WO07dO4o2TEL5r6o
	GGlNh6EwvakmltOGI9fCArSYFp61+7kl2ogdvPYOVMWiQiB8441wigKdeDO48BMTSFtIMCnymuv
	Xc+Sv4XBffTEEiVCRwL3VPs4lEnfNMGr+rKhrvjxAuOvHukoUTgok6uAljb4s2lP8LDBqpw4Rd0
	h0ihjIGuqG/JPDUGLW0ikPTD0/XHzuYuu6DOQz1APtSodIdUmkgRAi50JID2JZw4OG8aN3n6ShX
	EjntYBQJBdOwB9uGfXMy2QcHHkO+xMWhXQSpR1fFqoY4OnEOtv1fEHvupXj/DZkIjexm5M2zfFC
	70AdLGRu9GTeXs7+1XsjZyfsH+uPojC4wKKCMttRb8cpOK3jDtuvdOBnN
X-Received: by 2002:a05:600c:3494:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb6c71c232mr134135095e9.6.1794904030378;
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7838c912sm45730155e9.4.2026.11.17.00.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:27:10 -0800 (PST)
Message-ID: <0ec7b8c90cc456b24e5b19c1db673d497ae43735.camel@amutable.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:27:08 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
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
> Initialize binderfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/android/binder/rust_binderfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/android/binder/rust_binderfs.c
> b/drivers/android/binder/rust_binderfs.c
> index 5f020226720db..04468c5b5c116 100644
> --- a/drivers/android/binder/rust_binderfs.c
> +++ b/drivers/android/binder/rust_binderfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/compiler_types.h>
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/gfp.h>
> =C2=A0#include <linux/idr.h>
> @@ -667,7 +668,6 @@ static int binderfs_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	 * necessary and safe.
> =C2=A0	 */
> =C2=A0	sb->s_iflags &=3D ~SB_I_NODEV;
> -	sb->s_iflags |=3D SB_I_NOEXEC;
> =C2=A0	sb->s_magic =3D RUST_BINDERFS_SUPER_MAGIC;
> =C2=A0	sb->s_op =3D &binderfs_super_ops;
> =C2=A0	sb->s_time_gran =3D 1;
> @@ -759,6 +759,7 @@ static int binderfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->stats_mode =3D binderfs_stats_mode_unset;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &binderfs_fs_context_ops;
> =C2=A0
> =C2=A0	return 0;
