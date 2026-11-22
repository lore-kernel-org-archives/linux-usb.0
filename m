Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359210;
	b=bvf5JRZchLK/YrSLRcdNEkQKaS2ppVKKxhRDIY0xhSSKJ39TJzOXd/u+bCLykaGknk5W
	 k3TQzdVcAh4dqAEkV9R0TzI3mqG4CiAODpBtnhjGDsD9mx9MXDV1OgXVRg/SO9SU5jLpn
	 DFG1gIDGcgEyHHXPJurV9FUI/u2egqmrv7RzjbKMnThFeD7T4fYHXnhA1tgJHiODHKbuR
	 KcGYx2ACJGt8EiAhyOLnHL5LESZKo5g2HLX10HlvYoASEv4HJ/oORhRSvQQSevL7WOhlt
	 W2vhza6aTWbwuswT3mxmhCm6kOhoxuKnzaAegw6FxcZZaWW2/gSpRFUQrfNaZ7+1saQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EMg9eBblftcqvgfqSOCJqwI/WbN6M2N5ULmdtflQO10=;
	b=R1g/S//9jTOoLforbhQSG0zIBu5nhsVqwyoxurB2MFAEN20oXJT8lriGeqrnw51nHzDy
	 3tN81dZIkrRj5qAHwZC9Ce6rBXhuwoX7QQYBws0Jkol/JUt2OUsYeIFQo82NCDoTP+pyU
	 kp+5qRvnmHtj4f3kITRZ0jXrIWRrg1VVIOl4ZXzpaRGvgGffv92idwpQ+3y+I+N5ER6/F
	 eS0Gc3DjnzXRyAuRsME2dPaBoNi6BOufWX84JsqeGW2OUSlmjEP79HhU/dfjJlziQxAtX
	 3Zt9hhxe4SRzVLlYnp4Hu85sUp7adb6iuTICLEF5/GCUFSHg35md/RueyBZ8oFjz/WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=CJGTpRWZ;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559EA606A32A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 14:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 559EA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=CJGTpRWZ
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55ade1de0b4so31250941cf.3
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795359208; x=1795964008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EMg9eBblftcqvgfqSOCJqwI/WbN6M2N5ULmdtflQO10=;
        b=CJGTpRWZ7MB0kqT+KQmoAZZ05PqUN8xlrDUyUH+gA9dQc+IVgh7WYUaNUkwrQwZAZ2
         ChpqZeQ+CYR9Awi+y3E04E6Ni2OC5AYQWyEGoeOv+hRt8ClNtUkW/ZdW8jqnJcGZ8tLF
         An1XXfGomIK0ppeaYoOVRw5pr5mzk+24zHERDN4X59UjldMVQrMnHp194pbUuDo5QTlr
         wiC3XOeYPv/hLWZ8h/AigmfQztx0BK7EzHkpRQZcePV1Uqkj67KpHVauF4phFnc/WiQ9
         pKWRwTfkMPfoGr18gC5Khgrq7y+4LGaouaiuYr6v4QA2tA+9VgDBCnJBpMjqHoaRlHF/
         Hyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359208; x=1795964008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMg9eBblftcqvgfqSOCJqwI/WbN6M2N5ULmdtflQO10=;
        b=DUQ2px/HoCp5FUl8IJY6iuD8bjVaNKUtNyXzHJcC909+4Px8Ue9eRPj48oniJZlHrJ
         b/kBxSdDdiwlDZjGjYK0MB6xcqyrVnAfTrxQeGQfRssX8FQ0ANLGtLpFheyHY01kX0dK
         TFcSsOfdifUAthOwI2tTeWY7rKguk1CWUH7SkIfc/dQJ7stRZIh+I6MCBUM4U4XaGdph
         i9dQ7kXOxbypcN24n2KmMCOspjiFJt70GxHoKdwHBfaIn1z5BrE/wTE5rS963p+fv70M
         FmLkEYLxbdptad0E0Onq+pkRRY9ARuRwockrCN9Pm5D7ls/2TvgyH3FlPklmskUc34nB
         FAGA==
X-Forwarded-Encrypted: i=1; AL+hErE2RMksGEj3ASdq1mg1ADK3+Mi+D5bSGIac6WEwmBPu/oQ1EGQBoOtXHHllhmGTlou50vF3FrLf1FU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ibK+SyHbMDVtfGiY2yDjM9UrSuQZqxVJbY0H0feyhcM+KPPsf
	3HMO+8IngcPWqrAkD9G/BazH8j/7mzqzt9Jmo81Sd3mdDrqsGc/12QnjRY2PbMKjaA==
X-Gm-Gg: AZFdTZdjTURKBakRItgA47xjbgzYyZOX/DkLoj0+wi/wD2YaaTLxHqkdWlnZJyL8LWr
	ua7gwhOHwtIB4xLQMP6TDqvOllCCTC7A+QdCFWYBPqHJ3fhdU2fkGVmIdGCLvxUakKKa5+EefO9
	gr+n2NK3Cdb4IJbZ2pj5Z8A96RHPRNL+baOymh7LxbiTXxVZtGfK2/bs+kZ2Zy2jN2XWyhayziv
	dA7U4k4atztWeZ0AO49Vn5yto9XbRuL/5zUXK9K4EcrsYEiKP9/J40+r5pZ/5jwq9stiMnfpU5O
	GIHmy53YTAtq6dQbmWNjwz83lFzs9Y2OZHw47mHMcWQLeRd9O2bOHSe9ntJYV54cpp61kooViYj
	ATmk/Eo89WH+MKph6sHyvsR8EQbCLnNn3WBQP0JMGfiDq3vY13wGXoeRBmeE2k8VVXVphVx+NYq
	OuJ2IQB2fEbnbfbux6Bmf75EIld9pVC9/Xy3ZqzlRUGzbPdEVX2EV5Ck7L5hG6181zvzIlO6LHW
	umf3xpobJzhnVz/fTteD1FjfAwNTaTjPqniDSDbinwCECm++GOzear0dqNQ8yRGL8hrT3Ld2iBY
	LmuPi7fJDQ6ZbKngaOnPfIFnHwJRnw==
X-Received: by 2002:a05:622a:514a:b0:536:61d4:cc6d with SMTP id d75a77b69052e-55d76af2778mr156555621cf.53.1795359208144;
        Sun, 22 Nov 2026 06:53:28 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm78713746d6.0.2026.11.22.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:53:27 -0800 (PST)
Date: Sun, 22 Nov 2026 09:53:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Arbab Haider <arbabhaider649@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [usb-storage] Re: [PATCH] usb-storage: alauda: track
 media_initialized per port
Message-ID: <ac19e630-f96a-4144-88dc-e3f22091c7bb@rowland.harvard.edu>
References: <5d2e1310-88db-427e-ace0-c2a0590560b1@rowland.harvard.edu>
 <20261122080550.2181-2-arbabhaider649@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122080550.2181-2-arbabhaider649@gmail.com>

On Sun, Nov 22, 2026 at 01:05:51PM +0500, Arbab Haider wrote:
> On Sat, Nov 21, 2026 at 03:54:57PM -0500, Alan Stern wrote:
> > Has this patch been tested?
> 
> Yes, tested in QEMU (x86_64, v7.4-rc3 with KASAN, UBSAN, dummy_hcd,
> raw_gadget, and usb-storage alauda enabled). I do not have physical
> Alauda hardware, so testing was done via dummy_hcd + raw_gadget:
> 
> - Before the patch: running the syzbot C reproducer reproduced the
>   UBSAN division-overflow / divide error in alauda_read_data()
>   (drivers/usb/storage/alauda.c:986) on LUN 1.
> 
> - After the patch: the syzbot reproducer passes with no UBSAN, KASAN,
>   or divide errors. I also verified additional raw_gadget scenarios:
>   * READ_CAPACITY and READ_10 on both LUN 0 and LUN 1
>   * Media removal (status 0x80) followed by re-insertion without the
>     0x08 media-change bit and READ_10
>   * Media change with a failing alauda_init_media() (unrecognized media
>     signature) followed by READ_10 and WRITE_10
>   * Recovery back to a valid media signature with TEST_UNIT_READY,
>     READ_CAPACITY, and READ_10

I asked because when syzbot tests a patch successfully, it provides a 
Tested-by: tag and asks to have the tag included in the final patch 
submission -- but you didn't do this.  Did you run the reproducer 
locally, without using the bot?

Alan Stern
