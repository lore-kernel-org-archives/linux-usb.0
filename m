Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904596;
	b=zZOih++s+0sOJXYBanUKfbQP+n8a43YKwzbE2b+wPLQmNff/tuG0ouKyiQXVdSoPs5ti
	 e53hSru3QWmmw8+xXyJp9WCEw3/g2KPc3Utis21HV49F6tCbI8H1wXfunzYSS2rvV0o9O
	 ciSjKg3SCLpoqeZk7wi57UzWL6/M3SH6aMhIFz08Di8j6RKNqsS9SPIY4WWx5xZ5qfX9s
	 bXMufHtpv6pXgyXQCav52Gk2lhzpkzBMXv7TkADyZtzqpgOfnmbBA5gG8oH8rOqG4+/6x
	 o1OpHi9FfbIk4bGHROEa3yWbuDIZCekFWFfDNSLDgDOMVsWKbzb+KO2yfF5ac7tCLFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
	b=ImVV846J4xhEm2xktu7St4SQKwFZUSmoPzxSTFA24p80GxUCVS7h9NWIc2lnmXomORu5
	 KZxvgGi+MfDullH0uwCRTwyMhg86S8unkegjqPBev9BH+w1FPpVBnPyXSYU7dbjczHNjd
	 6dnPxAock9XxYd/ZBFxRDsuvsjuxDxKHX+++i121mqTzkanpBN7mG9jB+9V8PZ3o6cePG
	 QyyLdaJNAAsO1TjkhUVGFP2xNeCQ5x8sQYy9/kLfg/uSfx+ag4TiEQrH9ZubJEnIem4yV
	 B+QEpfGex7IKPpkFM8XBvSfL2kiHiHQzaJAg1vdJLYhnKDyhNbYJq1c/boEVMHcZGWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VB84C1sh;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D75606A891
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 08:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D75606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VB84C1sh
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so35813445e9.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904592; x=1795509392; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=VB84C1shjSG034pSk2oK3egXlQwWjuu3VjrdbAKPawk/Twv4Yif6yhPlbROFWtMgPQ
         3tz2NQZOgPBk3fq0QRZC/paJXFCSb8aJt/mhh+A0iXMTZvR4a2C4xo37cxqDT+bS5wyK
         cFfqQ64HX4H+WtOYlqmaNWk53bLD4rVzH3Dam/22N7EldMgTIeT60YiznWNjIzN+eEJD
         Zc6kl9xoD3REW2KAU35dfm9/7zuNgWUL6hteTTxoqyJmYKiacM/NYuvwNSKHsMwzezat
         1L4qftGlpMPZouPAaee8sA2dATEpRVvU+RzrgkUS2mvSj/+KFRi5Npjbd19v9tUdsF88
         Zbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904592; x=1795509392;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=YgYZrfdAeppnj8rlIERYCvByJXXrQJ2RFuMXotrw33cBXkH40Pa2zfkTwBmksjOxnq
         bsSvLZ+61KIxlOx849EJCs9S0Ud/wNZhgS48ggz4t9o5ULxo3AoDG4PYntLPGvAQsui/
         681lqG9Tzdcmty6t4GRFYYasIhRtetlIHr7qdNfbH7ih6DFnnIZtJVqA+e/KZTIoVemm
         f2xqLsNbWjrMtqnX/MeEBsQj77OYaxzl3AZlaQP9iv3SGxiW2WQiAYR8nvJ8j/ufXXMl
         vk1xPbMOLbidQIFkAMXYff5gGdgNH/POELYSQg1yTfScRcsrbH2DzWDXEU80grBNbM6i
         dEHQ==
X-Forwarded-Encrypted: i=1; AL+hErFLtKjk1I2ydp8K2OWKqhmg+aMsPjLAtFL51SvNm6d0hNr26DvRgGw4S9txPfnEEzgpglcvxacqPNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XJxFamhcuUu00o4e0LfW0gsIpPE/Rh9YumjdxAy0Zrsag2Ltd
	dLG5FI2FK9NjtIeNLBOFEPW6rkgrrZcc2nF96JiphtVN6nEVJDjlmOM1YjxRCBmfSA5H
X-Gm-Gg: AYBFou2RFMGhwPegenIK5d2o2C94AAsBsclLLOjN1f8bhDWk4CXGpdhG2YqRES2gU7y
	onxsCuOEFZcJXqVePYkd3jeMHv1wHTWiyA6lH8QDBRNF+R6E1JkzDIrRiSoVStFDun7VXARSL5+
	xB1r62JlRd7wlsZ66nOi+Fg79Lqt05Dl/xurqmnnyqBFbezvAwkiO5gNGrjENeUGB/Hvns/kZy5
	nfgyVNZnr5X0tXwJElM45RZsyomEGHYkx70zlNYGgQQLt/UJp4LsnJ9GlGMpeN0E4DB+7pm54e3
	SWR5y4al292PunWAbG5Tj7Nt2IpeRjDyp+PF05Y44Xx4WORW9hhB+zAgYDkYOxkdzFx6UdS5rAs
	Dz4PDErO2jnN0alw+aGIhJAicCUHDGQW8FbsCU2auhYRBwt4FMXK4C4czSdnEhWZBRT4fnuBQiB
	2jzT/5oF03IYV6fFoAOC+tL2Prmi6IGhfTd1Ksk9zjY8fLk6ifQM7sUD3/oE7YXJO1eZPFY2DdJ
	7aUdViIPFMhMmCRE9hWW2RHvpPEsB1G7xSc0Tn3Bpk6yxYrsVjS7vzvQobdruqUzhY5x77F5yq1
	hHoqlT9eKBrcM7ZTEE9KlZ/ikqD7de4mGzCK6ZG7XwpA/aeGqMvrJTv3CfKRKe42lGZUg9YDSli
	vHrReGymIE9pmUHlOsIB+8RvvaN+PJuXuPYjMSrQaiP01yTaaE5GTf09Y
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr266345525e9.21.1794904592167;
        Tue, 17 Nov 2026 00:36:32 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm52548565e9.12.2026.11.17.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:36:31 -0800 (PST)
Message-ID: <411502f9a4f940c223b2b88d7e19fafdce63172e.camel@amutable.com>
Subject: Re: [PATCH RFC v3 29/44] s390/hypfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:36:30 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize hypfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. hypfs never holds executables or
> device nodes.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0arch/s390/hypfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index 559b011e68800..8662169de477a 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/vfs.h>
> @@ -301,6 +302,7 @@ static int hypfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	sbi->gid =3D current_gid();
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sbi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &hypfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
