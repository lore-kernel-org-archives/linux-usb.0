Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958485;
	b=J4vdLeKNVdaGv2jMStATdpzUJtoRZ9fuy3y6iMsMOn0b5XBrRGkRWR4RnANm70tRj5Ep
	 kJ9TwdopliaeNJgmnpahPyOKE3zkx9jlQpb0/kIVTopySSYH2iWzbyD3qF1LDlrxjRIRC
	 EbxGY0dZWjBq7V9/btl/NKMBFa6jEPjgDaIjRhcMchOcwJ3LwrRpvUxIGNokG/+Lc67+g
	 7cOhrRq4N/mzUFOTaugyM0z51G7hTq0+QPEGMWBpwQFLy1I/vlIRFrD134Hd3fW6FmW1y
	 Ydb0SNOVHWicOScT0fS8xigcwHFTYHxEXy9HsYG0W1FrhpSOU1u96vg+uymFZI7Ax0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=id7sxPUZ1q5vwEsAL+ZQA4c7CaWDRU0GTvUGmQVP1r4=;
	b=GIWk7ChS5ONUIKrq/nSsEIBSKy6AS8Du13Vls3sRARLL5DmoJG6fH/D0FUaNXc8bL8pG
	 rcsKwsHDyILskK/9P6B3SD8h0JFrUn7iv49UvueEPFPXF6ItQHVRdN1uMiBZyHq5EI7Kg
	 xDsZ4nvzVQO5tnW58dOuAU1MgPUYm3WZyjOFElEGFgYlSP9VK0D+PfJTteL7sk1QKFz+h
	 WuIuWVoa4fryfXohmOJh4QTygNhVXbnRZ6Ik15vm87Pjne6P1ehgFm+wYhhSly5XBqRcu
	 EDUpfA9lhNmi7CZTTreaqfQ3RCSVvXFPsdu5YgqbDHA1R2eCWbF/w7Gr9L/DKAiAtYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=PRr5dLBj;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F18606A32C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 23:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F18606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=PRr5dLBj
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-943e8d35f74so40626485a.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 15:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794958484; x=1795563284; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=id7sxPUZ1q5vwEsAL+ZQA4c7CaWDRU0GTvUGmQVP1r4=;
        b=PRr5dLBjAs05ylRi2AXLL0lTt2IRquA8ljp3pqeJPErlk/8PgAPrbJeb5L3wCfYpa4
         XDYg/SSGs1hy4t8K+/Pp2PiFQx3NJhZscZFEkHYDBy/vZZXIK8wPt1b8bU/aiP11Aror
         r2GnSzAJl8YAMrvOZ9zn1J7tRliIlMrZCaSyvO1BKafTr1o5vnDRkuheZbUs3qaGJKbw
         GZZ0QuyXsQLRhhKtgXaxoG43vf79JCmBRlf2ehljTRfDruOrXulaw85CZqHDE9ak195A
         eJ6eF8rJUuh1V7SM65zr4OBPFIDmlixPlsEtIh2VtMq10Xt4Rwuc5EzZPn5JnzwasjJF
         zOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958484; x=1795563284;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=id7sxPUZ1q5vwEsAL+ZQA4c7CaWDRU0GTvUGmQVP1r4=;
        b=Qi87D4JlnonfTaQ5qd8ICwfXuLVowbgOGCNU+o7xeUi9dJq7M/5taf2ctHvqqAb2BE
         ldpTlpQ6FaZaX8UfLFTadSghGEVfRc/qpVQ4C6eq2xBptpynHyi0kC1Lm3sbKoRozZVS
         g0XgoRjmSA9tCXRhM7gUfQkIIazzDCMxpqh/oRHzXMaP91/gos4UvvhWQuD1QZ9d6DMJ
         XUL80S44tiaKh9aT91B2yKK5e611MX2TyoiPwRz8u1KJgC9AxvfJOITGWsMUANX0GE6r
         lQQGxp5TF0MvMtp1wl4mgW6cWAiEUtHuUvCCBayp9ka81Nkvq6AslhVDoEomAcXZBsIK
         MKZg==
X-Forwarded-Encrypted: i=1; AL+hErE6r8srvmL8S/+qSk+2FGHxRKzFwYyMozb4C2PPbl1mbzmpXac7VIjqrC6J3Tnhc70h9V3Iv4bOFVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bTZlwJMahdoABX74nw8AVC++h68z23viQVC8WOCKmaMFFjlp0
	cMBE8Rt8G87syrpKuQS21AlRC7jJpZN6SMb2DQQXURCLFE3gaPjbMJHz5ImoS/jgrA==
X-Gm-Gg: AYBFou23zwxpQMNaWYiteUnxxIzHD41jNhAuAk8Z9hM4h5Y9triufqpZVXVaZVZDvyC
	0lM2pt5Oiq0ohUeGZKHu9TI5eAZ98/sAJPkgxlxcqpS8ZVyiVdVsT8SsRlGIgPyzuBEGH7RRVta
	aP3XN/AZ/pdQIe8NDoXR7gkI7t0j0q3T1VOEouPs9zzOpINYBkXrwUzkUEWu2OuPoIec9NCpsLT
	W7ARIcuaG3aVJTREiBXbnQ6ohB0wOwG8Ch/k5fjeiWl8xHDR9rXNEesij/TIIqs8Z1QUdkfc8Tv
	Vv62+DBtay4NPklIkzxSXFZFB7PYCr6qHM5PVPXVee34jFIo7PGVfOS48b3V+bVrgZ2gm/s2wBR
	VZkvsANbXk07na0t5C+EEAgJh0B5OKemDe+DCXWjPm4GMIOgzZXM8p5Rar/ulczN0uLi5/LwqR0
	tWjhq1e6Ka4TvfU98vLRZehtzZp/9q41WW5+hGOPCL8mNGIr/bOZKFINAcomqCRb0q2ZqipajtS
	RA97iMhG1QRDXgaEvkAsemuTnSQPccMVCG/ZUfRznEPTb1H5hP0tIxpqPoXI8xNuntFM/d7oEWu
	4oU2t1bUnr540Y50UY5mggS1RBc5y5oVl7oxlTLEczdcOr84rPptAhKNA5mANi0Li1L/5Tzv4vf
	nEIdjqbVewZt7XjGtanmzCxGTuny76Ps=
X-Received: by 2002:a05:620a:2906:b0:944:dbd:8253 with SMTP id af79cd13be357-949995ee428mr247457685a.59.1794958484257;
        Tue, 17 Nov 2026 15:34:44 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7c9a65sm41585085a.34.2026.11.17.15.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:34:42 -0800 (PST)
Date: Tue, 17 Nov 2026 18:34:41 -0500
Message-ID: <7a012ff555beb43b389ba5ab96e25ba3@paul-moore.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20261117_1552/pstg-lib:20261117_1552/pstg-pwork:20261117_1552
From: Paul Moore <paul@paul-moore.com>
To: sashiko-bot@kernel.org, "Christian Brauner" <brauner@kernel.org>
Cc: linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-s390@vger.kernel.org, linux-usb@vger.kernel.org, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "Alexander Gordeev" <agordeev@linux.ibm.com>, "Christian Borntraeger" <borntraeger@linux.ibm.com>, "Mark Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH RFC v3 18/44] selinux: use fc_init_pseudo() for selinuxfs
References: <20261116-work-loop-pseudo-v3-18-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-18-8cbbea1cf34f@kernel.org>

On Nov 16, 2026 sashiko-bot@kernel.org wrote:
> 
> Initialize selinuxfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> SB_I_NOEXEC. selinuxfs never holds executables. SB_I_NOEXEC also
> refuses PROT_EXEC mappings but the status and policy files are only
> ever mapped for reading.
> 
> But selinuxfs needs device nodes. The kernel replaces file descriptors
> with /sys/fs/selinux/null on exec via dentry_open() which doesn't care
> about SB_I_NODEV. Android init however opens /sys/fs/selinux/null by
> path as /dev/null doesn't exist yet at that point. So clear SB_I_NODEV
> again in sel_fill_super().
> 
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> Tested-by: Chris Down <chris@chrisdown.name>
> ---
>  security/selinux/selinuxfs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 310e19efff1d0..d7ae853b6d685 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -18,6 +18,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/hex.h>
>  #include <linux/mount.h>
>  #include <linux/mutex.h>
> @@ -1852,6 +1853,9 @@ static int sel_fill_super(struct super_block *sb, struct fs_context *fc)
>  		/* last one */ {"", NULL, 0}
>  	};
>  
> +	/* Android init opens the null device below by path. */
> +	sb->s_iflags &= ~SB_I_NODEV;

See my comment in patch 17/44, this is also used internally in the
flush_unauthorized_files() function.  Once again I would prefer the
comment to be changed to the following:

  /* allow for the /sys/fs/selinux/null device node */

Acked-by: Paul Moore <paul@paul-moore.com>

>  	ret = selinux_fs_info_create(sb);
>  	if (ret)
>  		goto err;
> @@ -1955,6 +1959,7 @@ static const struct fs_context_operations sel_context_ops = {
>  
>  static int sel_init_fs_context(struct fs_context *fc)
>  {
> +	fc_init_pseudo(fc);
>  	fc->ops = &sel_context_ops;
>  	return 0;
>  }
> 
> -- 
> 2.53.0

--
paul-moore.com
