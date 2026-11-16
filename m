Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859451;
	b=SUmbxN2QpfusnDMgIscCQkCh5cAJivNyYMbTY66iQ/zZkWcFiVjvgyoAdjQvEpIEOG8L
	 //soccem4ZSjaLlDecSfi6MH6ahkj+urnr4sbRUrTZjPIVS+D7Eu9p6mu2s83dpT8jQWw
	 tlhG/5euty+3K4scMufbmxA3Uh7PD9pjpkHzQ3COU1ff4IIsO7DHHmxYfND9OSs/rAynW
	 bZ3UnUVe2+lirRj9oYrLEvuRiX+i3LwfP665j5sZeVfg3jJOWLB27xSKgghX+kx4igFpK
	 ij+Rbs1dYZvGHLuExblz192pNaesSR/cyjFHVHCquOCfb8sTSJ+lTGztzdwShTvtWzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
	b=Ysm2QTJBUOiL44toMlAY5zQi449Kh0rOo2624VpzIl7diNgReLSh5itb8/6i0O9mSIq+
	 BXQQKRavNr8OTfmrE32rt9J//VEE9Pq+QbyauwymyIY2d01f4/cC60aSJqLJ72x2gDeh/
	 HNqbeMgrxsfwui2vr2FyFp8QKkDE2RHEjur1Co4mNBlK/OCsKpr/xgJLRQX9LHUjcHdFy
	 lCgy5DRUiSS50/e1IhvmwwXYIxtkt2j1kViYaPxUWa/SudwA40w1/2wIBTaNhOtMHt5d6
	 cjXHRQgtzDL5YMFHHhQaQIHyacFaHoechtqve5doEmcw4ri7xwvKkeemwzorNp9Rndw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqDx80H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DDD606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 20:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24DDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hnqDx80H
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1736449f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 12:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859448; cv=none;
        d=google.com; s=arc-20260327;
        b=n9OAGfVG44G4UIAzqRki/HHXFAAH4LI6IUOTi4ndTtiij0YRQSNJIFVIIAGt9XA8uI
         P1DQxsRM7tjZL4xxxaN38scVpFx9Sbx/9V3/ppYrg9QrAzzZYXzEyDtcRgxymRS9jkCK
         gWKs3K77/cT4ryTy8OOQfgylnxJG92VsIA7HfctE2wdjnmE1RxsSZQf2Nj5kWhBcaP3o
         Ngg+n/Nb+bhQB+fmfDnow+kAjg54x/5wjaXWUhPAcmKCROQm/dGQz8jKimzOPxyPzOUN
         SwIdR4CtNf3lTD9g1U5dKfEJk6R7WwF5mCbXMClAHDpO5ixzcC/CAcSoGmdi/m+p9NxS
         DLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        fh=zXyIzIKBFuIHoXWfbCX0yWFuZtaSCaAhUecsJ336itA=;
        b=OCy7viNYo1muFGyDmiWDrtUhRzeRd16VMZqehdSpwJMhLXxxiY2y6/pz9wOyHL5UcA
         ZGKpNVmtWuJF4/fS6NH6WnLHdjo0GbaH8SD7LglSqzs7dRZvfOo1Iai38SrwHH/5f/Nr
         c7NcOxUZmBmGiJW2eaqrUGIINAl/x8VGOsnwPbMVIkIZUYEGWXWEnwHqZ/2/cTAAdR7j
         CfjI0F8Ex09fmITET/HACOSNPFxVpf5uVpPp2vdPO6bmUnJEYuWqfcxMRrt1nysndFUn
         lw3dYhD/JGr1uawZLmKBe/54icuAhVpASZ4iKtLnCEUiwXSP5kfx8FmOXs+M33VT1kMe
         azmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859448; x=1795464248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=hnqDx80H1BHGMZ+jCw863LQE2wm4hG6wTw//ziQNWkZpZIjdyNNCtFJNcbykSvuJWZ
         RrqgQGru9l+9Rlw9NCoAO7RXSeH6CHzRwb+h6TsbT77V+vTLtC7o5AslWzWJ8+7yhciq
         sbJxN7Yoz6y6VYO91QUyEDVlXVHt5e/uzOZriYhKEljZIduQH6pNfhdOY5sHlJFueOxf
         bN/uTLfuNBjnHaTZ+WukZQS/Wa30tWyiKsfqEPmOKtkcPCgN1gGIeLsa9pfco/3ZvP3P
         koo3Bb9/+esUnHdHS2hTd5qtXE/k/xctadMJUuU/zchcL0VDKvTRNofZgdIQ6mLOou9W
         X5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859448; x=1795464248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=SX7+sQAS8oP1nU7PLFoT1XNZIVH5xN5OB95/d2kg/pCCPOnZo6+B2mUXJ98PsHidZx
         ss+IXcUDxRSQW+WTujEITPni+WTC+OA/e47JXVtLdsKdQUmpd64AiZLQlZVgv8q4Ik4+
         2dUBOYcWb/c4SVn3mAvi8QAUU3KUAme04pppJrmHDTtpAiLDWfkGj9zzJSYS6JzmlhFu
         yhtz3N2mEod/r6ntNWr67d1Sf1bpA8g9HD5BWjsfobKYku8wzsly1U+You2KYxmgofuh
         RJ5Lk/QBdU/FBtgBw90UojSk8Xru+4FyxqnNXOKJn6HS2jy5yjoF5RryCWwpb8HBmkXl
         /lAA==
X-Forwarded-Encrypted: i=1; AL+hErEa5Xap93+iFEzILyotXNBLRp59IF7snabaE/6l+JoB010Kh/PaBujyMXtWhBAi4mnKDSvlxNxZ15M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jRB6S3IQICa9NO4Ld3BCI15HeX/nEcgKwYMvTBvblVK2tA04u
	IFMvGCjDs+K2LSQzTd7QeoVcuXx4egeHUqCUsOQR1hpG6UqFHet9d12wHPe0jPl3MctHrjRL3KM
	+hrtrrF5imKG4k8b4+cA24eETjOf4gUQ=
X-Gm-Gg: AZFdTZc6ZoVPi+By3tO11nsrLBdV07l0DbUvKRb85B/WiZkRQYe/grp5N/kr1spuGDp
	FHxaNK+Xy7UCN8Ca0VGXZUfZlcJVMDn49ZBFNlyuafPsrMzwE3/7yK8+5PsyiyZaOB/0uNlnc5e
	Sslwo538iUDw1e25Kk77sEb0FiCTpuZqSFQZhDows1lFfax/thRUDQeP5QFkKxV0WNbNIkch9KY
	cYea8NU5vaEIVvSROTOLFPs40oAM7KCghBrgE9LZ+lq4WKGNTCXKOaVsM1k1suIGpIXdhTVmyMO
	38BUIzfMl+mGtxhOkNrpEvuI94VB9RTsoxLZY0nO+SEavpk/ANpJfWZbo8SUzYZipaEApP5S+dZ
	8WWd2XPoESWXk3sd4kk/oV8bPChMO777QIwf2rC6Oi3bGECzZ0QOh8BLV0l8PgfxA5Num3xG1xx
	ow12RuDfV3+dtBd94vd7Q=
X-Received: by 2002:a05:6000:4692:b0:491:3fdd:af34 with SMTP id
 ffacd0b85a97d-49d61c80db3mr13343868f8f.36.1794859448335; Mon, 16 Nov 2026
 12:04:08 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:03:57 -0800
X-Gm-Features: Aa3M54q6P4M0RFDCKQ8HHGNCWJafItTSPdWR1qNwVGtToDAv2VOv8vDfWHzYR6A
Message-ID: <CAEf4BzbLFVawibuX0wk=8uzy0WZSYHbkgK55d7rqLab2qAM1Fg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 09/44] bpf: use fc_init_pseudo() for bpffs
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Alexander Mikhalitsyn <alex@amutable.com>, Chris Down <chris@chrisdown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:21=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  kernel/bpf/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e1..57cf3775c0766 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
>  #include <linux/namei.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/fs_parser.h>
>  #include <linux/kdev_t.h>
>  #include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block *sb, s=
truct fs_context *fc)
>         sb->s_magic =3D BPF_FS_MAGIC;
>         sb->s_op =3D &bpf_super_ops;
>         sb->s_xattr =3D bpf_fs_xattr_handlers;
> -       sb->s_iflags |=3D SB_I_NOEXEC;
> -       sb->s_iflags |=3D SB_I_NODEV;
>         sb->s_time_gran =3D 1;
>
>         inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct fs_context *f=
c)
>         opts->delegate_attachs =3D 0;
>
>         fc->s_fs_info =3D opts;
> +       fc_init_pseudo(fc);
>         fc->ops =3D &bpf_context_ops;
>         return 0;
>  }
>
> --
> 2.53.0
>
>
