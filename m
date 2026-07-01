Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D62233943
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 02:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782871993; cv=none; b=qFPFfUTQQ4+BwuNPOqmoqkaS+EE5nZERx0Pbu/YMuyHldcm9O+KoU2DXleQuYF8ffbuYbuBih2TuEwdNVJa+qY3k6s6av/2ktd//RtOJHU3lRjWWemNbHDmKN7vbROohAwgxe2hXhl00CRORn7uaI+2g3XRLIotQb8CjfiWLR0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782871993; c=relaxed/simple;
	bh=pfeyeSx0jbasMZ24QqZam7YXmS56pDKO/ilMo1Rtil8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5g/oCGTRg8ijwjUwYdCLk9OqLSlVZ1TykEHuWjpXF/FTaISGhfGTN8i3x2xIs8OIBqLfTAqyk6mUOuaBCguDWU+bcqVpRwDPT4Z1UxxbFcFo/W1u7Ves2BoZVSUN++s3yQwUZOWWfimrtxplGo3Uyc8KgOZx1KcdrAm+H18vIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=UNV+pXg8; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="UNV+pXg8"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e6391b114so13758085a.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 19:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782871990; x=1783476790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUJnJX7YQ/geHGK5pHOPcpLdubmqLs0Ocip7u8Mfbcc=;
        b=UNV+pXg8o9bej0qgIItNlsfofYQkUIRqLJCVfdp3L0FpczlCaQh8REdp7kU8rk1uOM
         KF91ISpxpYRtLE+RHZxHueQVuvAHaqe5fL3OSZkxSVWRWppuwTtNibyGpQ3/i/H0LLls
         2B4ZQJpiCBIIuodJnDE++4G3c/KhJ7Zt1Hrct0UK7EFL2rPopCKifoTrtC8Iis5585eO
         6RQvFpRkTrzH8LQkdqQXwZ2EVaPhuYyXfx6i3wtzri1GL7t8EiJ0XljOavigCSUJkKyj
         dRph5KV++mtNkMYpA/2PD7/lZDTKol/jRFxpgTsdjMfFhA0XDevCNexL1FSDOH0iQhUk
         kZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871990; x=1783476790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aUJnJX7YQ/geHGK5pHOPcpLdubmqLs0Ocip7u8Mfbcc=;
        b=dYfgWXffEdWB/8hd70dOHDzPknbNaWLYtClCngIFWgZTYd4rSws+cHZ89hygxmevq0
         Me8jl7EAVXsAtXP+OSm6WeSzfVtGfQudVkV8LlQRjqqxleJ43+51G8y323GLJu2BZlMR
         K08jGg/ZVftxYuN0K/dL1TQJwIGAw5EptBU3xH3D4v2xMB3fKqY/Q8NWgNR0cq3XbaSz
         9EvfFaHdSdkXeEHcnzm93vdbHGs8JKMGHks69TtagByvCLPCfUBrWJ66R9N1WGuND3/R
         6cRjU+W0ZD2agXfuTUM2Ot+oQpCDxwXBBkG/EEyYtHgeYkbL8H1TDLBczOLC1abWItCC
         Yklw==
X-Forwarded-Encrypted: i=1; AFNElJ9tap06BAsnxX5FGWlU48lOFBYb4Zy/93vtvHMPJKbMiDKxq249PAccrRtsJ/SVvqFDSLpsAJVvgKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTRbZHmeo1iArUfifvA/4/iUGBjZTwSL9e9PkhWwrQbUE96UR9
	24XgLt68sLIz3NVMQsVr383Q7TfNdcDIbcG38YLD/qiiMkFc9oMyTSmqZ8pHItFbu2MiY5tMQuu
	3YH/67A==
X-Gm-Gg: AfdE7cm+klu5r8CxrneMH8hVH4KNgVo43Z9x6yy1pwoCF4OLSsxW0Kuay1z0oTfDiMa
	KJteN7R4+mjrDiAZUfLuAb9l9jMEwEiJ0McwdxLvQNjpGxwuPvXVPfawEzBRZQaO/LVe6RLWA7v
	m7+X2fmCyWOMqJaPoPby1H6wenOpfwSunJOeQ8oO2IXzwlreapEqvNAoZx4qTRWPfbdKZejFgL+
	6pwvm13N1ZdjFKlNz2eb/r2mLVyODsQ0kkJzVCXVNSb3gzsl0GC+I8Fgya03BiQBGict3LGImnA
	CTSn8KDS63IZhbqDxg7OOx9Xhiv/NAXM19sfu6voylGSMm+SvbI7CK+mgXeFVxIVok0dCA538eP
	vDCH0LbeBMzRy2oDVXG5JUQKTgAdJT54sPY2dVQUrEGNjbtsu5Q+Sn+nltiIWwCTm3u0t54K4pa
	oF4h2QjH0J/UudEM0a6vAw5PQf
X-Received: by 2002:a05:620a:414c:b0:92b:6805:917e with SMTP id af79cd13be357-92e62837015mr956498285a.70.1782871990228;
        Tue, 30 Jun 2026 19:13:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e621410adsm435923885a.7.2026.06.30.19.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:13:09 -0700 (PDT)
Date: Tue, 30 Jun 2026 22:13:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?B?6rmA66+87ISc?= <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <2d4a91dc-037f-4c31-8ce1-7bc840d42b0b@rowland.harvard.edu>
References: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com>

On Wed, Jul 01, 2026 at 08:08:34AM +0900, 김민서 wrote:
> Hello,
> 
> I am reporting a USB gadgetfs AIO cancellation bug reproduced on upstream
> v7.2-rc1, commit dc59e4fea9d83f03bad6bddf3fa2e52491777482, with KASAN
> enabled. In my test environment, the reproducer repeatedly triggers a
> KASAN null-ptr-deref/general protection fault in ep_aio_cancel(). I also
> observed an intermittent slab-use-after-free at the same dereference site.
> 
> Target file:
>   drivers/usb/gadget/legacy/inode.c
> Subsystem: USB gadgetfs
> Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> Git head: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> Kernel release: v7.2-rc1
> 
> Observed crash:
> 
>   KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
>   RIP: ep_aio_cancel+0x47/0xf0 drivers/usb/gadget/legacy/inode.c:455
> 
> Additional intermittent UAF observation:
> 
>   BUG: KASAN: slab-use-after-free in ep_aio_cancel+0x25/0x90
>   drivers/usb/gadget/legacy/inode.c:455
> 
> Relevant stack:
> 
>   ep_aio_cancel
>   __do_sys_io_cancel
>   __se_sys_io_cancel
>   __x64_sys_io_cancel
>   do_syscall_64
>   entry_SYSCALL_64_after_hwframe
> 
> Root cause analysis:
> 
> The crash appears to involve a race between gadgetfs AIO completion and
> AIO cancellation.
> 
> In drivers/usb/gadget/legacy/inode.c, ep_aio_cancel() does:
> 
>   struct kiocb_priv *priv = iocb->private;
>   ...
>   epdata = priv->epdata;
> 
> At the same time, ep_aio_complete() can clear fields in the same private
> object and then free it on the completion path before setting
> iocb->private to NULL:
> 
>   priv->req = NULL;
>   priv->epdata = NULL;
>   ...
>   kfree(req->buf);
>   kfree(priv->to_free);
>   kfree(priv);
>   iocb->private = NULL;
> 
> My current understanding is that completion and cancellation are not
> effectively serialized around this lifetime transition.
> 
> If cancellation observes NULL after iocb->private has been cleared,
> ep_aio_cancel() dereferences priv->epdata through a NULL priv pointer and
> reports the null-ptr-deref.
> 
> If cancellation observes the old non-NULL priv pointer after completion
> has freed it, or if completion frees priv after cancellation loads it but
> before cancellation reads priv->epdata, the same dereference can surface
> as a slab-use-after-free.

Great!  You clearly put a lot of work into finding this problem.  How do 
you suggest we fix it?

Alan Stern
