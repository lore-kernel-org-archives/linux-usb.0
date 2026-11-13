Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564728;
	b=d3hg2Uma7mSbLgDKJUk1ZzLytwjAHaX92d2SU9C9wBWitgIo1Q17H9r9PrxN/CIKh/Y6
	 nOZxdOVApi6duxuBKa+SeXaVDVo0MVmestZl+MSt2xWs/gt1IQEwU5fAWfpdssqlmjUPa
	 tVI3KCrr2fSReO+2lcpHiPLUwDej2dKtryWhI1CZmQsanl7cpK26abLocmj5QazE/Ra+U
	 WHl0l6sDW8ZJ64dsX3ToPFHBYbczMD6+q6vFWTu5IVfyPaHPwULYkxkpj/hBT5Q2t224N
	 OHzYZ5k/mzoNf4Uy6eHHMBq4eCkeyB6t3vkIUK/cMfS795j+lMpyAdbcFxiV91Ep1sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
	b=NKElWn/m6fpOmL1OrgpOYKp2jzt1ZYe56/p1r/Vhz/pEPzdk4iqsL8mFRKii407Xu+Dg
	 j3A3hiXWG7XFy3Y5wSJeUt42/OLGxgrmHYp1Tr6G5x1+7GRe+DDQ0ykDBHTjaMBTtUOXU
	 5N3gsZTyKR0VjJdnp8iXh+fRYRiR3SDMS1+qRuvrctvtXRxk2ISDKNNhdmZWykeKyhT4S
	 lBoRxWYWRJ6avbz+g1Vfc6a44wLMPpbHttnIzJZMrh5xKuiFhX9mU0nCtnZyX0y9sE8Vg
	 RUvUR8Oep2Lt6mcWq1WqBltRjrx9hni+PvhA3sf0B9jLfIvRqN0v9UG6OGuMIvffJkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JofFrwon;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE468606A891
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE468606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JofFrwon
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13097965e9.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564726; x=1795169526; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=JofFrwonLml2YmEXhdcViuKQhdgodt9TPfkjQoH5bRE5MuhkX9eapeBcuLoN9BMOMG
         mg62x7tr1NIo2ce3//xfxGBo2Glw1JnMwrRUE5PKg9cgXRmANAsmerUzgfn4I+APSoic
         nLUkrr6h7Ej/6ZnsBOEx8OEPXrCx3CvMaGkTszs9w9WOs3gF62hftbL3MH/tr8iwAkM5
         IEqdn+20vI39qrHT5Lu5B20ux21tBPJwfptIyU9tNUhlU5QyFDk51k8ZhbiJowoQswf0
         13eatahih0uhEB44iQMwucAarD0vNvZBAG3aTkRmepVuKD8cgol5N6Bgv+DPTP+kX4Yt
         YdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564726; x=1795169526;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=D60UKbIEmQkIqrcgcQnguCkj3DV/IflpIgbyUOSzkuEEKVBYIHrSOlzSyj+BsfvUAB
         CiPFJjHn1p4QInQjLRTiY4sV59W3IZ2Hbals+8esNBIQ1F4j5DcgRYpC2xQKQiJ80WUG
         UHzy2CHNRylY/XMEtgW1YYbJNeaFEbpQD/Vz4R6qezS/DrWX9EDXkzKLGCc9LuL7Iq9I
         0A5fDWquEcUWsuHDX0uk35NWEliXumWA5p1n7bSLdmvwU/qGlzlg6vmIhUxmD35Qexjl
         b4PAsnZCqghxHZ0hCrn9RohG+lQHPuwDc9ViMVlJjHgpn28dJ8yzcZuwEfJkPQQHXaiB
         Omng==
X-Forwarded-Encrypted: i=1; AL+hErF6Tdb/fV7VjDxKZOBSCD5TwZ790+pybHT5SZMt6uDPHmydCZM2NItH36IJLT+f4Kma8L31V/yIsbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jMeSeBXO48I9CBZOa83qSFePth/s0qsgQ/PqVNX5cgcRF5j/Z
	QtSyReybtjH9UGrt3cfxP2EiPFBjFO2nDxxjcIyHMEcZa504jd3IcNRniV3d5+82xz8a
X-Gm-Gg: AYBFou2qcuQyZZeNZWyaoT2MM5rxzoCJYFz8/SgcSGcWA1J80nW9lGVUUOp6mYypKLl
	ouyJJrUTepdBtNE5YloM6a6qazecehF+OuLLwevmHi3vH8oUZdc3vDZq8zpdb/vBtLt+t1h0uxI
	LURvvTg3rAs1JOJPb+cD7Dtyy/fCqzO+4+w99Ipl+kWXew4+K8cWYQPrUOLrTe+xdZ44jL1Oi3A
	5cwi7L70dDWJvc3PL3Z4WAS6lgb4UAGuo0fkGI728g7jrWmJ38ZzavK2yBweHSOUb/y0eJ8CIBs
	TUqpaHFPzOQtkX7shzsJKK9g8zRVHh89z0oNNEuOpMyyOc3ton3KCUH6zWnIq/tYU2Xn++CzShE
	/biAifyIfkam4xiKRC9Ut+qqsd4fKTKsJNsIJYfMdQsVut9kbOCwcvH4Z1XWxEgjHrnFUo8SScW
	dwSeel7b2boJfYJcmKYXvahh8KrbHuk7vejcIA9kHAbvOcZ+Z4/50WZG2H5MmI9J/Wn64HyUg+v
	Ac9TMV5b2ldg26oxLiVHipPymr3bmOn9wOq7N3NiMf6d05xyiTLLIqbe/s+gCRo6T4I7Bp2XflW
	c9SsBdMunaDTW500QW8VWjOGL7EAHNsIHHb61F2MeL/ps6yqtshieixqm1KLLgC6iWfUmVGVrCK
	jYZvS0/wO
X-Received: by 2002:a05:600c:c4a3:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb55a02932mr40317635e9.1.1794564726124;
        Fri, 13 Nov 2026 02:12:06 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm142085915e9.4.2026.11.13.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:12:05 -0800 (PST)
Message-ID: <82d691d2db7579d9630bf89f73132e36124bf74e.camel@amutable.com>
Subject: Re: [PATCH RFC 19/41] smack: use fc_init_pseudo() for smackfs
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
Date: Fri, 13 Nov 2026 11:12:03 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
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
> Initialize smackfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. smackfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/smack/smackfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index a72bc7fabea9..4a56bbeaeca3 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -25,6 +25,7 @@
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include "smack.h"
> =C2=A0
> =C2=A0#define BEBITS	(sizeof(__be32) * 8)
> @@ -2880,6 +2881,7 @@ static const struct fs_context_operations
> smk_context_ops =3D {
> =C2=A0 */
> =C2=A0static int smk_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &smk_context_ops;
> =C2=A0	return 0;
> =C2=A0}
