Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657339;
	b=ccOR1zhi2FTCBaWHAfstKI0XO9xUTKVQlHJn3ThHUa0bICHSPy4VnESrBPMacgMTsNw/
	 EmC36x2Hn22Hmm74nj6kbRLBNCW9y6HHwRpenhUl7ykAO5qZqfx2Rwa9QKEvYxtuHaJGd
	 ueYOplcvtYm5/wSnS0FexVUuSgnAY2z3sTwJOypwhm2kL8uBFIrQQrr5mJXzJmVF4TUT1
	 lfFK7RStvry+Y7SokWppgD/Xxno8Jkp8RlS84BDyloVbB/W87zo68fZa5XnvcIYiSPgri
	 +CDOlvH4a606qoL7rLGBtlpCPrDWjD5vdHnCly/BunpCTB3LGjRg89JHoP21isa9Ypw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
	b=rmjicz10JW3bACrmDPQPLhAKSMQ/kFoMPqczI2veSvotNdayCf0k5CHg7qR+/k7eFTGZ
	 r2uefEW+nvBFwB6AApsq7lnzIz4nzcrl81tE71uY0EnG1zZrGcrbwrBeQpuStHOiimoqY
	 dIFoTrZi0AYRlVrIkDaF7NJhhykjmuuW+OsycT7BifhX+AzS5ppO5OsTw0Xt2zlWMRl5d
	 WG9fW8LDGu7/Fx10DX2YTAbpYhffgBfHiJn/t9/+iOWRDIj4xu5lofcE/bPPPpm2y4itp
	 DM/Oy/oeM5Hj/0eRDaQPXh/p0I1KcEDI+CeL6SwXMX6GRpdc7WsC5Ra/b5REURhKqtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrTBjpIE;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751E606A33B
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 11:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7751E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrTBjpIE
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so132867966b.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 03:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657337; x=1795262137; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=MrTBjpIEXzsSZaANjc7oExJhwGnF+j3pBQoJGLV3AozjECewWnT/dOn8PoCfUIeYGI
         mRgldWBhVoyoY4kjpOu/TkcCPMpetn8bMN74Irqnk0JnK5MAQS777TE3iVfENO0qNvUE
         8qb82pxhdLikkA/6tATGUpByZMee1vHTbdl6A6vtosorr3+hE9wD/mpuH76lS1WAZqyn
         nUdTyabyG8UAyWqGnpYJGfY62DgpvBldD5kNADP5MARyaYxmHHJYDsQkr6qVKrnaldzF
         KHIyaxdpU8Pcl80WjVwUUXXw+yU81KD0D8RdN7wE6Dhf//BzElFXAKq/AgQBu3vGzFII
         7JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657337; x=1795262137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=M+BC7AgKsDdMSdH8QV5QGlPNrBbY1v5U37eW3cy5sgB6h+vOrGZU0ZhOgPexw4g6fj
         PfU0Xyg0sToyhFieSxv5HjhKEd0x1aT9PLdHGwmYRK9dnAEAa/lvLRB878it47fC9Vej
         wgZ3/hiHk6RBwh7M7dtJZwdKV7rvwgFXsf7ykoRZymcWNHPywwzH0t0IzUDkjI2tcI0T
         X5W/v8RelO7VvRB9yA0Y+Q9595RoaVml28B7YNQqTn3QlfRVPu4OE1ldZh5U2hbhKkOl
         q+cRPrBQUHGdRps/RFi1c09tpHYAkBTiComA6Agy/UmKIqZTm3YPTE88sVICr2TGO7Zr
         lO6w==
X-Forwarded-Encrypted: i=1; AL+hErEAwAbvBp0Aijat/2UPSlpy29n2lZcjC5lk3bMMNaPbtLMdIBDd2MUYbVNH0dhQMZV1Ew8x5S6JbfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uelSre5E/7IoAvHRGpLP3lDiUpDESpZI0XzVaPl30l7YocBtG
	XVGNVletHBUR0ybeEj8bB6Ed/AY0bRLJmC0WoNAztSgdrBovpZ4HN+uH
X-Gm-Gg: AYBFou22nlJi8Y0XtmS31a962DmHHhD9sQOsjd/nzEffIBmxX+htc1gvuehWnXs7XZ6
	DNEsEGQtyZsckF3b7aE3ag1MZiJADVyCdr88+mEhqeTRwjeT8byMGkJwN4f7tQZsU/GmrchIidn
	jbAsWCljMViIKXxkxEdUel/9cnww/BYLPNhW+6npFgF3iWIS+CwOHOZJX7qEA1dWXT3YFdmxLJi
	YM22IeJkBcvxGdBr2vIcRiRHsa4bab8t+6uzAAXVZROYbmnpKSuRU4FOf23KWq6wJHbtELMDVgg
	e1DbEpDd+zh6LfbIOQ218vEVK4hN7QfhHz4pxr+JFdKKwTI5tBhM7UH3oRzEiWQlhMvoopUOlrR
	KOKionfRj0o2tmIR4K9fIcDn0P3soOb8veGKxTpVGEHyqfy2FHT2ETEByTuk78oQC7v91P3A8Ra
	U5c8745AFuazKUDK/MoMmg7cojcUinTUyDGYWlnbzYvmqsWNnc72MtQN9ue0uJxszvyub+lRFl2
	kPqtEWtucX4ACzpUC58rbRV+ifjt4GzL5idk2uNoIXJbToiz4mm/WnxVpztdKETKuLT+dur/B1W
	q/7Y+JVzGj3efWZZ7J/ZaoPyNYGbcqPYcfxXQni8tjv1G1CdElgvIgLTNmUKrSPDwleovdJUI1X
	MMud/ufeNxpI=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr441592966b.16.1794657336589;
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b41f44sm206223866b.31.2026.11.14.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Date: Sat, 14 Nov 2026 12:55:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avhMN39TECaur0sS@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
 <20261111151202.GA11391@lst.de>
 <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>

On Fri, Nov 13, 2026 at 11:25:57AM +0100, Alexander Mikhalitsyn wrote:
> Hi Christoph,
> 
> On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> > I've seen setups where people use fuse to mediate access to sysfs
> > sysfs in odd ways.  No idea if that's still around, but if so, this
> > patch will break it.
> 
> 
> Oh, that's painful. Do they use backing files for that?
> It's a relatively new feature in FUSE...
> 

Very unlikely that they use FUSE passthrough and if they did
very unlikely that it would break their filesystem.

The API for fuse passthrough is that the server requests to setup a
backing file before open via ioctl and if ioctl fails (as this patch
does) then server falls back to non-passthrough open.

The ioctl can already fail for many reasons such as MAX_STACK_DEPTH on
procfs as the commit message says, so server needs to cope with the
fall back.

Thanks,
Amir.
