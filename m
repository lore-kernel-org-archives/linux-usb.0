Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32981EB1AA
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256024; cv=none; b=d++7Z8vXn/uJMiWMOK7YdDJTFy99M/zrf3UwLZEtLDo5P/l8TCAPCtqxihzQeSGm9TWRpTHm2CzxIcR1Qs7FsYPI1r0gc0wFLYPgHX+3N2UDKTCs2/J3fVQCfl5sh3mxbJAwGkaKdttjEG95XmEX8ha4q94MbkSgdjRXH0h7MMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256024; c=relaxed/simple;
	bh=ofwzLCFTo6z5gtU/F++doHIN8qopBeTLDQyMFJ2pd0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4rVW2EeLO9XTo17raXPNldxzPaYtSqy5S3CGAKEwqUD40HZva8DalQEspRIqX3RHKHP237uB5JHW8bEu3pyxsIszMd84nIgANAh/UuRWgTdo7+cwWMlqIgjhN+KUezSu8kO80HtFEaT5R/gECyMgF64omaTv46pG0pltXU89UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sgGVwEGL; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sgGVwEGL"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e7c6ec9dbso330419985a.0
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 19:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784256022; x=1784860822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrsxJQRD9aAAJEPgtqAzkMkOF4Qca3nI0hDzKIBFoFE=;
        b=sgGVwEGLMVxRC7KAct/z/opuKA2/B0aHMUVdZZvBmcOG6moL3ljdQ3Ycyri8h3GFI0
         BbQ90lKVcUfBi41rdMZ2onoiSuOj73/onu2chiENoUvfpay0RrilPfxhZaw9p4SKWMzM
         I//Yt6LDYKCD6pSCirHgr9NpEu2NT62EIjeTHo9QVV8HU6hP5G4T7S3XxK6fTP6DRh0U
         XqQ0BJNivdvPjkRNd+aX6l3N29EAbZN5w9C+g6h6L7j6wRyuhDx3Dt4IQrk9BAPxC2Vo
         cTbyEzsCmZ7SmY9C5PmxgeUvoi05NI5iSF0diMowytiSMYoN2PdFerZ1oGH5VB4M+wgt
         Shkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256022; x=1784860822;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrsxJQRD9aAAJEPgtqAzkMkOF4Qca3nI0hDzKIBFoFE=;
        b=PYIN964+bPtC/MLVPGVQaF+i7SPUfEYvUWXhg2HISOItzVNpPlukmlj2hr4APWpSK1
         81yo8B8gkL88kU+Jwlt3RIWsIdw5sMEbJ+WhKjddvU7PVxATCK6/m+ML08jroFMJQivA
         lLgEtHIPBp+XfFCetC8AuXWRVyVb21kUDRjewkOkzo+QBn508a5hXcHix3PVjS/GKet7
         pInnRQeJK/3ZTa0EcRFbDj2j5Vi0d6/DKZgWaACEdFrRxB50SczDB9m0ZF7G0Gk54uVH
         L3oK50tpqUFYLZ0DZkj7XeOr7IjPheOFHlZzL7JIC1KyYo5o02UVp71B3KCR7xaoO0Er
         GcqA==
X-Forwarded-Encrypted: i=1; AHgh+RoZFHDeJQBUkYed1BsZXoSNVOWj6g4bFF4q0eXI+M1bbhWYQGASY5phmioXSF5EvLcZP4A8W1LB6gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwhtSVKS1Y1u8F8Qix1PMOqsIDIbHNaOcii8Yw5AMmCgzAwpYS
	XxgQTj/FbsxKIPrfh5bAMHksJkgIebL/1h1UvARQEO59PIHiULKQB/9Jz/51Su42c/3VeXhILHT
	SVDAk1w==
X-Gm-Gg: AfdE7cnWrTMwroywPMKajiPG2BnvV1fYJzFLaYmidG9DT9yxS95uJrwIcFmXqeIitrH
	ULd6WF/i3hRCtm5/GeSmkd8JOS2vwj+8bWpamITeFbxL/4gGTN0ORA/vLA7GqHVKXNxlkwf18uL
	Wd79QQfC4m1yQS6zlXgE1Gu8phf3rqLnuPqInUwDiiSeGQo8DihGizZsf5TYS7CTABnSokBMtAF
	wdFZPJZ4KfdF/RsX0WqxvLsziMrpBIk0Xu0ZeJqXLWs+J9/ND2dNV4OVwH2eWJNPWP+0r4jLPMj
	vdYs/MsWtznnpH2V+hNPc1xTsA11YNsvZlKqHHzRsNiFeh50GcPu5PPSERv6BCKGwYMnBSWvttv
	eYG+Yx6J4SMWFqEqMxG59g7Vj2K2+e0Q5VIuwIBHuSGGNjiT+Nk3qzs4Ax6xC8zwy6T1SmC7P/w
	h6rSo=
X-Received: by 2002:a05:620a:4142:b0:92e:49b9:328f with SMTP id af79cd13be357-930b4308d59mr78547385a.72.1784256021844;
        Thu, 16 Jul 2026 19:40:21 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5493cb0sm33765585a.42.2026.07.16.19.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 19:40:21 -0700 (PDT)
Date: Thu, 16 Jul 2026 22:40:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	bigeasy@linutronix.de, eeodqql09@gmail.com, kees@kernel.org,
	surban@surban.net, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummy_hcd: prevent fifo_req reuse during
 giveback
Message-ID: <a1953c08-7050-4288-b92e-ba4f76ccff39@rowland.harvard.edu>
References: <20260714064829.172098-1-wangjinchao600@gmail.com>
 <c7de3923-1f68-46f9-986e-33899dce112c@rowland.harvard.edu>
 <15e5b802-b43a-44c5-97b6-a599f28bdee4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15e5b802-b43a-44c5-97b6-a599f28bdee4@gmail.com>

On Wed, Jul 15, 2026 at 01:34:13AM -0400, Jinchao Wang wrote:
> > Wow!  I'm impressed.  How did you figure this out?
> 
> With a hardware watchpoint: I armed one on the victim field
> (req->complete, at arg2+56 of usb_gadget_giveback_request) only while
> usb_gadget_giveback_request() was running, and it caught the writing
> memcpy with a full stack - usb_ep_queue <- raw_process_ep_io <-
> raw_ioctl - on the same request that crashed an instant later.
> 
> The watchpoint setup came from a small tool I am working on; I posted
> it as an RFC in case it is useful to others:
> 
> https://lore.kernel.org/all/20260714182243.10687-1-wangjinchao600@gmail.com/

That tool looks really nice.  I'm glad to see hardware breakpoints 
becoming easier to use, because I wrote a large part of the initial 
implementation -- see for example commit 0067f1297241 ("hw-breakpoints: 
x86 architecture implementation of Hardware Breakpoint interfaces").

Alan Stern
