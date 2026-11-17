Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958483;
	b=3q33tOH1C2r4Lr9fcprOLaygjLdxglrJZOSJ01Ag6kgaKFLvycxkpOKVbZg6u7cdZqXz
	 P7aaNvka5snfsNeRCEy5UTRnYkEm753OIZVjJaDVUaFTIozLzclHAQJBN2koj5/NgiJ5/
	 UiQrkFNrgjQMkJwkqKApRdh6L6ILtXLgnw7tGB+JAq83gRu80eh20jrYaOpKmEK5tbI4c
	 BqELFRxXNoo19pBIkjnOZO1n+S+de/LAdNiHH1VhSl621/4Kwr85SbktWTkFYNJXn2Ybr
	 SpfwsBt19ssXZG37okGtrp0LDggIVeEy3eZXzXMHHudu01WupKGGrtcdgN8GmcSTF+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=mxCH98lD8Ul9vSPCZMv+h4ue3Gw/ScCzx5yCrbCmDBE=;
	b=beZ+kzGKVRhKnlahEgx28IAJU1g02G8LHJTpFAmiuU6QU0gKthCuePrEV3yIpUCyUOPW
	 R76TZPqX1qxOgy5Y3fp3l9ZqYd0sJWtvviJB8IUV1eiztDwqL+wrY7HGA5RPFo7glDE9+
	 KvBXkMavw+YvV7eQ6Liib3YXZnoUolJKgxTwcaSYp4b19b/J6CscMQgIxLFnXux6g94if
	 GQ6jePPZU0YSlhiaNqcBzDv/Mfi9CJDGA00KXH7IQKcSkpnNsx2KSeerWv6L21XUrfwBe
	 iIidJq1fOQkDDzExiU3+Tl64LAVtGDb5n6aGF99AcffLNSCEm7XEsqemUGjooVDiozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b="C1/HoDQL";
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE8606A32F
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 23:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFE8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=C1/HoDQL
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94999a08973so41709985a.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 15:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794958482; x=1795563282; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxCH98lD8Ul9vSPCZMv+h4ue3Gw/ScCzx5yCrbCmDBE=;
        b=C1/HoDQLJzzckFRnS+9k64TFool5JeA6PubBeU/laVzL/w4ah7odPpMpBEDO4oTDek
         tzvkSLyjXBT1ae6muzrpU+3lix8bwV+w5XzoROoTQVFQ75pZIhaZnTEzTzkvFRP9MXet
         cswYz9mJhJ6jqtYt4JjUilPe5tWe18DSDwlcWvq99KCO8DgF8mM2v9dS3T/+DCZLJVWq
         S4BilbEvdhkOpMHkOUTOKfcBRLK371Ffu7Ts5wblHKU+7z+VA6XukkrcJsEnIUrr5zDJ
         9evsjeK1bGn1T3KaRJrNNmPDwV+QAIp1I3m7emtneedTTpgn6usGNwt5x6nS7sEasDi8
         n6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958482; x=1795563282;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mxCH98lD8Ul9vSPCZMv+h4ue3Gw/ScCzx5yCrbCmDBE=;
        b=J+JaiCEg6p4fGhk/ND+zVfS03Qh07vRktAsxMPr+It/vSoRz4FwHxKVl0dlGgFLpDs
         IqhSictiMyo5rxIiSUO08wIazyXg1Qt2Kr0GWvtqsUiXsALI+SrndoYe2nFygboDu3kt
         AqmOBV5kttNdzXtCgR+cjXMLut2v2bhEiI6HQfgqC+RGF6lFHWgKubadmezqPp7WZAGh
         5DTj/SLy4SU9m15HAoaZ/fJ3hOptudqhvaHbgmtGgW1Q02chrNtVzBj/JR+p+ywPrsXm
         pW9zVwR74KAXJAdm7hnwkyYQa8SGICazcKupe+MIRqe1RzNpEEGoDFUroVemBCLWMhCg
         4Gmw==
X-Forwarded-Encrypted: i=1; AL+hErGmmXFR5p5lTOTsU63QTCpWe0W0jSykyvoMBfzJmG3lOuHiObh9zPkA6zCBt9H68hoa7kz2ZaXXMoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mUS1sJhdG0NSheuqfLGVXo1Ddcbhd06dklssrdwnP90x+Ueht
	bg20RqWWlShN01vsjME2RcTaNNWfhA0Z/j4SwsEFIoiHse4M411yGl3dqWQt0OT9dw==
X-Gm-Gg: AYBFou1WdxTGAm43kD0bdK/ScUpIOYvar1MHNJ19onY1w4JBTUMDZtlE1BxzfPuVCPI
	hu5tUs1e4puWLHVJtKthPp0gd6PBulxr6Ak2GmgecUdTDFf9o/Nez7Vx0uPlhAcRSvFW6vle8sp
	fcBq5V1YtPl43CG15LtravTbjLv6uuQC59rgvHASPxGkhxv10nontXe8GTZ2XhxlVTkpHOYZ9ZO
	hRPn536xIMm5c30gSYJUA3r47cST7ztYUO4hd++GEhnTafyj6nX7OdDuTdZ0YacybiLjZHH62IJ
	1ryYbWRDd7RR6CzKHTuq+N/R5EOHqrsYjV/OtPLbbCS68OEQfTgCW1+PfGPdmogOGf9teJ93qlS
	Z0WxvCUDJgSFokz0bLZeEC2m9Vr5gOiouNvTRSqpRPhl7d3PPlUSJ4RzzrgYCbCarVz0OnkpT6s
	Z3rCsnZnG5g3I2f61JukunYjA2LtfQiCFSOXdcNoSMth0VMz9Iu8XSuLjVjoKZ/wp+SjoJ4LsvU
	75flQPb9ZLiwizSL2aG+JTvyr+m19kk6LjgO1jdzTi3rT1ptbuNi7IWbnmQrDdZ2J7nuECObVjv
	m3XwZDlukA+0kDjVz1b2B4oQsoTBdHjXCVebdZjnJGOJoqfa+MZF6iZP6sfcj9RIIg4xkk3Rc8o
	tpzQgAyBMPoShgtjYHXHwLEZkbsFmM2pckiwtcgw7HFiW3d5xmSU=
X-Received: by 2002:a05:620a:2556:b0:93f:19fe:e6ca with SMTP id af79cd13be357-9499972c8e6mr213324085a.43.1794958481841;
        Tue, 17 Nov 2026 15:34:41 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm42496085a.11.2026.11.17.15.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:34:40 -0800 (PST)
Date: Tue, 17 Nov 2026 18:34:38 -0500
Message-ID: <7dc91c090b4f8254f8b6fbe2ec36060f@paul-moore.com>
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
Subject: Re: [PATCH RFC v3 17/44] securityfs: use fc_init_pseudo()
References: <20261116-work-loop-pseudo-v3-17-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-17-8cbbea1cf34f@kernel.org>

On Nov 16, 2026 sashiko-bot@kernel.org wrote:
> 
> Initialize securityfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and SB_I_NOEXEC. securityfs never holds executables.
> 
> But securityfs needs device nodes. AppArmor puts a .null device node
> into securityfs. On exec it replaces file descriptors the new profile
> isn't allowed to use with that node and opens it via dentry_open() which
> doesn't care about SB_I_NODEV. Such a file descriptor can still be
> reopened through /proc/<pid>/fd/<nr> though and that's what opening
> /dev/stderr does. The node itself can also be opened by path as
> /sys/kernel/security/apparmor/.null. Both go through may_open_dev()
> which refuses device nodes with SB_I_NODEV raised. So clear SB_I_NODEV
> again in securityfs_fill_super().
> 
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  security/inode.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/security/inode.c b/security/inode.c
> index 0804023676741..edaebf0f1972d 100644
> --- a/security/inode.c
> +++ b/security/inode.c
> @@ -14,6 +14,7 @@
>  #include <linux/kobject.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/mount.h>
>  #include <linux/pagemap.h>
>  #include <linux/init.h>
> @@ -49,6 +50,8 @@ static int securityfs_fill_super(struct super_block *sb, struct fs_context *fc)
>  		return error;
>  
>  	sb->s_op = &securityfs_super_operations;
> +	/* Userspace may open AppArmor's .null device node by path. */
> +	sb->s_iflags &= ~SB_I_NODEV;

AppArmor itself does a dentry_open() on its null device to effectively
block inheritence of open files if not permitted by policy.  SELinux
basically does the same thing, in fact AppArmor's aa_inherit_files()
is based on SELinux's flush_unauthorized_files() according to the
comments.

Anyway, I'd suggest changing your comment to something like the
following, but it's not critical.

  /* Allow for LSM specific null device nodes */

Acked-by: Paul Moore <paul@paul-moore.com>

>  	return 0;
>  }
> @@ -64,6 +67,7 @@ static const struct fs_context_operations securityfs_context_ops = {
>  
>  static int securityfs_init_fs_context(struct fs_context *fc)
>  {
> +	fc_init_pseudo(fc);
>  	fc->ops = &securityfs_context_ops;
>  	return 0;
>  }
> 
> -- 
> 2.53.0

--
paul-moore.com
