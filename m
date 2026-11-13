Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563701;
	b=5Hv5c7ZThYvtk/0FZvjbZbamSAX34T1Eemm2f6OhG5CCRH3Nhcv3JY6zKKsI0YCFGLx9
	 eTecu9Mj3o9ltRMQA7kqvPKm+02G2nt07MNq3EaxXoQZawoJCffjGki1GY3y+l+UMPPZX
	 Q3dLxFhnHmALZBFW2Om6oklotIItj9HzBHwaWkdnLdjJMfXqL7a2E0WdBRGh0ZYObl573
	 AA5jsOoULeWL2TpFWUXyNmDp7RDg1R7t1Cx/jw8mrKIJLWS6GXS1KDeh+ZCdhPLmXJnZW
	 +IJQP+BLIo+rXs3GrpdMcGbqmQCt2aQbFmV+/LDS013TDfg3dH1IMVWxzppEepepGvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
	b=bdN0KegLI8v7TQF6RAtG4DkKJjmw3M0Vwj7FokiF3kCWRa9i1hg/Dm6KJwJx4sHAGX/p
	 5fSE6tlz4DvhvMAb5ezP26abvYha26YokWd8Crkm67sLTkp54kCzNmSpQC+cfD0AgbUKF
	 OrtgzG5XDRCz/OQAk/8hqHTdyZM12FxaopibeArs/flIcjk5iCUdpRSDMq1Sl7x+AItE7
	 Z5Z+PEF5PBeI7CMaFDPrIAX3zCD+4TipZJYI4zjDlH7KGB5CyAb4bWefA07CEs4oIeM2H
	 PJgfbc61hoIzVIjNfu2dfKUNsZmT8FECp9fcGNbjlIKLfLQsE/RGl0Vw6+o5G40YE5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sk58W6sW;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444E660A2606
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444E660A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sk58W6sW
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5083bc0e28so142297066b.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794563698; x=1795168498; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=sk58W6sWmN4ERo+6S+koVh/BM/TVuc998Smvb7+dAHAHasLoIxA1PyH7SpTb2sphTs
         qaL8BceJIK/C5zTluK59TXAg0t7i18MIhSXKzAc74GDtFkVBtJ5XexxofTn2ErTCpEyw
         wBL0ZIwSoD+QdFLNUYuAtp3uhttIIU+8CcgeY50Q9BuPcdVkRSxffNnvhBi5q+TOT3Z0
         N0fPVcnw8avDa7R0wdKzwUNoVC/3vPRCD1SmgKjZfrkNv7BBIugYP8aqCryl3mRTzhIm
         nyzLSOhSkS/Bye+QA00IM2MsjhnUA408QIyungJaHYxvuyXbuTeC6K0dJcKnUnQNsCLo
         BJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563698; x=1795168498;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=HzwFmJyY29JKOT9dZBTav1gdCkKxTvt71kqRZ3/030jFtjosTCvFtCAO0CwcjRgzbf
         Q6D8y1qSlw2Gh54TI6s1s1Mjw/FfbMOuZ9ue41MAJoCY8WtTLUKG3OiGxVTFahgavYn/
         N57+XGhQxztQC6XoUGys62BnJx/CQ2n1AS9RTXdD9lpWEMysfHqjZtRd4QYD5HeRLcfl
         FD1VLH9fsPDIajSVSrn3PqHcz+JoaiMrRf4y/vGesUuATK2rSLOtD5w15NIC72Q9MVTc
         1JKvsxHdSaSKzuDAiU4E76P8whZQ+S8+mb+PmaXYcFTC+fgzujs0HwS0brWFjvoynOpU
         ERKw==
X-Forwarded-Encrypted: i=1; AL+hErEQByfmDV1XePescZ89nPgMazxIf2CTIziQ/1z+heOZg13KuFunK7CZlxrfr/jpGYg/s5nDw/ylicc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fb/AYrAv1GaX6kMb2sou+W6XyFI7gGg6VY9KorW0V5JqfGWjn
	KXl6qVpyti+TVWbSPLdvNkVvwZDG+3H6esRBYW+3fwhA5P4AU/CLdFVLvIX9o5CAkixW
X-Gm-Gg: AYBFou3bmcqkf1Lozpo/YaW9F3mIHk4EXQRizTNkJUsH5vbz1DXclnS2UGpA/KyW4T/
	z8AiJKfvViSCUwe1QBRRHk/cV8T2OtkkHaZBBlWAcSn6hHdIaThIqOSH/nLrp5t/xRgD7K5Pe79
	5JKxLww4dEwQyIN0cpkzpeXE2CZNauE956lNa4MjNS5VyCppRegzVKUskxSw+cBL3d1hNDWsFfH
	tdHDTGaiKZePzOSG4u2arHPyuR062pBkJH8NGGwEnGvgLZ3CIqvrGV8mdp0H+ZmXXdKe7Y1SPwn
	dR1HocEu7xc6tCH8GnylbMyLzAuElX5t2lPawjHxpbliiIyeRL5JBMLoBXS7Ofhf+3svjfF8Wh6
	rIaCTE+rIVjEmSxINEw+w1aiDKuN63BtGX+/5KI7dlGgpMnoyUXrHLGCcxYU/kB7rfj9CKH0Dlk
	8/h95r2G14e+rs1brQrZdaj5LpdjpKdFbg6vzE287mb8SwQ+71jUMHphmOhTNw+xLfLlalQlZo0
	gr2l3m72YzTLZD1gaL/BBSCvejzXQ9ckne+36t5uu66+MDhpHUKN5cskreGIni9FX8Zf5bXxCrv
	M6wX1rYdp1iDKJ16bLmc9iidE/QfScpkA8yokdqm+JaHxABuKS+AeDuDeUeCTVI=
X-Received: by 2002:a17:907:ea93:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c50963bdb9bmr198299566b.44.1794563698514;
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50957c6c1fsm75151566b.0.2026.11.13.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Message-ID: <b42c9f4d29a9cbea66929c95cc8f736f12703c72.camel@amutable.com>
Subject: Re: [PATCH RFC 01/41] loop: refuse backing files that aren't open
 for reading
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
 linux-kselftest@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 13 Nov 2026 10:54:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
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
> loop_configure() takes any file as long as it implements -
> >read_iter().
> Loop itself never checked whether the file was actually opened for
> reading. Buffered I/O went through vfs_iter_read() which refuses
> files
> without FMODE_READ. Direct I/O has called ->read_iter() of the
> backing
> file directly ever since loop grew support for it.
>=20
> Since commit f2fed441c69b ("loop: stop using vfs_iter_{read,write}
> for
> buffered I/O") buffered I/O calls ->read_iter() directly as well.
> That
> commit was about O_DIRECT handling and the FMODE_READ check went away
> as a side effect.
>=20
> So whoever can set up a loop device can read a file it was only
> allowed
> to open for writing. Open the file O_WRONLY, configure a loop device
> with it and read the contents through the loop device.
>=20
> Refuse backing files that aren't open for reading. Loop always reads
> from its backing file so a write-only backing file never made sense
> in
> the first place.
>=20
> Fixes: bc07c10a3603 ("block: loop: support DIO & AIO")
> Fixes: f2fed441c69b ("loop: stop using vfs_iter_{read,write} for
> buffered I/O")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/loop.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index a3325ceab484..c96e35c3ef42 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -528,6 +528,9 @@ static void loop_assign_backing_file(struct
> loop_device *lo, struct file *file)
> =C2=A0
> =C2=A0static int loop_check_backing_file(struct file *file)
> =C2=A0{
> +	if (!(file->f_mode & FMODE_READ))
> +		return -EBADF;
> +
> =C2=A0	if (!file->f_op->read_iter)
> =C2=A0		return -EINVAL;
> =C2=A0
