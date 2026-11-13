Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564841;
	b=r7lFxTKSXvkwvQfE7hFauyxvckern29gG0xmGhdx40opMkb8IWl+9hJ3QGDckRv1MDwh
	 UCc7l/4f/sT8+xkYUUEpb2eHsR6hyHENxO2nA068lLsNOl0xwmzMpYkHauLn0JTA7fkka
	 563h+2kgvORR48R6a69a80dwNk0YzahAFEIxpN1wZ/7vF4/iPuChGAuw+mJ9txResjzcs
	 oVLf65B8S2junqDd+0CsavRTHor7MzBK63PBRnbR9kW0H5xvurOHLAClrRjNr3bxMpww2
	 8hxV7zZanyy823Ab8s/vZBd1DaEzAIM3EV8MsMX0puRm6cjSvZYBo5m5uKJtoLdQUCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
	b=gi76ANVMH14Xma8twvP090hhRq8bTjJ5W8/eCseg7bi1TNrVgyZbZUogMHMBIIHz0vqK
	 M/u77ucDL8QUKDBqP3uEpOfYaitwniCoHqhTrxcFQGrwjfaQ3kTwRNcfIpXXweP7jCwwg
	 kM2c0Y+7pNvLi2GrCCIS/cRnEnEhunt/9YdyRYPOa9VK+OIschVMqrPTLBQds4vT+ekw6
	 5yzamkN0lehR86Itr4htktWLGwcGALB5PBhr21Cphfx1GO0MLhB3vBmqjvRVuZfzOgGND
	 pE5Yag7ZaT5Y429Hx8T1r+DBBWVIIJN1/rGCQ+KZOZkOQfqmYJzeHlMOs42J0XdJCmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fgkfOyvU;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B419606A8AC
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B419606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fgkfOyvU
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492690dd5daso1015562f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564839; x=1795169639; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=fgkfOyvUu8xf6W8q9zChbNscxyQBBGlOoHgKBKJ1BkQkWvPVGihrF+rRK/++Rh9GyG
         JHspcfYOBNPixo8oPKNP4HMqn4Pm5ECxNu6WadiPSEV1Ef7s5pMOTmdpp1h0qheNYCAL
         reGCPjjBuRkeLgJtvMnJj51efD/XBAnW7OBUZupe3DEOpiY9mIzToOLvbGpl9PZAiITD
         ja/hKOWfLJ2HwVqW5WbU5vpLe4u/8sEd47rKsdelsOgJDSYM8eMKS9Bg+p1Lcupp+2o7
         A8nYundFQzH4qm98PvOkGZvKdsA4h3jxn0f8A/jmsMNUP8nMz4irJ6DT1xabl6IkGIEw
         iw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564839; x=1795169639;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=UrA+4GtK7esE041a0IHf3a4Holf/4jcmhZvKRcG9PgOrDYnggHCL1t7r6KiJv+2wcQ
         lBM+LN3CXSSiZ0oPNhBB8lkjjOFbUFn9o90tt/1M23t5+iT8CrIbuCVVeL/YVDkkavja
         bHrRJ/lKxHxTK5zuhJ0lNI4D0RFKzgKIzzM6Ujcg9bwMIq+t+aLi2QYK1iGG5X/5A6uN
         ChlobE5MINQhyb3Lr4C+hFjItDShDYAydcQwb0Fui5K6m2WkJySsTM6n42aPzi/XYa8M
         XfjpaiEjSX2X0keWW33ndNQpqmBrDFlyG/mE/7JvYdwj2PiPLmBInaObmO5aS2jcDalf
         InYg==
X-Forwarded-Encrypted: i=1; AL+hErG8Mvqsc3HnzFAAk728Ud8XYBPCBwUhueRsuSQ1IpMeKIDAqutLp8KGhfhKmV8Wd7NzOIz12oTmANI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uK2hclHJJSxuElwI6woVOdWr7Sw64o7Pcx5EDr3I3rhr3mdvR
	IiI8wiEjmj4sOjvbNt+nMdpsuqpYPR7uH/3v44FOD+cQvaijJJxK+lPaBjjms7BvR9Q5
X-Gm-Gg: AYBFou211/YvzgZ8Rbjv7CBr6UMNehElHPzOS1G19JNHhWcUFA8HiAj+3L5YwbQ89xj
	YbyI1qGhrgswg/7ninuQYEFHeF0QrbFcSWUZLn+EVXx47/6WLiZxRijZRYeFPpM+0FNdi6sAcIX
	Znc15SziotKILijw6kIHbmT6GqzR/PJTqsPGHQLqcMC+cy9NnySG1c3KygjQqdy2cv0PVXdNqjO
	pip7k4EYbWrD4EmFIF75PFHv0CVIZfBYetOGs9eG69gFP/gDo+kV8kd3Be6877yxuZSIe5vtfA4
	5hE8qNBklB5HZ7Bvx80PilQVMahzCwYPzAZY79xddiZZKi/IrLMNNWQIOC61jttEkaMtgT+nito
	odLRwybWwSia5VY0rAQOasGxO6TwhN37Qnd9H16p8r9B0IUg729nmungWa9byZAqlNGvq9+1e6W
	ubWSVsNM3HSAY0aZy1C7eZEEY8+5R46leQdzVV9f0lcHmD5zQSMaKOU4fRJW/x8j1M99dNFKRHd
	PHAPs0p58VCszozBz6Rs4/R4MgAPSxXHud8qsZd4hLudszVaU3jGd0WWwLPwxGeOeTK77lQuSEF
	RqBj25/BpHpUbl0xnikyv/4JpRNWB1SJxfRpWepan0GJ2MptH5Wrquj2BQUe4YU=
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr4358101f8f.12.1794564838578;
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm190118f8f.55.2026.11.13.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Message-ID: <77855be3fb9f0e1888c6dddc56d73a1683c820f0.camel@amutable.com>
Subject: Re: [PATCH RFC 25/41] pstore: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
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
> Initialize pstore as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. pstore never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/pstore/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
> index cf499ba72702..4658561cf90b 100644
> --- a/fs/pstore/inode.c
> +++ b/fs/pstore/inode.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/ramfs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/pstore.h>
> @@ -491,6 +492,7 @@ static int pstore_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->kmsg_bytes =3D kmsg_bytes;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &pstore_context_ops;
> =C2=A0
> =C2=A0	return 0;
