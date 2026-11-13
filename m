Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565074;
	b=LHAdnINsu/qFhEXI1HWtyqIUgl8DMGVNhMzF243+Rr02dln/anvEJzkQ+Aaz0ghT2nYo
	 ioq23MGYRb6trgr95ATDinNMzoaA5SoBrt0gEdam9K2cfFXFBNpWLFksav1NjkY2stkuo
	 LPz4mE/DrRekFCiwvr1aitkGwdZZvRwtnGfPZ242tKQiNx9BvgW5I3zIfd2ZCHXM8O/pU
	 wePsHfYkoFIYlY93g3sSvW/Uulh9pG7OuIMDj95MVki+7On4dIgwizDYdJYuBJRbHcHgj
	 sGrAqxIcijfZ0qU3XVpd31uPBegw75qi4Aj9Ktt+a8urmujhzWI9wHw4oHL+Xv7bemg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
	b=g9Oak87OXaZObkHd0gYgv/FPVxtgNvYhdt9wr8m7XXWM5w0uzz/3A2zrLjqL2X7k0cSt
	 aM3rCM2Ua/tA6v0dEtH5zcDO3UvngZpJZZccfqDJcYceYO2OQVu8qxQ0OP+ZBt9rf2XQy
	 flCQ8lttVBgQVKpStEBNvIXYS+Xw5Rfj830A3ElBgRbfwIijcz7ycxis1BHbje4rwuK69
	 q7/WRzQX1d2cNmpRVqOjsBWHvevveqOfyEZX1lrH0LEetCivrvjDFpzZZixiJjejV0KCS
	 uiFa/QNpFrBI6oJU5uknnYoecc98QtJomTBwM4dpQY5QzmmmvIVrzaMP1nIIe3XC1qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hEEG7fG6;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724FD606A88F
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724FD606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hEEG7fG6
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7049465e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565072; x=1795169872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
        b=hEEG7fG6RzQkOoGSL66zkn+hWpy0b8TxpW+CxGFBwGxbhLfdgmFqwESmbjaY7MScGa
         1TTEC4ZDzMo/nTmQbATUq4OC5CVK8FiegRjrCOceUr+V68t+3IyOPEhrmauT/typpuMH
         7BtZ7bLX9twnpc3pST7EzNdPnkg3BFhqHXhYG5RTwPNXEKUOMAEYxir+CLBCGEbp4xnq
         ot2tG8XA7sYEn5cZCga4RcL6w3I4tCQX2A1rGgTmCQohN7lvb4NCOhavzOt0i7fRXz7K
         0fiOYrUI/s1Mo3f+qCL5v2ciULr5WU1WUhy3OFmgCMCM2mU4bZM+JgAT1J65gELN03wt
         2Tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565072; x=1795169872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
        b=hqgaJ8l9nzqge+1cjgiPfvCKPDfrm6sDYuzyqQmUmtLzuRGO/OL3RGAOK0ZZajNvMH
         0r+Vt7yArRvIS7WCYlTRWXKVYVTalJ++4OWbXdFBK/pkPy/ndGPbfDif4YbW/rAMOfza
         /8zhZcIPReiqjxHKejYLS/K92Qq0ssKyZtI1osbgakWC285G3ISPrayOfi6gPtQd/1XB
         Yv1n2RYU1pM809XUgVrZKUL4oPsCMZ59386kmcnu4iL4noqxgYjGr6+MDPvdby41fjx2
         kgQvr9FCFD9wzT6Hkzq7TG7hW/sUYpjE+6rlTBFyUwdmOr3vXGev5WhuTQDwYU6r9LL5
         EHdg==
X-Forwarded-Encrypted: i=1; AL+hErHeXvImBxvCyFuTchkuJ5UIhpg586F1BV5yxq1qpOV9nqxjxTq9DqrAUqdLBRoRiwjx/NA3zJuDlDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z871IBI+F+m29fRyIHUWyJ3OvzDr91Jn5p/cnOePhsq4+CcWs5u
	pTyX3GBfc8UVIXLmGJA39x/58stGftI3EAfo1GhjZsz4yrgcpF1YdH1IOwPd7MB429v8
X-Gm-Gg: AYBFou09jcVUBDYxhoHMoPmWld7wchdhinGWE+KNVo/9Evha6GDvJx7MHExP3RQItpK
	qP1h6LpwxYEhIgBoZRMn4TgkMycx0fnUHhc5ktFxOiHwrTd0BZkEdNvxHy7en7PndqmhTRwUfjJ
	vCEdkoimdR+qMM46QYFjEhkOhKAAs3vzLD9ijbnzId2D2hnibluWT8AHX/0kHM16Ccv7bfBw6Jb
	0MYH/xzSm+HdzMug7lAdXJ+TzS6h9ZfvqOSzl+F2ERSG1lMZENZfFB6pjAhRiEks7tLTXzsc8Uj
	UCCHlEXEepolHB7EM5A9BuZeYfiz7IhCQ2GLbEqv37O6uWh2924MBiOBDtMul51q2UqIkrkU5q8
	l7Pz7Ku19KVODhN7EG2EGRw5XeBO7mI3FUZm8A4ZRHNLUO4eN01Yc5t4/nZDFsywUGFnIA/VPcJ
	+UTvYCQAepm6dDLMJkv7kLW1uH4R86uxGxphE2guuysWY56c9G9wrYzriZpGcOfemnBH8cFFAjY
	xwEEYg9BNfGFzQsCVj9m3DaStSfG7gDWe7rZ9ZdOeYFH7P7XyQ6bjUonsCKSDpR9dSZniKp7h5c
	LsF+Hj87JUQQErXqD0P84yDYYEBrZw7pIA8sZXfXXusqqFU8WRp6BX5PFZwIftE=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43851425e9.2.1794565071804;
        Fri, 13 Nov 2026 02:17:51 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm3937770f8f.5.2026.11.13.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:17:51 -0800 (PST)
Message-ID: <7cde6f3091f9d90593e4a6441723b6b889cc4024.camel@amutable.com>
Subject: Re: [PATCH RFC 35/41] zloop: refuse zone files on pseudo filesystems
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
Date: Fri, 13 Nov 2026 11:17:48 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-35-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-35-4c998976c6c7@kernel.org>
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
> zloop opens its zone files by name below the base directory but a
> bind
> mount can put any file there, including a procfs or sysfs file.
> Refuse
> files on pseudo filesystems as zone files just like loop does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/zloop.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/block/zloop.c b/drivers/block/zloop.c
> index 65634a39b0bf..dcc06dd47b04 100644
> --- a/drivers/block/zloop.c
> +++ b/drivers/block/zloop.c
> @@ -1137,6 +1137,11 @@ static int zloop_init_zone(struct zloop_device
> *zlo, struct zloop_options *opts,
> =C2=A0		goto out_fput;
> =C2=A0	}
> =C2=A0
> +	if (file_is_pseudo(zone->file)) {
> +		ret =3D -EINVAL;
> +		goto out_fput;
> +	}
> +
> =C2=A0	if (zlo->block_size) {
> =C2=A0		ret =3D zloop_get_block_size(zlo, zone);
> =C2=A0		if (ret)
