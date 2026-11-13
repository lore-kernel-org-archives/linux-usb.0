Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564378;
	b=u6pVx/CfEG5jqWz7qeAwNjs3BgwY1zHIHW6RBfBSHmuSPXS3Bhkl7jjkKgWu1kDsnqk6
	 EYPLD4hrWEyovRmSc++fG6iHInfKV5qWT+znBE8iYwf7kl4VVWxUGZT4VBvnjJjZll6bZ
	 M/eeeXAJRemtqBcHt3WTex0l1C0v1kYH3MBKT2vMHbBWV5LutQlemi6vvqOIe1IyfDcdP
	 EQatPh87YNpN+b71RsWFAtdiWFj559Yp67pZfR6lu9lFuft+c4F9IvpMeNRza5Enin+Gx
	 WCmMXQak0Y/hmH2hUuiigiaIZndPbBjAHQBftHEHyI1kt3blUD3SvzI41gQREbIHYEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
	b=usWzDWHWcyOeWyrCun1ADo4WavIT8S3ogFixxE5kL/OmPiF/J7DfZRZAbrrI1hTH4lNX
	 yLv9CqLE0n+OzcMZuJ3oiCddXYb5WTyA8B4GfeOVnpT6Z5Lh5ltGAvCeuvuF1l//F0ti6
	 mDzK/SJKshO404nQXm04WJwMVEU+jO6U4jMKfqsxJPQ1DGgwEv9oo0B5TZxUsbuU6tSDd
	 WE/xRG1rsX1DV7q42N1DW5Eo3R9A160HuZcmTa4PiJqLK2kwZedaYxIJKGk1Q1NlQP2S7
	 d8xU/0OLtiqHnQ7xkEJJwOoH3gCgJjVHCRcAxVKTHnwAVSlVrVgTTiyHWByUzDdUXGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WDdVkHgl;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E9606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A87E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WDdVkHgl
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso1499724a12.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564376; x=1795169176; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=WDdVkHgloKbBDmiudlEZ3ZWe+zg0BVZ0Jxwgdy+X6nc8ZJ9FIVi7F/SYJVqBRxNf3G
         3Gnq29xgDZdSKYiYaDVmU8W0xCuGm4Eu82rb/A8U6D5iLEOgHTmlDog4vSfdCU82B9rm
         qMGycG7Kl4j8h61zt+kqUkohzwqy0DPARMdjq2hKw51hdb6jylA1cwqwSD8nreSBsEB9
         DkDXk5ueYK99P4pH+jY8EwMoZnNW6BehoecLG+1JSq6wWJXsZMYgAdKGybKKFJkxuO0p
         O8Ri4u2My3QdIqEe8fwKAquZP0382+IuLTCd4KpBNa7znuGAHwPb5rxafjOggGTtG7Td
         r9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564376; x=1795169176;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=cwOvErI6vW+nv/j+4fX6yjXeIdnb5yU6pYs/6GXjkKAC3vpfQJoK/Kb7/SZXqN3JTv
         XXyG9qR1DnMf/Bwr15SDej3Xcu/GePu/O3ogMgf0nAeqQ5M6780qvqQitbGXQBjOqRlS
         p/BINPJyQZLjMnfmWskI7JVLMxOOFKcystEk1WdEvr+0agG4L2e4wjG8YWuFgR0OpxQK
         UMPx/ue2dKXvTLrWoypVpE31X+ZlZ6PRuzyuzbIF30nNTD5N5SU9kJH8xfmVWRm8s7uS
         ijfIwr6kHns60pCHXxFDokPB/ekZIYp4t30j68BHwZM3lmzpC3Foku6/AFmpcz1Q7k5a
         iLpw==
X-Forwarded-Encrypted: i=1; AL+hErE3vMXa2tJSrVBxg6PWJ9CKJkXO8MWI9EFP50B8GZsUZ8cqOtJ7R7/y6Wc32XoYzdTUyW4MhfToKuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rmEf75x6fUBTzlPrDczDhuQ7cYAYbjFMAkhifVSDxawhi/uYT
	c5PVb3ho+5u5K63TrqCCdaXYC6Uuf/X+AJeQDkzSg4vb3dOfc5aQ4yLSdOgXOhI6jeUN
X-Gm-Gg: AYBFou2+kbJI0vaszDAsXxpoM8AT/EN6hF5H223kWU8eK71jFhE0soHKGtIjOErBLct
	X9tfG5oQefjA7n1m2Pw7HitBHL9/Q0YA4dvVVSSe4eFACrHcvGtFl/ZeziwlMetUVpVOqM4lqC6
	0pG2VtEC/KlnCrDrrumEvGmHPgXGtUYV6rBGHAXBOLir3d+ZO0/gWuNTi95XsB33lWaQa/iQ4lf
	yJeAGC39ZmbTZYik9jU44AkG0twQdmLbAF4gygadlM4h5Gyx931uj61ckVsu+vUjTwp0fRhC3JM
	kByzpxTuxoM8T4KQZy5fEO5uDzc032rB9NeeGIwFIZXEAFZ8UVZFBpIrg4NmYtgzfCN8qmP6/bg
	GKLn5KXO6Zvq338IbGs5HMlgKOy0hQ34SkLt6Qp96iGnSu9hqnxrGJD2RFGGu6w/77QDMCDQiFB
	Cy4EtNByKtlMdHqA+8hkA96+VzZi5URIsAoZ41BgSc6nyY3w6JMrC1fr23CBPAzDl6wJTiJRuWj
	hnAHi6TUwTyNZnqUIFxZgjdM5owKikil1HXlBbC5ZeTurGGhg4KU/pNqIv7uc4wHFDz86eGfQ0Z
	NW3ErpAE+xxskhKXRskJPT9jpSm0KgwqvP/mua4wYn6oQMjLjND6dGo6qcKjBuM=
X-Received: by 2002:a05:6402:280d:b0:6b6:4dcd:967e with SMTP id 4fb4d7f45d1cf-6b7c0bbc394mr1685420a12.20.1794564376161;
        Fri, 13 Nov 2026 02:06:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm706711a12.4.2026.11.13.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:15 -0800 (PST)
Message-ID: <4dfa19dd41ec1a202182284d9617926a259288a7.camel@amutable.com>
Subject: Re: [PATCH RFC 16/41] configfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:06:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
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
> Initialize configfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. configfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/configfs/mount.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
> index d8cac1cbf3bd..60ba24e7ae2b 100644
> --- a/fs/configfs/mount.c
> +++ b/fs/configfs/mount.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> @@ -106,6 +107,7 @@ static const struct fs_context_operations
> configfs_context_ops =3D {
> =C2=A0
> =C2=A0static int configfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &configfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
