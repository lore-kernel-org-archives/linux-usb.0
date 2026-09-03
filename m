Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5254B715A
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445764; cv=none; b=C/6FIy8kMGFT3tPJf6Nhjv/GtBooZhWQMfKVT95J/BPfXo8VRYhTTDFP3RiiuEY90B5heHJLyhO2i6gbwVEHGRepLN+c28I3cpsnafeEhinmGvTXxbozJFsvSbqv0tJn3lMY1q9oUQzCn3HRv+Ddnw9Xz7vPfFvIVoERxm6womk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445764; c=relaxed/simple;
	bh=Vc4nsG4rCMbc4asB0jvGimE0BiSPYtdgvM6B8UIfOQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEUd54mO6X19tX4TuNgzgCeNUA3tVZiJnDKW9zmsedsEnQwQSy/U4qpSEsUSaapp2+MJL0m+H4CKS/ZOuHfcjvSvcZPgq3ITd0KLUjFLP6osaRYdpP6W9Xi2GGdH9Fdyms9CERJQUSa83pUYO0GHeff9UPoyTsgz/vZtiUPO4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iS/kwITY; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iS/kwITY"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66d1447e2b1so1038772d50.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 07:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788445737; x=1789050537; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpBFCA2vtIano6DcUrYmzhDoETXua24x0tWYntbBUm4=;
        b=iS/kwITYgB9P5uT6vP+QuwPVaEbifajboAg+cpz5nmQaa7fIjwmtG7yDRHTH+QcJmI
         ABQv5w8BNdnxdecG/x3YW8niN0ZTBiaIw8/K1qhe9n4cDjugQ0IEt/TbXBiNHk/cxKTF
         Q/RD4bPUVVmJpIgtqWqgicpwftNhoiJluCNIRQ25mrHq3njx90tbT5SHRgFLNVaO0/Jw
         VmmPC1maSIYsSXAYAuUKc3h19Uoib79mW4kOH7r5BMRZDj0Rz857N2KHjc73NT7QIJGy
         mq/9wQ8OGh8wLo2yxEC9j8+KVV6ChbHxqMhlJeE1cNKWA5KcRfWVtU+LXmFQ5DfFQysn
         MASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445737; x=1789050537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZpBFCA2vtIano6DcUrYmzhDoETXua24x0tWYntbBUm4=;
        b=AC2CUni6QBsE1dW9C3oY6Tjd0sAP9VKYjyMXPN6+J2w7cO1UJ+QTdPp30iayrpp2ri
         69dyIi3jNBitgV78rPUDOapYxnUqhZiJCarZvfTOE5Q1/sAbvFXyl2/Qn4rsrk2TQb6Y
         7q6dNwxePhPX0k2ETI6cACHRsJIX6FvFYV/bQ5hNGczion1gfufoG5JrKNaRzdF/SsbE
         NTuO5fGXOb4W94aopm6gRaJbpu9+uhO0M6ckYqVOtr7ia1QrPwlyB5XvaaDHWpsRXSSz
         LV/9skiB7eacisKFX38WkeLF0VtOxV0g5iO0RKkcaQWp9SvgX32IR8FYc8FD8qnp88Lr
         kj9g==
X-Forwarded-Encrypted: i=1; AKwUvByN58PjhAVBII2g7mHzlcrNOzwELS3fejXhm6E/Ha1JAUOX1+1u6dGreqDK/8U7VT/cMdi17o8wyLc=@vger.kernel.org
X-Gm-Message-State: AFuF++kC+x+C90gPs6T0vxG4sgrM61JdQp8KDT4x2yvaS20//6imKCnU
	v0XiReGWEXKv3nqvOcKi04rdTcEXxXH3mJwql6iHZGYnyXieVx8uT0obbpkSnSAXrA==
X-Gm-Gg: AYBFou3eRsiYYm2z2xi85MqiJVKBKDgNeSaHw5gLKD2pa8251pnWDuG+9V4yhn8qlQm
	rqb2lWHH05G+DI8p3RbSi5VnvSJXi97wEwpGhnKYbNPoZzDApDu1Qn7KmUTKxlJstWzDWV3MiV1
	Y/ZpgSvRXY0y6Z7kT6CmINUbZFhwjVcf8EUM7YIY4hVOw6dh6FWIHCBSdlvYZuo1F4QAjH8nu1C
	kxg7IbXm0MzZF17mQHd5EpIxhKIai6LpFgQ5P1LTa1W+kCkcnMbBoapIBEztRVgxE1buGaByyyl
	BwSD7pivd1qtDC8PWu7teLymFKmMZfFrzWh95IZeWLl/yo6bnLlPvXk6ecZk7RjUaJ/yp1aoyUj
	QsHIbtaTurqMNM9jmBHXRw5ausEZAKb2cRyFndFx92RmZk1kB0RsVhoA+swApkJzQ57itzdrxKh
	KMuA7m4IgXJL8HNcFGKimPhnhhWgZhfiZ8COQK0IQyx2NUjE9uCfhyvua0h8yuLDfkYr625CVyZ
	h2NasQ=
X-Received: by 2002:a05:690e:128c:b0:66e:3f5e:d9d with SMTP id 956f58d0204a3-66fa924b4dbmr2742108d50.24.1788445737190;
        Thu, 03 Sep 2026 07:28:57 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee2ed6csm43888976d6.17.2026.09.03.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:28:56 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:28:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
Message-ID: <de10753c-7504-4b55-b08b-cc8b91cd6711@rowland.harvard.edu>
References: <20260902050127.3767049-1-rafad900@gmail.com>
 <b99e8d15-9031-4d77-b1c1-2bd8cce6013e@rowland.harvard.edu>
 <CALp66yF0MZy9UKo_qGGeekxV0RNMNKZ_foqADVnqg+_YgEYqEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yF0MZy9UKo_qGGeekxV0RNMNKZ_foqADVnqg+_YgEYqEA@mail.gmail.com>

On Wed, Sep 02, 2026 at 07:18:25PM -0700, Rafael Alejandro Díaz Cruz wrote:
> Do I need to create a new patch for this?

You don't really need to, but it wouldn't hurt and it would make things 
easier for Greg KH.  Don't forget to list the changes from v1 below the 
"---" line.

Same goes for the second patch.

Alan Stern

> El El mié, sept 2, 2026 a la(s) 7:38 a.m., Alan Stern <
> stern@rowland.harvard.edu> escribió:
> 
> > On Tue, Sep 01, 2026 at 10:01:27PM -0700, Rafael Alejandro Diaz Cruz wrote:
> > > UAF is caused by syzkaller reproducer forcing
> > > the failure of gadgetfs_fill_super()
> >
> > Just a minor comment: The fact that you used syzkaller to cause the UAF
> > in your testing isn't relevant.  Memory allocation failures can occur in
> > real life, without fuzzing, and the driver needs to deal with them
> > properly.
> >
> > > When gadgetfs_fill_super() fails, it's error path calls
> > > put_dev() which drops refcount inside the_device to 0
> > > and frees the objet. But the_device pointer is not
> > > cleared, leading to point at freed memory.
> > >
> > > VFS will then call gadgetfs_kill_sb() after mount
> > > failure leading to put_dev() to be called on the
> > > already freed pointer.
> > >
> > > Fix by setting the_device = NULL during error path
> > > before calling put_dev() inside gadgetfs_fill_super()
> > > so that gadgetfs_kill_sb() skips put_dev().
> > >
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
> > > Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> >
> > Since this fixes a real bug, you should add:
> >
> > CC: <stable@vger.kernel.org>
> >
> > > ---
> >
> > Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> >
> > Alan Stern
> >
> > >  drivers/usb/gadget/legacy/inode.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/gadget/legacy/inode.c
> > b/drivers/usb/gadget/legacy/inode.c
> > > index d87a8ab51510..3e2bce7543d4 100644
> > > --- a/drivers/usb/gadget/legacy/inode.c
> > > +++ b/drivers/usb/gadget/legacy/inode.c
> > > @@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb,
> > struct fs_context *fc)
> > >       rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
> > >       if (rc) {
> > >               put_dev(dev);
> > > +             the_device = NULL;
> > >               goto Enomem;
> > >       }
> > >
> > > --
> > > 2.43.0
> > >
> > >
> >
