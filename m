Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564339;
	b=x4/EbLIf9Sxj9bciCis4F9mQVdkDYKhdFN/UReUheYKq9j/uZA0kTRp/vm+X1M92Q4ZH
	 HhvNcrx8qJzjfCQo4+ChOyF1iXwQqal9ZFn0E1SdTkWLYNPOBkpLFq/VJiJJsmbHTonV3
	 6JMXYVZKnqUv47yNoD1eJctQqGE/m+CVJvl8dhD6VNgw8Zbc1OmxqKacqE6DHfSZLMXQn
	 AKZ9GNxFVLvnufBxoRKWt/kgckhmgBqWMr4b/JaRR02LbFO1EVoqP83dT8f691mZw2gl/
	 bNYnfuORlXV19YhGOnMQzuarcLlXur6tLS+FC23ahviyiCQmBw9HG2UxyrSyNEVuC1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
	b=3RnjFTuWd+g00Rqo8olGQzWHwYJeFS/Vcjghp+7Mbv77P3tpxUKr+yBZllMGrlLdMdEq
	 T68fSeDSDqJULGG2L3hfj0eihNQOxDcUQF/2ILg+sJkpGmnN1YakypSVcvBN0RGBljNxo
	 lsl6BImWfp8yB1d1v5DFHXJPPNX2bPfBai+taOSJm65eq1EL1LH2bKXamzXJHbxqXpI9w
	 pvhioquwbImDxUVXVaWQChmaN0w7viSspi2o5+JgX5a0qMRRFHJsO4yC4NVYnDbFje1eC
	 x2Jgh2fIFsI5261g94jB+Dzist/3mhf+SZ5Rc6/ni/57xULgUrGYC0c5xYvaLtkQbVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="BcN8/JZ3";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070A860A2601
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 070A860A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BcN8/JZ3
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5080ef9b31so142138066b.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564336; x=1795169136; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=BcN8/JZ3o8G8RngOszXG3JTNOcmRF7Y5HhcgHfEFuj8bd59D6/ZB+k5Qh/rpeFRCcR
         ddACGgLLZgU5b3f6uROOjMlLzNHxLpnDWTvmFTIG7dNNkaJHDW07G6TO1gom3Rvc3G6a
         phj31A4a6/nEoCYWD8i1KXLteYhy5qLcfDwMY03tf9yOOPsaa+sC0St/LDVgowIEHsk0
         tZO/CMI2RrlSiK2F32OSWBbCdipxonxIIN0DBtho56nDsRF+fFDKa92VHmnJVt2oHACg
         qH7hz+1dQBsoiVIgFoQGohYiLAIIKP/PCGAm0hHsixZQutOWB167lk9DbkeNw+vQ2Hrh
         L2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564336; x=1795169136;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=linGUwQWH2Mey4/mJFWH5bEfJT/qhEM/w3GfaF4bMRRvuygeV7SIZ+dV9Dq8YLrjhy
         VF3zi0D9440E8mTrxMPLa4ZsMSSC4QOFC5n+FUMJ2HQ3GJNnwg4g18MloLLTmr+20okD
         gnggX4t6xEAKcsXjWjGuLqme79/V0+qIBEmAOlVpDElwwvpF7o7LtsPHgZjg0+Kk6XSb
         rE4VVnhWDvtUuTyQMQyTKHjNNUbrJsGE5KToQWTZDbkRfhqbb4EJInHe7QQduXJYSRKB
         arrOSfPrwcN2Zi9W82p0+Bk3BaRgA2Z0ed4cFFynuYhdK005cFhEgWJ89SJrRl3/kHLV
         giog==
X-Forwarded-Encrypted: i=1; AL+hErH0DFTQAS9va5mPdaFYfD+vQl2roiwxRnMLC2LzYpndPPre929U8iFRP5sR2T48FHF641SsSxnNDEQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qDFiK8LfmLp6meBjw8LvT4jga5SDxOIwUlvkNR9eOjxWVjpm5
	beDMUvQ0w8+B6lsiPPfS+qUcWCps03F2rab/LsgziAtO2Rcw0lnFa+Ot0zsYoidH4Z/x
X-Gm-Gg: AYBFou1yndbA4IlGoOoPIWmTjvo0u7mh+qtqxkTJzPcOyCDfM4gVYXO0TP2I1r8W4ph
	ZnMicqWzlUlVFOUgLC3/qQSeRjZI5j4PbVBoaQnPA/zNs9yDEwRLPmKnD+klVvvb+ReHV/qSNon
	plRn9HC86n+RZwiEg82juw7B9Cvo9DV+gsSSTj4WYlAjo24HsoyEjWfEfqFOyNbxj9CV5SNrpyd
	qPmXCFFoyLWZj+MBHBXQDI4/5bvAhBxdgGW4gBatuQD/xxHAu6YXkjjg8jNW5EP8YGnDtyIinZQ
	21iEIUoXqCtoEoa8ER1v6NhxN5lL09YKClWdbR+aXEYZSUpuuftnulfTua9v1288hqepFQVtLiN
	ka/A8mJANH8QVtiCga2PsPRY24wMiZz2hn2noYfn2sM9CNNKCSG1v8Il1acEXvdyvyq5iMiYO1x
	BDsISDgiuOwPCtpvB3rpbDSfG9jq1txcaEmG0NQmI/KRJTl3uR8xPjb9SsKm+GudrMhLUaGVu/v
	cpTuVi5EbIZAFo2KS6qryp61dX9IE6Kz0ER9hTZqJ3QIX2BuUBhEN+l6nd7SbFD2obIFSvmbk4f
	XCxlBZdA/v3ux/nQtRXKIHPv92gcfAxFrxJtBEj6NF6PXL3iDdlmCFcqr8YD6ns=
X-Received: by 2002:a17:907:94cb:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c5096389759mr162937766b.41.1794564336347;
        Fri, 13 Nov 2026 02:05:36 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm75365566b.5.2026.11.13.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:35 -0800 (PST)
Message-ID: <8f532a01f6cc2eb73582864343e25be4ec990919.camel@amutable.com>
Subject: Re: [PATCH RFC 14/41] debugfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:34 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
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
> Initialize debugfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. debugfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The debugfs files that
> can be mapped, kcov, relay channels and powernv's memtrace, map data.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/debugfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index b4915551ad31..f163f0bc5703 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> @@ -317,6 +318,7 @@ static int debugfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D DEBUGFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &debugfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
