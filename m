Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564337;
	b=2rCouLorWkQx7Ym6y0+njx7FgLUiHonbyU6eRMvqzXMu6EBtCU67nzx2BOYQUbX4HeUG
	 jRE7YxroOPCjysYBxWKa996SnvMGnKEaJLrKAoGfW2GM1uIYdteuUDHgba5hzHh8VQjdm
	 UC0EDbLTmvgCHOsnAV2Hdc5rSM3F1qM07fsFl78j1/S00St/tMzz1GFxpo1GcrX/4kqY1
	 GIQFzTK88ntkkdc9OpTxFJvRy4Iz09STV+fAAmjWt+6O0PrkHd9y2qk06moyY3tM1rKqL
	 +5wD8470xPax4b2uDCYRcBNBMyiQ77nYcnZg7HQN6upHUMvHisKFRmsgk38E1NZsqpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
	b=pkdKI3OHiZNDclKROxm/sk16VuT6eNS27rqggN3W4J8c0PbRSb4rU6BrLcoxCXjlA7r9
	 ZAY1IDKbfYIdHHf38gWmTA2xOcE+7vwVXTWKP3Dw/2k7hkyLmphagbbfotvPJ0YP0Ez0Y
	 xY61AKEm3Nzry0bHceeA3rHYFDim2weT59lgcQnYarT/fvazPq1R3+/kzLQMzHMtrdr4a
	 QqycgbbH1VBGszwMhjvDmP1+FKATWNxMpKNbdA4RkoqJnAfSJTqRV0xJ67ziKJfDZhM1u
	 hI9cPj0RrvLuz944eheVu6kxAYerSCS3+9nAyr5NqaLsLYTCQXd10TtjqDQu+lzPy2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nUCLd8f0;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC86D606A8BC
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC86D606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nUCLd8f0
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1310625a12.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564335; x=1795169135; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=nUCLd8f0G/K2fMNIytq9u2LWpw8l5XbCSUxsIs6+S5nVG1T3fI5ErIjnpvRMTRJ1g3
         66+hupjWTQxex7ntfQ08B69tN3G7DYFzu+MIzI3GxWcQnqgZu7yay01l+4mpEhy0Ef02
         xbNHIv/PH0KitW7ZH+pZK/qyW26JriIVV4HRgFAXvls3DDajVpT9R5cy9rfpfJ9qOhH/
         quuiU6KaH+bd+1MNp1oe0tS5lHpOu5FifqraRZhGcQQrLcBdrSt8hi6RHYJpJDDneT+2
         609Jb+e8BW/fqMWXfEgOdGZ8nZZS6I2LapQ01HWyupMw/vLrZIn5Q4gffAveGLQARYQM
         rrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564335; x=1795169135;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=PPNqxG8xAylf7APGhVzVNjMtZNK0HOwb9LQ1tPBkwku6FljMupABgcYf2Cn2dR7uNQ
         USOpZhj49N1WHJB/vOql25Heod1pxq+qO6oeL7EJGRgTgasggNodYA61UrIzcX7uaA8g
         3RoeTOwQFzfsaJ9WgAlVYWHAIhtqkMrWjcCNk1MBtmSEyS7//Okac2xmXAnJGI4ishJk
         p7X1XwYu/h7XyIFf8zygKPGGSvrsHe0qho9hGhE3EWM9avNdtAPiIBk8k3SsuW1a6bLX
         S++XcYSmEiR3l0qm95fUAUbiK1Q6kTlmmaNVbCD4wOXFbohKI2qwjGC6NeZrlhvlDGn8
         vBOA==
X-Forwarded-Encrypted: i=1; AL+hErF3hn2Mddf4xfluvmTnUi1zSmZOroFdhOf+S66ky9plXViqvXCC2ods0XSfIK8QuyKx9ZPSIgipWxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TEKxofWTP7zY21fV97Q2eyeEMeHe9nvTsWsMr3NSwVF26zuc8
	/JgwNKLDQEahZW/aEPOj/2Ut5Ds1f/FgzyUIrR7TY/eC7dP7YgZGiTxfz6kv0cwyVBQd
X-Gm-Gg: AYBFou3ZGgVHtXe5Mw0CVE5tfKfiWCqLEylrJUy0NOVJgjGh1nLiZv2390wNEuY+Jzv
	LlFhoQnZMx8MwV2pO79OxIWY2/IarBQbeIeBm1iWcDcx8zbW5uICHHpE20Emmk6iwUmq5nK5VGI
	pE8FWlUZOw2WVPoXTVHIw/EFmRMKOSzFM1MvXXOKLIcsbh7U9vJ1gdEj/uqZhzXrOqJe6yJ9cC2
	X1E+bF9ESHHnKfWo0FxPYeHL0q5TFzoHJqNC7cjW4MUZ/oRavEG3uK8nPZ6oZDxrefePteu4c5U
	SsWgeKwWB5HQB4qRxNEdO67XdOccEtOZlVXdQqwea9JxmaYqq3vI0Ix15fvlEVc8doZpDWRKNA0
	lmllMh0D4wLO3FM1DodvTNfMyHFhMbz0N4zvingrJ7nX1DcUkDjv9sLn9f6h9YYPShg7iMgLXgq
	A5DGBU9g7M0EvzImWEL2nkR7FGGgJ6n4+Ep3TGybfA7Dh+MIJEGFDLsbmrDuhbismlNJMVOzXpw
	jTUEVrGKYUHgqu45/zor1OOHWOFwkNTmWlIRtcK9nUp4kJJsQOtvuf1B112wnB3gGLvtFJM+XD2
	SiCSwwEQLaM/yf4Tepg1s2kT+O4RsKt8JcGtzoxjHm5GZxBFMg26VrIXKht7aJcC
X-Received: by 2002:a17:907:608f:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c5096398b03mr148720566b.17.1794564321873;
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7b2c9sm75811766b.73.2026.11.13.02.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Message-ID: <08fa1be263cf4a3db6b3e5ec2847107fba7acfba.camel@amutable.com>
Subject: Re: [PATCH RFC 13/41] devpts: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:19 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
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
> Initialize devpts as a pseudo filesystem. This raises SB_I_PSEUDO and
> SB_I_NOEXEC. devpts never holds executables. devpts_fill_super()
> keeps
> clearing SB_I_NODEV for the pty device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/devpts/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
> index bd1e8eb26edb..47ef12241d92 100644
> --- a/fs/devpts/inode.c
> +++ b/fs/devpts/inode.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/namei.h>
> @@ -438,6 +439,7 @@ static int devpts_init_fs_context(struct
> fs_context *fc)
> =C2=A0		fsi->mount_opts.reserve =3D true;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &devpts_context_ops;
> =C2=A0	return 0;
> =C2=A0}
