Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE2D1C5799
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313803; cv=none; b=ble0+U6HzVTR6OPPo0f8n9n2Zs6jcO74udWo7NvEczpjfLO18FTBQlK7w4laDjGqIiejY7D3Q2Q2ig6MFX5r2iX4tNaWP2tjbN4OeZirE7gtvLJkEaUMsLxlcso1XFgi4hABzaeaIZqSg6IfhKxsnR1XsVKnVGgcgC6JYO5+rGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313803; c=relaxed/simple;
	bh=YnJqo6tr9iMLVf51GkvRn+Utexlsmfqdo9WwAOckub4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J153+UDLag6I1SYS3D9dHClI1b2xVycJ/OCv9v4h4kQ5eu9Ma7vi1k4fPnjxjy7UtC4SVIG7wjMW0sL9SnU7nPJtFVw0o81L7uoGzbuhQ5leYW/Ipmrb8h6iwJy3CgKP0j3qBIWufSgtZyI+BkcfAdt9ztxNiLInTy1kyuB3rmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=goR1AICS; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="goR1AICS"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cd96389efso6603686d6.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 18:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788313796; x=1788918596; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJNOkrjAPDzGzabPglL1tb9qnH461gZVQU7shHOjP04=;
        b=goR1AICStb9dzkOBM+LICNShaidLSJNOI8e3dcg4RvfG59IEuBo9jI3GOxg4GCt+BV
         RTrdzmhGcTjLLC1gf6Ww0UkuVDslYjMvA2kFbBeqs0s2f/sOS8dyt5dUWTLt4QQtxYK/
         Xqhatr5fPIzQcM9X3TuXHviSpb/xw77Q/t+mQaZ07cqQLtxj0LXaX5AYz6vnilYRz2/p
         WbIs2og23SWhit5a+Ir8nVTgjhdmNlABgWNJkVRu2L1Ms/UT2Xv/SYPKcy/vTig4OEZn
         8fOQUPEo2ly+8tOTRURUaHyciKOouplVdExTzyWEjtpF5IOW0Gsli4To6ObDGMrYStDk
         ZFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313796; x=1788918596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PJNOkrjAPDzGzabPglL1tb9qnH461gZVQU7shHOjP04=;
        b=V9RxDLLexEtfV/kUzwsv6DJtNzmeu98y8v3g0f759QInCYDruKhw9/1rTOQgaFUPRE
         dXRdeNfgdB3hsT0twKJpHP+Dv8emgekhsegE0bveuNlp7Kh4zQjqylfwL+u0F0EGvXn9
         2VYfbs8bEVPXgf/asgalrtxgruLZyUqRQfAB/qsQXutZHRKAYwAlzSe6YmX4iN938jKz
         FfHa94iBb3daO6hYLFWZrItFdgblorgxxatfcs3KNGkmPaZvENfl04BO80VlRVbGJBz4
         bUmUKarPizITc6FlZOu2OB30Tgq1/ucMf3pDchBua2MPko8E/JyAh2dOXEirvmYngMKJ
         Xctw==
X-Forwarded-Encrypted: i=1; AHgh+RrMjdx2pwrn3l9p7a0kgk/McMgd1FMJvTP0bDbTppv5ohA7FhjoItnY6zB9ZtWOt+oGJ4T30XhCC7g=@vger.kernel.org
X-Gm-Message-State: AFuF++nRfAdBPann0Cs8tO0pyx/uA7t9og3mphggfvDC9R8ypIjSB8Kb
	iMj+K9O0SSzaiQOPoXcuta7iLn0EIWivRW/icE6C4sUY+wD0dNRJzkS8UwhVX//H7A==
X-Gm-Gg: AYBFou1B+DUsicbc4WkEXDteNbSQj5JEso9QMqtbb4+H50jYyEyBF+9EYN6LAsiXlD2
	M3KVey88ZrMEuBlXQFZaJlBn7EuTM/Dg3/L7YIGwed0p9grKf834IsBWrHUTtPkcEOktWTA1YfV
	gTQwBkCU6ejj3NCyQY+X9QPropXTacvyvurGn8Ut7jKvUzpGKvMQN7FFRhubT+9VJw1is1ZMiVT
	04/h4+91bVPVI54aS5qRv0egjNkY24KGhiSG0l8XcMfGAA7adua6oDmEt34EjBuOyweC4rgyCWR
	j6TvQLncbZBJe77h24DX2J9qeb1530BVb60JcgK7zaLAqcHwY26zoeUb31fmrb4kNP0rCAMXklV
	IiZXrcrzo6eyGNqX6XZpC/VBF2yIBgfUwDoDrdd0gTLlmnkIU1WjIoQ3lbaS8WpB58sq3yEJc3I
	Zg3I0HORkpO2ABQoKGGHP7BlOCWoc/IRiT57SlXDCoPLHJ7YiqVWFFsaDQmLZ2xA==
X-Received: by 2002:a05:6214:2b9a:b0:90e:95d0:927a with SMTP id 6a1803df08f44-90e9f20ad67mr27141236d6.6.1788313795865;
        Tue, 01 Sep 2026 18:49:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee24af5sm7401166d6.12.2026.09.01.18.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:49:55 -0700 (PDT)
Date: Tue, 1 Sep 2026 21:49:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in
 gadgetfs_kill_sb
Message-ID: <dbd20921-088c-43a6-bb91-0b7064f87a59@rowland.harvard.edu>
References: <20260829011901.325379-1-rafad900@gmail.com>
 <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
 <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
 <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com>
 <211b5666-1777-45b6-b1dd-9e85276900b1@rowland.harvard.edu>
 <CALp66yFMQ+GTh=3iXWWMTcvDwc8e5tR0EpnmBDt=24E9Koo-wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yFMQ+GTh=3iXWWMTcvDwc8e5tR0EpnmBDt=24E9Koo-wg@mail.gmail.com>

On Tue, Sep 01, 2026 at 04:12:17PM -0700, Rafael Alejandro Díaz Cruz wrote:
> I kept going at it and finally realized what was going on.
> 
> I added some logging statements as you suggested and
> found that my 'how this bug is caused' is correct. It does
> come from calling get_dev() after the error
> paths, and the simple solution was to move get_dev()
> right after the set_gadget_data().
> 
> As for 'why' the bug is happening, it basically comes from
> the reproducer using failslab to force kmalloc() to fail inside
> of usb_ep_alloc_request(). This will cause the following
> error path to be taken:
> 
> dev->req = usb_ep_alloc_request (gadget->ep0, GFP_KERNEL);
> if (!dev->req)         // This is true on failslab
>      goto enomem;
> 
> This will then skip get_dev() and go directly to
> gadgetfs_unbind() -> put_dev()
> creating the unbalanced refcount.

Well, yes, it was pretty clear that either the usb_ep_alloc_request() 
call or the activate_ep_files() call had to be failing, given that the 
unbalanced refcount came from gadgetfs_bind()'s error path.  The only 
questions were which one, and how.  With the reproducer introducing 
random memory allocation failures, either one of those calls could go 
wrong.

> It was tricky to understand given that it was failing only
> on the N-th failslab attempt. Luckily gdb could do all the
> things I needed.
> 
> I'm also happy to share that even Claude was not able to
> figure this out and could only confirm this was the cause
> after I pointed it out.
> 
> I'm certain of what I found and will proceed to create the
> next patch with an updated message.
> 
> Please let me know if there is anything else I should add.
> I'll wait for your response before sending it out.

No, this seems good.  Make sure that your patch description is both 
precise and concise, and that it doesn't presume the reader is already 
familiar with the details of your testing.

In fact, since you're fixing two distinct (albeit similar) bugs, you 
might want to split this up into two separate patches.

Alan Stern
