Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346174;
	b=tu4kDNauNm2glPnMR777KIyZwt++473YInOauRh90orCJHhaB5wJbToTGIOuPGFLiduA
	 2QPnzTzy6yABhpOVAHbASt8W2rZGbcoBz34I1gIOmGe4JTkD2CTBe5YFZ0jVklj32hexH
	 twcHzNHfQILVZt+RG8LiygSKw+nE4Y2rqgqaPEht7l02FZ7u63DTZlMzqDdyJ8bY3ILZL
	 TQwQ13unDzoL9hdRBpmHQc4hix5yPtRgvUj/A4EzFw5Q8Z3RMgcbi+ExqYDOloe7svJNs
	 DrsJs24ZfDSm8auh1/QDaF9oe6xxDAxiwaWTggNfymqal4FzAc4Ljt7+gS6/fT/+4iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Eg5VsLzGVepVcCiWSJ+3AWApPfh5rapdrU4mGxcNLPs=;
	b=5IfubGJIn8SO1Lfe8EpRH4XiBOHh1ixMTdbOf4bQmonPpYMg0iOrBCqL8c7gJXi8mFIb
	 Vl+qSNQI/H0r5X+IrKTXmHKiZGCWYU1EjjZsiH2nzYwtHuvo/xs+Nb/GUdzZPKNJNj791
	 m7KVAEF955691OAVpbYoq4UUhCvtIwtJsleWUzPHFxX7S6orQ0pGp683WgT2Y64zYkVwT
	 FrAxpiYMSW9mnJkvHsmDxVeIvLSOotfwiMx8WZIu9Y7TtbRFc8HFXY5AajG3e/cUwOfLj
	 rYJQMcFIYeKRctaZLQFtp7l+iIe5So8ttwDQR8LFO/3k6BKW4X9FBB4L3zdjN8j2JLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ngxAJsb5;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21755606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 21:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21755606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ngxAJsb5
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-536c8f958d7so20018531cf.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 13:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794346173; x=1794950973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eg5VsLzGVepVcCiWSJ+3AWApPfh5rapdrU4mGxcNLPs=;
        b=ngxAJsb5ELadmYPUOERBykB33SXa/Efwx4bOV7nsdg0Ebx5k+PW9DL9x7a764ATk5w
         dH3i9XrOhO7xby8MwWtLE3652SbSQPRFXaQXItbPFOSd/hbJdDiZyus7HYbO4nx2mrYy
         CFI64A2ENEGoG6zkvsKyiT15SXZsJGVCWs5aPi7ykBzROuBC3DrKOS9/CmnlD4kKgvh1
         lzfHraC9l/7svjpZsqtoNS3OvVmHHRUNYi4izEa9nHpXRCXJ7/QE/9xbE99rR4qt2vxx
         iZqdmzjd4HazbyvS3qOb5ZwQr8/gHksjITWrxZEa0LA4uaKkRrmppNrcHshyVFi95ivF
         k9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346173; x=1794950973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eg5VsLzGVepVcCiWSJ+3AWApPfh5rapdrU4mGxcNLPs=;
        b=uTj4WUSf94wz6yftspdkoP6Dymy0OPiTeyBYtpOz67aRZWSOzb01Yz9eV8DKNYCOt5
         ug3Kw+u7VQ7ieD7aK/t0ijeNm9b3fKUvS7nedehrcaLOEhebrR1Put478pREsLQfUuVa
         RsTlkTJKZTUssJ9FPRb89aCXxE0jKAR77uhczBuszZ1JUIjOy3lYQOxl5gP31ji44tyk
         qhJwOJqMTKrDhVYsaFC5MlEWgja/WMG5C1I5H+CfhcqRSI5ygHpJ4ijfOLoljZnI7mVz
         dz8dtIt3C6Fz0SSrATFZK83913h9p+Hg7eBTLIhnNTpNLk9vxNxXETcu9fIJexY0Qq2r
         +EoQ==
X-Forwarded-Encrypted: i=1; AL+hErFeQAgyrTEyL6ITpfuYDxW7fEXqf40zQKsXF1nYiEnjyVZKNVM09SN7bGt5jIDLTWLJTG0/6Ks8quc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vzjeEuKLTMh6zfnlxU1AIH4pkUT6LBL4mWVZra6t0YdjBtPFV
	fiEB4QwpSoRL2p5oS8kxrQfz7ZLlsW9HMYxLSvRPRPNHSmovqFFiRc63R0DhOg0AEQ==
X-Gm-Gg: AYBFou2DxgDkL/z8IZMkSc7NJDJb1SlrPcA+5L7u1/lO7C3d/eMJM7+K4w4pC+zOZtc
	r7zJ33qPURQGfgD9167Te2jMO9zWEwfoBuJXsFJKz7hFURoPMcR4tKoEoHsNd6piWurpJqATNjf
	2+rpqTgdDJ0ZbL9lprD523J1hLxpOqI33Pxl+C67wkkeoNhjuJsd8FHWH3ypUkJYU9ojGABTdKY
	nFuLPCbkeEOXwLzRFLEOfdq49eZPLSQ3p8WQPRlbS67admcoA0zLnBK7z+gGS7yYmMvN7fc3jfZ
	CThaLAnrf+bDF7rtxqrJh5Br6mOEnXtkdKTTM8VDcGhj74JTdUVu8meazqRFpM4FtRVg2Xv+q74
	d+nbzouoAprub/tkmmEBaUT7rzgzl9Ez8TrqXsSmUeMOK+79XB4hI0cWItePqhWG79+bmnV5l2u
	Zg13OqegHgVWScuzGxsDsQg0O9P2VwDvr8GLEgrpPGpFPy8cAR1x9sOYEP+7NPUFJJW9GZgTjJf
	wJvkdVPhBCMghuRnRk9NRtGSV8C0FzWHWSlwt0QkuQ+Zw1LGbNV4p/lqVNRivxhHXLyOxydf4ip
	riCCqqBjAz8H5W7Rx6r8Sds4XWz++g==
X-Received: by 2002:ac8:5a15:0:b0:535:a5fa:ee05 with SMTP id d75a77b69052e-556c1775f23mr2040961cf.69.1794346172734;
        Tue, 10 Nov 2026 13:29:32 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bf2cf01sm33588241cf.25.2026.11.10.13.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:29:31 -0800 (PST)
Date: Tue, 10 Nov 2026 16:29:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Cheng Yongkang <teel4res@gmail.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
Message-ID: <94436653-ae58-46c9-a2cf-241231ac8eab@rowland.harvard.edu>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
 <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
 <179333358668.2111112.12827497703998022783@gmail.com>
 <3648026e-e93b-4543-87db-e56020770831@linuxfoundation.org>
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
In-Reply-To: <3648026e-e93b-4543-87db-e56020770831@linuxfoundation.org>

On Tue, Nov 10, 2026 at 11:57:34AM -0700, Shuah Khan wrote:
> On 10/29/26 22:13, Cheng Yongkang wrote:
> > Hi Shuah,
> > 
> > Without this change the URB is still completed to usbfs, with status
> > -EPROTO but with the peer-supplied actual_length intact:
> > >    vhci_recv_ret_submit()
> >      usbip_pack_pdu() -> usbip_pack_ret_submit():
> >          urb->actual_length = rpdu->actual_length;   (usbip_common.c:471)
> >      usbip_recv_xbuff():
> >          size = urb->actual_length;                  (usbip_common.c:849)
> >          if (size > urb->transfer_buffer_length)     (usbip_common.c:856)
> >                  goto error;  /* rejects the packet, returns < 0 */
> >      urb->status = -EPROTO; goto error;
> >    error:
> >      usb_hcd_giveback_urb(hcd, urb, urb->status);    (vhci_rx.c:107)
> >        -> urb->complete(urb)                         (hcd.c:1657)
> >        -> usbfs async_completed()                    (devio.c:1911)
> > 
> > usbfs copies data on reap whenever actual_length is non-zero, and does
> > not look at the URB status:
> 
> It sounds like fixing usbfs to check the URB status before copying
> sounds like the right fix.

No, that's not possible.  A transfer may terminate with an error partway 
through, after some data has been sent/received.  The URB status would 
then be a negative error code, but actual_length would still need to 
reflect the amount of data that usbfs has to copy back to userspace (for 
an IN transfer) or tell userspace was sent (for an OUT transfer).

In general, the USB core relies on HCDs to set urb->actual_length 
correctly even when there was an error.

> Changing vhci to zero out a filed in an URB that it received, itsn't
> something we want to do. Why not fix this in usbfs and that would work
> for other invalid lengths?

HCDs are _supposed_ to set the actual_length field in URBs.  It's not 
a mistake to do so.

Alan Stern
