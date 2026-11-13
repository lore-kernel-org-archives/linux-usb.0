Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564824;
	b=CRSrwKeSvDa1maXuC87F8lNoGN1FAqUx91RVmLQWJUCNIxwEoWpiYtGIBliuAuwX9JfQ
	 bJ6/dHbB1pAxxknNU/7LufqTbTkIhGZ0q3xzaM5FSeHctltKKSvgrtI4XVO5mfHWYBiwX
	 E5wa49FNfl7YGms7fMiwHiGZtP0qqEhxpaa7sRovN9NbcyIBo1jENSmxVpoT9VKwYuKij
	 5tnFBJEoj2YkXxMFdkydZj2F4gPj3jwU4Tz1CGUbaBX3UGWifAC0l/q0QOewUTcC5w7yR
	 IGaec3c8xwt2+omelZWBPqHQoU58WWkajyBsIpO1O50UfU9UTiINnQgqWjdlBafIOSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
	b=YZzIOA4mUf9EnQynXBq4lg+r8cgVhnHVD58MC3oScQj6NuzGna8n771MUW/NqS90C5cR
	 xuyaF/PmUiLN/pUEL1EaQT9vBHKJuE/oNZCkSzaG8x+W+ubAnk8UshuTa7lH1JvWBe5aw
	 fmtlIUvJtVbmtExL6CGDE0DaqsWwyTshIUq//cqnVOHKgUyLnnSHey7Ol5xaHgcQ1SJq5
	 Fi04UUjbYHj/DIGIj3RQ7ZRD0MjTxkotsPhbvB9aeED6BGf34LNZEnUknNRbi49Jfl0TV
	 1CW8MdFpA8qejD5yYV1SAk1HkoejHHf1wgu8+VkfddLhWt8sorlYcS/c94SyqsJBF1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tBSDp3uS;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E4606A88A
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50E4606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tBSDp3uS
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso1490862a12.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564822; x=1795169622; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
        b=tBSDp3uSBFgypsbtBQgsadIQZQK7UWodMC4WHZVi1N1ipHHYu6WywVfCa4AZ6QIaRM
         wIcOajhLTVFUJp4yf9/N65gePrg5n4K0AYKI0yA+7KNwnMoUY/irx0jTqY91Kx7jR9xZ
         Pm03fPe9TdsIWGPKhcU7A4Ssshd7c8Dhe1zzS2a/pwsZLiwc6FmAy6ptf2LWGhArJX18
         uzRhPjO9k+hyhG0ceM77HGUPCflD5+7VnbyODCgVUFUm1PdMwYT1gZdGgKWe2z5NHlJg
         Ao5qYJPp+rBAoBURzi6iHuHACVVyoOXqBDLcaaEy2+qVTTu+93IkZN11FbEDMtWMDX2T
         mB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564822; x=1795169622;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycFr7tcHP3BtNSevVHScuCcUOF/OuOrXOdu+rsUd7U8=;
        b=Uu55j/dRbWLzMp8s+F+B4OVza9Mi068YawZCSxmcGPB9m+rrUIS0TNeogEWhV2WVq5
         EMFAusnyHxb3Gr1wRHdtN+4eopx7F+VpeaWfT33uDVQc9OsCeybV711Lf2hPfdFwTNA1
         y/d7QLERtXJ7Og4q0pk9T+KFpi0jL3GDV815KomXnAwH2jq1QNxF+KDjLimFOaYE+ZvV
         MzeGXL/LCOhKZbsk8cmxcGQnEynsYdQQ5J6symA+tWZKT7z3kUQHSRgOsmpc6oLXf4ua
         Fj6m0I5Me1ar0kamLARjvXaBzz8LpJMuUfOl/nrU0dkJhq0aw3/Q+OObM0tv6MfbsvFF
         4WQQ==
X-Forwarded-Encrypted: i=1; AL+hErHzQy2TafJ99q8zpn4fB+oqa5BBXj2ijPpK813rqeSrIxYvXy/7203r/bWpWkfXW+dBQdZBTQNdigo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fDKCAny1JICoWv1xhksPlWeTxuP0HpgRQmuCkIy6TrKDFfo9a
	lKp1Ztt7ZNP7Q4OrBAEzlcmOzNqt6FjR65KTyRK2/PuukVwxZD62CEhz7imk8EQtxl+u
X-Gm-Gg: AYBFou39zQchGAMfVbrj9nUJvY8QQaxwPaRFoGbr03ZERrtrNcDPJK7Rr11iSx1mrIB
	RC5E8Devj5sleHZgkFriRwV/nYh2QbWXUqUeBiIDMGe+64m0nx9UC3pMvhIsz9Bals6jNt9t9RF
	xIy8GlrSqWdYKafHIaH6dxOWDSpt2VumGho/VCYvtA/cGmy4WOmU0USO/9I1rXgiqltD4CFWZVZ
	TYMwtKrtH1HFfEn6Zosio7QrpUQlT5+Eq0SneTnjxsvLawVOD5Ty4AaRGCYpHYCmF83K/BDe1Yf
	d6/178FnQhI44q41kM5mTG7UJOyi8UwfK6RRehpFLDHANZme2k5pj1rpXmttZDZIm0aRPsGvRze
	K9U6f8Hg75fJJML6I9lcGPj0YRtyOBum5ffyLKbncaJlQFmsjxmiYAWEA2vcWiC4Ee+7IyIMRln
	EZq34oIkDKWTJl04qmZPVjbKvSNLRo4VFkzv3IeI9IUf3EVfvoXbzUpLIUEQz6gTBw+5YUlGDjH
	h0o1C5Q/pLPWhDJT61fkn1A7L4CE5/Gn9kCnOFLzXL3maHIPGBTsRR53PN6vUkCgQzUBxV6DeQV
	L3nV8GY5HidK1eWw7Ybrs42BHUt6V9NTMYts7o7+/QY88P5zQRiEViKjMdzz4iFVQadBYbwBtUK
	oPiwCw5Up
X-Received: by 2002:a05:6402:208c:20b0:6b5:69f4:e7ce with SMTP id 4fb4d7f45d1cf-6b7c0c62bacmr1415990a12.39.1794564822367;
        Fri, 13 Nov 2026 02:13:42 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm4332158f8f.35.2026.11.13.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:42 -0800 (PST)
Message-ID: <3546dd28b1d63c1478d391a2015fff4c1b976639.camel@amutable.com>
Subject: Re: [PATCH RFC 24/41] efivarfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:40 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-24-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-24-4c998976c6c7@kernel.org>
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
> Initialize efivarfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. efivarfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/efivarfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/efivarfs/super.c b/fs/efivarfs/super.c
> index 12746ced6dc6..e598d42c5f42 100644
> --- a/fs/efivarfs/super.c
> +++ b/fs/efivarfs/super.c
> @@ -8,6 +8,7 @@
> =C2=A0#include <linux/efi.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/pagemap.h>
> @@ -554,6 +555,7 @@ static int efivarfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	}
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sfi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &efivarfs_context_ops;
> =C2=A0
> =C2=A0	return 0;
