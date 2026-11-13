Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564785;
	b=XsNaoB9fg5+n8FWIN3iY7kmcogOA/mTIjmfybZK/9YeiDvAUvpju0ntzp7V0r/6VDClK
	 miHXcXUBK12+/62HRH4ez7x+7l3Vb2ACWhOJOmDg+y7QcejeusUdgJkgNSGAwkXOjx7rW
	 elkXfjJsuGVDKDYNr8jgQ/YIS/nl+L+INx7AMmEsSy90T8GaFSj984YNrAUoQMC2qsfun
	 JCSlOexycvof3cr8/8rzpUHYURXGHFssMfgx05rSyKCTXlZcUA95g20G6TKHxxkLc4uC8
	 a1efyEVICqP8nOdwzga9f3GDL7zs1FgmD4R4xp10Xt3ro2DhtoMtFCWGlLFfJ12hD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
	b=ddnz7IQXYLI/h4gw4OYB72qQfSA/A/CYl0Yu6sTKKnEHw7BkhsipRY/qo0hbNp9USJ2R
	 u7MZI+wDBIz1D7k/jVAZ9C2O+kkgjJeCt7u9jWAdkGkrJnnTOUFSlzurJGB5lKiBB/PT3
	 jbv7qszKi29BSocQ7XNZka7RvKtm43gBaptTTGdkXsxPj0UeMv7LmtrIxWP4BcaZ0pUFF
	 HRTOvcdWNK294LvoMuXRA8XObKUzIn/EsIDSMwivKIXu8NjFV2T26yO4xapihYWnYpqrj
	 /l+rM41dJxBrPCFA8Ne4Gd+na5K+sPHPAvlYQM/jWICQzFyIm/VblfRcempcP2HMK4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qhgXZLcH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986D8606A88D
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986D8606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qhgXZLcH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so10467085e9.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564783; x=1795169583; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=qhgXZLcHEG/xp1ftPxi4Y+VtkR5xPsdZusiH6E7v1UVOpu+pQQwW0vkLZszWZiEzcA
         +BIaLUI7scE4yUL73wk7QDgrWayWPrLwdz+Upaai9wvZdfIC4mpAyM7/MboFd4cm+sgl
         6S6dsMSsgGsAMWrOW2SdAqPT3x/sY2fNDxpywpmU57N6cPKU4MQNdvXTLk3fPNzTNPjQ
         TN2vMd0rw8z+5ZJqFwtlFaNorLJKFpgZtePYZzAG9uux/UTV4iwPxrV7Aluh/WlU8Te+
         mKwCC2bzY5T7ZateqcC/h9wnCcfLq6dmSfmWCE2kpyRSPYXephvqiHzXHW2gW5l+Jqy/
         ZrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564783; x=1795169583;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=mdCED5DDb/2IP90H7tift/LShtrx+8G+Vci4VmA2tuzVYhiyQQ/4xdvw9O5hSO/sc6
         LRcANpmjpMIUgvV23scVHcBYAMXnjeu68fApDt2OEdEOfV//yjuaTQOQRqyQUSkOVTe5
         VSg+GKmy58EUcaSvqcjniWfRaJXq4jDjU2HkM/neVBREVWA4cWafpa5z1u9PVFdv6197
         SRJ7eIBAuBazynhI9RtzUngXp/tGz/VJ9UjGJWxsROasxwEk8xKuiPYDZHWkRSK3V/Hk
         RoEJy/NKQbE+qm4e+x4Tg8U2+vgQSCg93/OnMY9/B6a/qLKfFKqkfisItcnPrydk25Cl
         WBQQ==
X-Forwarded-Encrypted: i=1; AL+hErFMZV8Cng7K7TUYI+Po37iu9R+sChA7usW54sAo64lb053kkbbmXxveA/yFc48S9Dhl+e7gw9rxD0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vO5Yf5QqerXbVDWSD1vIIy3nvTMcorxNGC0bZXBTwL05KdW9o
	wl/TV1Y0lufyn9pB2hcIw5PAsRpvq5THjVI0Xa4AVU8Tbnh/eil8yJDEi4CSHnu7dOZv
X-Gm-Gg: AYBFou1IyQGUmYGbOSwMMyocqaCCZekiWGUh7Fp2uzKcSiK7VS0uOiB6C5XI+MQDKDN
	wnNFv4d1o7LjxB5Yk0UhsxQ/VVCfhi4uaukLK9SsmbtXmRG5WU+BBLqGZqs9gy0w6CuNBGPJdWg
	DYwW4kEeozDYeQFUzspMvVxuLtD07Qe2kNy+17Q2CEsLAchevseudJ8Atz50qUuiLOYrv4s+oAB
	f22DX0MZCsoorX6nD4xS2GtL+CfIwrI3/JgsM4CTQYPvV/7tKXM8ZhCQWBxSi2gBweuCUHMmtkb
	g/0HTMPqDtQv25SMrvTVvEx8az/Vy/utmN3UZmGUcPMj0d+PMFdrp6y4DxrKwxO7NuA2+2RFjaU
	ucJ1Gq279Zf3mcPPSf09aSC8kvIJWSPOy08RPgLWVdsqXu2xBx+cIOZjzGtfdiinhMhgcYw95ha
	k7qm49PXG2Ax0V4doNMqJokbtdMRPT+hcyufR+Ttuwcef0N3fqB/P+pNeKw+g4iyoteA6YoTR6y
	Meu1OOsJH6xdvc1bo3GBRbWK83CVw2tk5Lx2vdXJg9ZDKuDgkZ7XxMHbEs6lIx3FB7ROYza7WcF
	NKQZpOSUAwD9L4qgC9XdybehJkoCtidreQtMFp8CAvrQed0gqgDggvNPh/791jBP
X-Received: by 2002:a05:600c:4f90:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb55a47602mr36814615e9.10.1794564782834;
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm4056955e9.12.2026.11.13.02.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Message-ID: <94dfa5ec75f4479663dd79f3ce05c1dc6c080185.camel@amutable.com>
Subject: Re: [PATCH RFC 22/41] sunrpc: use fc_init_pseudo() for rpc_pipefs
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
Date: Fri, 13 Nov 2026 11:13:00 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
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
> Initialize rpc_pipefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. rpc_pipefs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0net/sunrpc/rpc_pipe.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
> index 9d349cfbc483..37277a6d2415 100644
> --- a/net/sunrpc/rpc_pipe.c
> +++ b/net/sunrpc/rpc_pipe.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/kernel.h>
> @@ -1181,6 +1182,7 @@ static int rpc_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &rpc_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
