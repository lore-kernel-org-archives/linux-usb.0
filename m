Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564919;
	b=yrMNMdT7IOT52ELlCvO8XerHkm9wkbaEeKSTdNmCHDrLIu6dfPX+Qe+tWCLva+dc19Td
	 aiJLXR84ns2C37BkLJUt/tfl7gg92ojFKpm6+pO+yCZ1/T0If0lCOuQ1Dmf9YCd6sG90Y
	 MAO9CeCgiXnW/b7vNue3wTnlJ4BfSiah2xV9rYNsoDe2VY1eES/Lizkzewc/LSy6kU6Vs
	 E594xVogE1D11e6NzK+ieHO/E4tIzebxfbaRs88zZTQWHWfZVn/ksjwMiuSYt2SkUik7n
	 NFAOx7dCC57IlDKdMX9tjn5YRxQ7oRZ6V/6yLyHP7uwARFVe7eFoZIWjw3OECFYf7vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
	b=nzm0J+EFBuq+lxzjvnpl+Xi/e18E8CH3AhOftRlKlWaRQvWY/ztFgHCtxQydS4hLOQ6+
	 r42Q41ylf0/3ocp6jTxEveEkrlNxvAyhC0thupwAzdi8QAE1jT6aYbpjkOyaQsBkDXwJx
	 oqA3uUb20A7pcrFlTA01+1L/YebjgcNso0+oRXax2N8XumQMFbfRGggi++2Dg7k3/BZwj
	 qdhZpTQxpn857VVF2an3gvZOBV+yDa+9lUYLfxs9+b4abr5vA7NopjuGxrmwdd4w09pfi
	 B0xd+QxeePD1HuNryCJwW6FPCqrUVxu7GIgPcY5eGJBv5h92e9tkigvYpKFkpXMatOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XokUN4uh;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F8E606A8A4
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F8E606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XokUN4uh
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so3785145e9.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564917; x=1795169717; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
        b=XokUN4uhZ5cnIDNPS9kLjfaPp8ZSmyDY7nHz3ffF9uftFGQzzc0NaUd0CPxl6tmm/G
         EB2bqVZrrrQULKzHfxmMlarOF7+NP4G1EuGLp1x7hwkFzcf5DKQIlYH5+zTWTg0qLXK8
         Q27+pu7matN83z4kFimCCYFY9EtcVBpSYh+f+WbPWczzC82gi2dU1+IxENiNgIvD4ssI
         1POQJndyP8zOY9I/drEtHc8Rir/wcokVwFCL8xkdsULqRcKqvw/m2pftg5e6OYSufYMA
         FPm06vn59Z5lYx4UA2FpKr0UjB0BBdejlJLIE+RKFWt9/d0/clXrD3SuYpmwDbHdW+74
         JQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564917; x=1795169717;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
        b=f0hOeezCDxm5NJHOBjw0q8DKe5Ej5FzFUVl9+KKNYvxD4FeLXUVLxR/aZsnMWGfsck
         V2M5sUVWR1Q5RCzRqTnvDdqd02j39uQbYunj8bUMrzY7zgx2OSpec3/xwNfygkLQsJSJ
         bdJML598j4eLV91nAFZw/WgSRMU/O38klTXYlPLhCYr7Deg78pLc1CAmSuKpCadTLTKq
         D4QuEyb1gxymrhL+5/5ltaFnp8YMN7ce2PlCr5slgoT5z+8BqHmmyLccCLXP7bAhiUly
         dnOp42fkYhS3bUrHSN6Wm7pJ6HfAPvepp9pxaRMWyeykgQNS85vVBMuBPjIz0H02AddK
         zDdA==
X-Forwarded-Encrypted: i=1; AL+hErH8mglGjxYAsaaLIx/8y1W+Oq7GKYZg00w8iAbaaeuqwQfggAvlrLqgNirRNWYWzFj/j/1kTrPh8mE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UFObmCxQMTtAG+7PaAe54cywkmFmvkwswcuvurC60eUBmKMlP
	xkw65XkB2H2TVSQ5Vx5SR+ETUV0t/0cXt5keXXsxSJy+Cqf+rA/0+vlrRGIGu+2/PSWI
X-Gm-Gg: AYBFou0Q/DJEGVOS+Ta9B/UBp3djNW2K7GJDwz+sZHwrccE1S8+cJsk6yp1awifzbh5
	C1/pgqziDVYqjmsUSKgq20onmYUACx3uZFeTZtHskYKzQ8O6NBV/rvR8qeccL5awtRdypATmxE6
	txhPqncKPu4XoTbUM7Vzyqxq4R0iPsIQTyNcyehNqA1bXS2iD1oe7Yr4aRRyLVUyCsWPaX10fmP
	zACex4EWqGq6GHDZnJzVsbQa6Pn3RbRTnyRDOlZs3YQiPPprPApWT1GIA7bNlNaAB7q7CyAbWU9
	G5wXChdCDPoMlZd4hlkJOZJvfksvzS1Wlrr0TgmX85MGH90Zu1PWC13ADUuVz7pBg0ZWa0k4vmA
	qx5i1kEdYvKLtuQqjDsc5BRs80nxQiPlCZ9J2/F3lzVGNUACTyIE0bYPy4kmuE4Omly14YSXWlr
	/tWtEYqX1G7vWKjBeUEidXbs6nDNneJxhhLnQbFa6DOehRUVZ2mfavUV8LvaUjtaq6GpN3+Bq62
	pJVeD6DZ/NwKg1GI9ITdD6WMbzT59ZQim+wip1W24oj79nz954F2reHZN0VaDdj5auzxx2DbaVP
	c21NC50MAT7x5TdBI59Gkqau1rpTY5TMtOZRNVzncCxlJNKjXSRKfYEZfKx3Ng4=
X-Received: by 2002:a05:600c:4f84:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb5599ade1mr43492835e9.0.1794564916955;
        Fri, 13 Nov 2026 02:15:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56680ea9sm31982365e9.0.2026.11.13.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:15:16 -0800 (PST)
Message-ID: <e2edfa06d185acd86b46945622b6eb6dff97b307.camel@amutable.com>
Subject: Re: [PATCH RFC 33/41] fs: add file_is_pseudo()
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
Date: Fri, 13 Nov 2026 11:15:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
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
> Add a helper to check whether a file is a regular file on a pseudo
> filesystem. Only regular files count. Device nodes on pseudo
> filesystems
> such as devpts, binderfs or the block devices on bdevfs are what they
> are.
>=20
> Look at the inode that actually provides the data via d_real_inode().
> overlayfs accepts sysfs, cgroup2, debugfs, tracefs, configfs and
> securityfs as lower layers and reads of such an overlayfs file are
> served by the file on the pseudo filesystem. Checking the overlayfs
> inode would miss that.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0include/linux/fs.h | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 99caef43ff3c..407ffb6342ec 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2553,6 +2553,18 @@ static inline const struct inode
> *file_user_inode(const struct file *f)
> =C2=A0	return file_inode(f);
> =C2=A0}
> =C2=A0
> +/*
> + * Regular files on pseudo filesystems are kernel interfaces and
> must not be
> + * used as storage. Look through stacking filesystems at the inode
> that
> + * provides the data.
> + */
> +static inline bool file_is_pseudo(const struct file *file)
> +{
> +	const struct inode *inode =3D d_real_inode(file-
> >f_path.dentry);
> +
> +	return S_ISREG(inode->i_mode) && (inode->i_sb->s_iflags &
> SB_I_PSEUDO);
> +}
> +
> =C2=A0static inline struct file *file_clone_open(struct file *file)
> =C2=A0{
> =C2=A0	return dentry_open(&file->f_path, file->f_flags, file-
> >f_cred);
