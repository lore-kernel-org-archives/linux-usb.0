Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686762;
	b=AthwmAaL9X42x2RJdBe8paJKZCEwIEVmHPbGzCF8Xye4IBmg4NiYk1dONuYqdDT3UoHE
	 rJeU1fOfr3+ZLBDGc+Dgk/SGGlhVKgd29LcbB8ybLp4k7SJTWMVhs6cokeRnX1WPQXttG
	 Wbq2xkgrLPo04JM6iOUEouH4GB/kRefNbhKCtqCrSRlbR4vrcSVSyF++uEcGxFdKheG3B
	 0n0bJIFoAXZIIcz/3OMy4MuNYk5Oyst9tnyRRnmA8eCi2a1pr9aD++9cyycwG56oMPqTu
	 rfa6182a5I6w5HSJeAITBz2ULqevgfJVXM32jI5xbGa/BFcl1ng6ezT6JFkd/DoFP1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
	b=Eh0tZE+fegXlJcQWr4VKY5dnv/QNWqivXSw2lD+sbFbJbw6fqDW2ig/uLV4LvredpWy3
	 imEVCBYAZVBOeyCaTB0WrTG9dqntAhtYG0krrpPQakOroBfIV/YD5d7fLhJnou4muwfAE
	 2/IXHzeYQIV3hbTE85ypWXi74stiF4Leo7zgFMB45XznRXKVi0hOZTIBdAd1F4eVAp5IR
	 uHEbupQtTofYOYJrHz8L7pwvExqOWG5Q1J1je7db7LfD4GNZSBpXPiv/deGa3QwPKKjIK
	 pdTTmdJdod7wxm5AnNnCFFMki9HApn7TqVSlF0GB1FjAOizjbE1eRlPzSc3EUQ2fxDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WyNKKpAN;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A106B60A3803
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A106B60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WyNKKpAN
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso2719785a91.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686761; x=1795291561; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=WyNKKpANsG5sdrHWGAt+Y38DvSIGt+WnCUyNYCZoBM4YbSq3wCVAHI95jQ8BFTGgLn
         +vM7af/q0i5zrzjZXXnriwzXN4L/RbeBg/iztvO0eyeIXYNiQp/OYlS5LD9yZqr2gKgm
         1I+5A88e/cV4J0nLZfgp0f7sQwj9jY0Q4quBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686761; x=1795291561;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=0UtSCOFf2qwOG2Sm1zf5FGU5ocO09IfshmzOPfy1P3qRDNr/UDnwDUFQpsJAUPn4zi
         tcd0q+P7pTcxnwhN7oh3Q0C5Ix7+jiChoJ9g+GtVgPCvtkRMg//lQDBOvXNueo8L0KPR
         ZGf2eMamo2mQ00Ix7VQz65ktg2mVOyXDrn9ygGX8VA0ACGHsNFHXyss0SDut+kY4/c3G
         8yqoX0xAwZkOHDSt+QfK7qJ5MxnmauEGLoYmDpokMn4nkG5TgIAANgoptULxW8J2EZrw
         4D7U1TcomFFiJ14QMty7+3zIYsZsLgJbxLua6uY9GTnkxZryhVVgKeoBkgCbz/IB1Lew
         BccQ==
X-Forwarded-Encrypted: i=1; AL+hErH2oIzyy+7dczIt0vf3GJXxb05Lg8WAYd2zIgpLVajRC4xDayDKAUHHAvrJnRaaO0RcHRAOod/BUbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kyw5EB+h11Xbh/ZkEiShbYBlgA+1B0/+7AFsAnoRPAwD3oInd
	z0t2K7fkGE0FHM2ZQEFiskURAmTt2+Bxzd1qv4T4rFZyahDVLYWCx1TSNSdGtk8KzEg=
X-Gm-Gg: AYBFou1eXUB0PirP2BqmsdnH1F2xpAeL/oE+HWjhTw/m3HA6O0ahSW5a8oQJ16Q/Vbh
	Oax4kKlJW2rvZy6/v14GyoEouKzQ1I1zqfoaQz9uQW/xLXiwuP5GTdiUCavXuZDBD44R6y9s/yu
	fl+ihmqbErZcbM9BT00H8tobI3+2khJo+H20rv3QU+bweo8koREIcpvJiy4RYztZEORoyRgwtI+
	ZsYuKsIZ8LPZb8iJiS2o1o41vODeUYNh5fcsT0kE6hTmRWWpAEnWyQQ6OtopS/FUKgq75Z4o6xw
	qelHnU75f7jzwq7af2+ad5OSQWlSDfvz4UFWJOUtrH8qtqH48FNKThAFkG+wrxcp9C4rOCZWNrX
	nRPxWcOUNviFCPc7GxlXeXLSBUEixQjaHWMvtILAX1ywJrQLxbo02oSEx84HqAOM2WPv3+7ZxFW
	p7aMDi5hyrho5/Lnv7gKAxxSM8/W3PUIh75uTmSaHbgoSp+PzjTgVxclcY8/ZeDCzZYLAC9TRdh
	cjXHDUdsqwL0pbqYWTbpkyj3gsDoqlTt4ybqB1iG0kzsDJONyA5uQ0sExEgQ4tEZjE3LLbG1P9d
	bmNe5W8DO67MKWeUSAzK9b5Mj2JkSO8rrxjclq/NNq5NMBJCbsBL/t1r26DL5ggi8heXls73Yie
	s23ggwVqEuq4yPim8HMkbl9O9njqweaDR2m0qa4jqvPPoKyAQ5m3i9EQYU2ITmgLgojKzFTi942
	CNMKh/DXLIlhC+rWPOkAroRxl7lZjhO2ZI/3tjIWxl92rSPQeUY2TSgEmD
X-Received: by 2002:a17:90b:2584:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b1b0ba61famr5629200a91.33.1794686761104;
        Sat, 14 Nov 2026 12:06:01 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm5258887a91.0.2026.11.14.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:06:00 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:57 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
In-Reply-To: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>+	/* Look through stacking filesystems at the inode with the data. */
>+	if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEUDO)
>+		return -EINVAL;

This looks good in general, but what the bots said about O_PATH files
here is real. With FMODE_PATH this is reached for a file that was never
opened, so on overlayfs nothing has been through ovl_open() to look up
the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
itself, and when that fails it hits the WARN(1) at its end and returns
the overlayfs dentry, so the check passes as well.

Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
it's easy to trigger with that. From a quick test with a metacopy file
whose redirect into a data-only layer points at nothing, registering an
O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives

     ovl_d_real(/f, 0): real dentry not found
     WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
     [...]
      file_check_backing+0x308/0x5e0
      fuse_backing_new+0x219/0x4a0
      fuse_backing_open+0xe8/0x390
      fuse_dev_ioctl+0x53a/0x7d0

and the ioctl still succeeds. A normal open of that file fails with
ENOENT, so nothing could have used it as a backing file anyway, but with
panic_on_warn this is now a panic.

Maybe ovl_d_real() should just stop warning when the lookup fails, now
that it has a caller that isn't trace_uprobe? The check would still pass
for an O_PATH file whose lowerdata couldn't be looked up at that point,
though.

Thanks!

Chris
