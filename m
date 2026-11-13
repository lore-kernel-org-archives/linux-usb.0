Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573510;
	b=Gnt9q439/H3ESNogPCV2R7xF7qLZJ+OAlWU0jEH+H6W+dYlqg1sTFj2rbNG7dBW49WLR
	 tUHWj6YWRft0Ghnowzl6W6LLpiQFUwI0e4hg7CwABJSkRapJJm4d1gw7saP812viYUiCZ
	 TI4LUNBKfGA+yr5N8Gly1ZA2GtxKcHWwst4lPeLl+9m+8TLV24SfA9vSbNzwXoXDoI9tx
	 2hnY/ULKwt7+J9ASgaNL3GacrrvplhfUV26TO5i8Eim7nUlRd5/FMOlA39VnuY+uFSZCG
	 eJ6miEFmijPATIsyJ7M0c3StL7zc4QmUlOs/SiW6lHkXmVUO6c8gADVm+AI+PM0zIzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
	b=UximZ+FgSL1Iyi5WXnFV9IhO+cqXs1S6y6J5n9x9bw+Wuzj5pGaFJ8H1HADjERzxSPNM
	 jLj1Kem8t+Z4I53gCMfotOrC6vLhQBOzwEVa8ytZ88UaPtX/fhEWdkTeQmWdQPzLWcnVq
	 H11Dx+cqTfLXOAyxYkugQCw5IjrJiZdR8k8ZQnVAhxUP29LeZStD8ojeMYt4pb/ibT7xm
	 k2OG/VwxSfbrv9Gfybp+SzZvgCDipm3zXcgh4zEi6mvnAOQVeKasF6ZKeo9T3cln5lT+A
	 rdMgS33NHOAdZhVycj8FKHabMtNpRSSEIOJoQA0srn4npjhngtBLL7FRY+rq9R3n56Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bz2+TnPI;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F4606A33D
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 12:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E76F4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Bz2+TnPI
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9108245e9.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 04:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573508; x=1795178308; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=Bz2+TnPIApHKvsf08kyiSuJZ5AWViHONwTwuNXVAuo2u8JGXjKnEoxSd3hG/r/h3b1
         tdsUEBtaZSOWfU3+mD3LjyqvBKt9Vc6RBsvkZZTD05u5eCDGhnWto1Wbu/C0r64DVVdd
         h2TGnt6meedDH7Iwjf2Hw2JxWOY8jwAvEAcAC10FURsf5jjp4p/KJzFYjzuPwuYFNKea
         Iij0h8HoPs5opXKf2XwMBJpd5hsYSV0+BHP/DvKdCCgwNFtbeIFAwqDf2ag0NBOCbqs2
         OXWiZmXbdGCixyOlqQBMgrkFkrhg1VmbSdmvvBdeQ4Vz+QMvhYl+k9AO6FJ5UW1pg6b2
         DVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573508; x=1795178308;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny+1veWg8VD0eIDxFJ1X48Kguf5Oe9PbJZTpbcgMiOk=;
        b=h2BjU4AzCwwu5ETfChs7aHopO8BjQwbzptumEyu68Mw7ye6TQMurVyV4bO/NeVwqbR
         ZtFYuZV5we/X4cFSdasvxnwzzcUnORJhS7s788D0z4W9m535boS52iW5pH1YyOx9+k1w
         LuTZi/P/v8Qdf2HTN6TbUzAV2QP1KTuGeTYauB3XE8mQjS2IrNjPOC3Dn1VdyZ6UyFdl
         yqzJcah4S25vlJX72NY5NjUBdFKyU1ziwsq7HMNzXPImZkeBi0gkbuCAO5C46xvmhpih
         g39QGfZVRNwr3DLWiBPefapk5ztGvXxvB12R1MLHsPzR1x0Ce+XTYJYkzu45xZ0QpTjq
         EHlQ==
X-Forwarded-Encrypted: i=1; AL+hErF46GDdhKO/CdEFcjI8U57g48d0EoPH5SeZlxq/uhuhv2S5sZ7ViPC2yJ2N8eZ+GpzgoIhwAiX3Fxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KDjEBBu2QnsK+IccRgRYE/wVHk9vFsHjRDsdbq7b7liHbNvua
	QFrzfZwRfREE3G9Z3KG5IvkuyTGk9BF5JpH+wUZl3mAKALQUqk86uLQz61rzcLsFugdW
X-Gm-Gg: AYBFou19Uh6KfM57nqe2/HMKOguTmoYBRhjENFU2trR+Z3D3DKChxfze7sz+LOVX+Mw
	LsC/6am9RJvANB23p821B2u19I1ICT03uSrnK9DQzDANCCYKw/AN/lM+Bar/XrEYbJQVpoXLbLV
	AzrQ3mwoO7pxCwKIyLG0IjUaEZ5T9KxZlFbNHPRLmfPXjy77xE0RqYmFSHmnEyrqW7u3MPgNLWE
	6C4PxwiGj22G9tFdubl8Zk49LoAeTXiGAWv0K8AtZsW87N1jw2IT9CaoLL07CR2/GIe1tIVSzV4
	xBB/TR0zs0vhA6IZYLO1TeA8D26TRhoX8jS86IcYT9M40nlpZZD/K+WGCEH7kQd/u2mZmAjeoct
	sVntjIk5UbAgrFNH8Wj1ZsjGqdHD9IE84WpK/3quTuIw/axHfs7vaYSmGeSC1mh64U71Jmh6b95
	Fi6dU3z7g9tU7cqIUPO7gPGZbLqX1EjvYEC6IEsIjKqdEyzRUaN1AwuTGd5M/XRwf/q5fH0b6J9
	bQfuOC9pw+OxGP8FEWec3KMdLLZssUK5P5SQgGhpVaZsuTBdQycTX5IoXQ5B+f+wam8BATSp/XF
	jnMGsZRw/JHrLA/rhi0FiWXyq3bkQFrNB6kED9hmWaLWce+nT7KGe5StodhXJkA=
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr24790785e9.11.1794573508217;
        Fri, 13 Nov 2026 04:38:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm48348475e9.2.2026.11.13.04.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:38:27 -0800 (PST)
Message-ID: <28a33fa649dcaae2eadcc934ec49fa591ec1c283.camel@amutable.com>
Subject: Re: [PATCH RFC 20/41] apparmor: use fc_init_pseudo() for apparmorfs
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
Date: Fri, 13 Nov 2026 13:38:25 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-20-4c998976c6c7@kernel.org>
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
> Initialize apparmorfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. apparmorfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/apparmor/apparmorfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/apparmor/apparmorfs.c
> b/security/apparmor/apparmorfs.c
> index a99366467217..351ea3a7120e 100644
> --- a/security/apparmor/apparmorfs.c
> +++ b/security/apparmor/apparmorfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/rcupdate.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/poll.h>
> =C2=A0#include <linux/zstd.h>
> =C2=A0#include <linux/string.h>
> @@ -263,6 +264,7 @@ static const struct fs_context_operations
> apparmorfs_context_ops =3D {
> =C2=A0
> =C2=A0static int apparmorfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &apparmorfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
