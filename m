Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794698411;
	b=JNBwLJdfJOqLdQHIKhK83Nc2ZzGO87gBKHfgxcXbTlc7/FpqQwJA0uXIN7sDXVGpHL43
	 CdpA6vnKLIgocRdJdPdLUSKc7Nbz622AMhtet+g+W61+iVhVsWpFQHujvzaxz/oWemXM8
	 Yhd49QyWzU1nI7M9NJma7/l2z4sjpP1uAyXKK2TyFaVz3H+sawDj3DbMjcow4v4HW9nMY
	 q6R+lEO3bIWoBv69vn64IJS6mBTVuvjYXRPWbb/VZ0mp1ENneNxYs7ZhmTIf4ssM9StgH
	 BQAX1IBReoqch9BaLqo5+K2GrKler1tsPn5w99rGR5oV/LdbL6iOt8oFre2NXqR0LTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
	b=ZxedQiMNxlQgzE181JA11l6dw157cg9KF6UdTxqkTiYZV6d5O0O4cnkS/0IWalgw+acQ
	 jA5k8kFF8hmn627rPGxiJhUh25EDk4W1Mt48cnw7PRMnwdxtZ5jO/eo2IEYkEL0lbDZwk
	 FeoThHSH77kuko+Y+vxdxXJmOiRmFtIS5wikcrDR7Mv+7oQ3wWUlZ8GtLgEhohUhBMR/D
	 j3+zDQ83kgKPttcmTIp5gT/zWLzHLISjJMHlf5gp71qSrw7Q3NyKcxfRgBWMvg+anwawb
	 25YRGg9R81GLj3EKmphrbkfOpSzRPmvWpRYSeEX9T7j+rUrfEkhw5CKig0bRFrLzO1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ4A5V+6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A5A606A33D
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 23:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A5A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZ4A5V+6
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so5593828a12.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794698409; cv=none;
        d=google.com; s=arc-20260327;
        b=Rb3T+EvXTqW0zj9/fUL+jG+uNIwcohgit9bQ5n/SvvXD35YjsnFsDib3QMyU6C0vSw
         eJVRAbWniCxJucV3uiSAO5UULh6Guo0pYK6dvChzXFgIMOHj+0pwXMN429VY4Nv4UVGG
         Hg66wmWfZXmZBdEYKwx9Yn+ISCLRduSEJPLeQa5Vbl+EcsgTbY2H1wr90cEQg8iRNEDo
         RZP3gMCkEslKOWFSu0eVyn075CPPI0ZsbgXz22W6layqpmaFPTDsm8Janu4z4fO0Bcpo
         H0h7OAn5OynvfkVqXghxeHoiZx/tJRUyWIW7tCR5RE4bCLt772F7KMVZaGhvNmr/Zpmb
         DflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        fh=DR+Hx3tUOqmdbZf8CkF2yIZX6cokdhi4clHOB7qkxpI=;
        b=Xt3RwQbZ/XVgfNOPpGBaLkLwjCfswF70cXMf4hPdfTTIH/14kBmigeq/WmnR1gvc9S
         UAHVQnuLvwZzZCS7+slIIiCgkMm/BtqVuJDH7miHP9hhcU2aDTahN3MWxMwNiDX4kQKt
         xEqGPNIPs39hQvWoG3Cbih+wRfWrICxmvFP4Y/MlSt+4W/VFvcrxySfo9dik6czLBah9
         DiTOTXa6v7X5INHea8qn5PW6aV9sIBjUM2BvPKm3Y8h5LxfJd8PT9TrIQgdVowaPB67U
         WmSgTm47VqwCClWCPpUuT15Wi5Y60kdta25FsInu6kSWDqBrdjU9mQlRZGZXD/vk0YnT
         fxMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794698409; x=1795303209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=bZ4A5V+6Vs4HKIPLNbCXlaoHg6GUiZAgPE1CoHup/u8F9XnmCFMSb6naMqQFAl++mw
         +LZR0jt78s/FhrwMU+95xN0Ho10rZ/g9p6M/dfGpr9SfvlaOXM2WfiTCtO0CejnyefhK
         5gg17lDjyCI6S+pTTK/DIWzHtcTY1JHkLI4t/I/Teu6/Lgz9A0oKfkx231Ay53Fdu4Kp
         zCo0ecwmPzO3ZOIddRCFMjOjLH94BU3oXsC8cOhJgJSeLFwZkZlFyxo1cq6JVw7hHb6A
         21NW8PziNlBat7d4DfM9UgO0YIScpglsDnmQoGQNIOQhlOx3hw76q6t8+8jTPfBn24eS
         FVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794698409; x=1795303209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=mSjhIzaHJu2qpBXpDwFgp35hOxG55sUIFEXiXHgngzIgFWl6ijfpN9WtFuXaAOvapd
         PgQjMFnGBPidY+4wijb/R/0kO+yttZ+0tkuKvV31OKhQTKY4sMtv4P8JVjAPXec2R5GF
         b2iSoB0wr270gaypbpfHJWnTyhwLBlPU+HaNesuwMvsYIjSLxXmC4oZd5RAks4wpXqcw
         bsnBNHb8J0IOr4cRktR/dnirqpROdQTLgdbei6uvLC5jh04Ba4OZ6wBpk1Re50JJ5gL6
         /HBjhG7KYuEq2VlBkGlKq+1KY5DNGwu7PAokhT0lo+ngb+eWY9LBL5XI9+ULOvYtINiK
         DNkw==
X-Forwarded-Encrypted: i=1; AL+hErHd0DwAh34qoZ3vbM7W9WEG9uJk26ryTs6CrRPxC70ZihNaWT3ZHi5SjJsNTQGS/c1Q58roSOBjMOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z97dPikMy0yiDYjeQqLylDWXtC8vQVspaAuFY1uakKD10E3goY7
	9cFoifpjcqT5oy310ui2gGNZYVHzNOj4n+p019miXP18jsVjQkOwnIlwjWgB69+BkTlhUGs+Xov
	t7PfIQMdbQrnJ/Xes0De85STJnjUG/RI=
X-Gm-Gg: AYBFou2e9hSI4/Unk/5PhALSMwIoQFvuIZxkkzM0quUR2E/uM/u+g1qZJZ2LYwGMWS5
	smkv6I3V+H50OJG1j/hv36XK26QFEFNMPKHNs8oNLCQBw5J+rmPFNeyaBQtTmwoAi9RxdLjMkSY
	Lb+pzC5k/aUsuLRrTu4lp1pXsa7VIltDl+OAdEo+SgXEZxDXCnxdqvutqeSt5EHi6uee6Pbi9B7
	89/iZ+/n0sx3cM19KymasEhm/YgqA1ke+IBULe9c+/U6tL2xypmowa0gTRormSqZ7pcQeWvfnin
	WJadLHNH5vo3ypQ8Aw3FJeyfkxlkSHxqjJSetnj/lhFxOJLHCPDQmqGVMqePukcUfB13YFGF0GX
	yJhcBMWyER0bWbpBaTthkN83TMjyrPC7q4xae8WwQey7R6eVAVHtD+2sV9UH/dL8eFp7NUw==
X-Received: by 2002:a05:6402:e10:b0:6b7:f00e:5e56 with SMTP id
 4fb4d7f45d1cf-6b7f00e5f37mr1542816a12.1.1794698409123; Sat, 14 Nov 2026
 15:20:09 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
 <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org> <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
In-Reply-To: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 00:19:57 +0100
X-Gm-Features: AclHuK_YVxhIpv6JLzeNAX5mX5IHGfu05WS6uQ-TCKewxE3JKeci2PyA-UDMCbo
Message-ID: <CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJHH9T_Yw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
To: Chris Down <chris@chrisdown.name>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 9:06=E2=80=AFPM Chris Down <chris@chrisdown.name> w=
rote:
>
> Hi Christian,
>
> Christian Brauner writes:
> >+      /* Look through stacking filesystems at the inode with the data. =
*/
> >+      if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEU=
DO)
> >+              return -EINVAL;
>
> This looks good in general, but what the bots said about O_PATH files
> here is real. With FMODE_PATH this is reached for a file that was never
> opened, so on overlayfs nothing has been through ovl_open() to look up
> the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
> itself, and when that fails it hits the WARN(1) at its end and returns
> the overlayfs dentry, so the check passes as well.
>
> Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
> it's easy to trigger with that. From a quick test with a metacopy file
> whose redirect into a data-only layer points at nothing, registering an
> O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives
>
>      ovl_d_real(/f, 0): real dentry not found
>      WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
>      [...]
>       file_check_backing+0x308/0x5e0
>       fuse_backing_new+0x219/0x4a0
>       fuse_backing_open+0xe8/0x390
>       fuse_dev_ioctl+0x53a/0x7d0
>
> and the ioctl still succeeds. A normal open of that file fails with
> ENOENT, so nothing could have used it as a backing file anyway, but with
> panic_on_warn this is now a panic.
>
> Maybe ovl_d_real() should just stop warning when the lookup fails, now
> that it has a caller that isn't trace_uprobe?

Yeh I guess that this needs to be a Fixes for lazy data lookup.

The correct fix would be to teach all the callers to deal with an error.

> The check would still pass
> for an O_PATH file whose lowerdata couldn't be looked up at that point,
> though.

One observation relevant to this patch set is that a datadir layer has no
business being a pseudo fs and that can and should be blocked explicitly
at overlayfs mount time.

The other observation is that fuse_passthrough_open() should probably
check the backing_file that was opened for io in addition to checking
in fuse_backing_open(), which could have different FMODE and specifically
could be FMODE_PATH.

Thanks,
Amir.
