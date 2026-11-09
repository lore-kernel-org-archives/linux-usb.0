Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190256;
	b=iwXHw01ugM/cqO3d6mIVoVDuKabm0Sbxm6YBKsf2s1bNnbzGMTNY0sxKHFB2WWT2LO3X
	 T/NhlZU0BCnM8LAvmUS/8h1P0vUuDcK8Jjc0qwCObz2PYEHGbnZrtvik8ayXmuqXwE7Vy
	 gX18eQLPbHCjkuo9UEugrmzUDjfp9IU/dO1Ntj+FD7exZdBoW6DwTZgow1y09Ne9v53kI
	 MsiwKpZjEKGcH/YwSb6+t3CyIlpXKxO29pURFs/tDjrCLRC3WC+5uNYVGK0QB5yn2A7MS
	 ouw010S4VgeNbjwPehAm09OpgPiAknhCwr5xH15XPtCzOeRXEyWRk7xw9nA1C4f+ihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fr4oHlRGypzWA8ygCEHVFzZC4J10YvJK1tg2b4hPWXQ=;
	b=JfMnZUpCtXqhy4GjBbM3JuNaytjKUbJuU+jYeW+FlE5TYDOgRTkdI8q0sZZuE41sSjJD
	 UnJ76ift+CeDWg9OTKL0ne9eGVSQBxXde2YUTZthcuaLG7KkBDo7HqFVhWW78wmCBbzjU
	 nNCxViOBEQ4pSap6QUPlFrgkFeCGMs6hNlIjXqo7mTeOtH3/ui/FoDse99M1RwIRqjh8e
	 IpP7ftW1+EI/toD+60YouxmRcnAIUB6zhabNN3cYLv1g5O7V1sZpRR7ty4y6C2C8Z62gw
	 7LxRfHhc7IEjSJkgyQAeCQ9Z68r2Wr7Im0CdOdYo9k9T/pAxhAiBAzUR5ajkfzu9A0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=qFM5h12i;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66321606A320
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 02:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66321606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=qFM5h12i
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53644ab1f7bso3222711cf.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 18:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794190255; x=1794795055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fr4oHlRGypzWA8ygCEHVFzZC4J10YvJK1tg2b4hPWXQ=;
        b=qFM5h12iA2QiRGNmQcKbd9pY9WjI6kV6vewDrd45WU5jikIbsXswyd0g0PxHbrvgGl
         XNn6Jslh+6efi4qKP4YrsRxmqoOamtRr9rAdgcXiaoy7yViUVlb0rAAN6iagLwNKFji+
         j0ivDj2Kt4/OGoYv4vwd9NLsRwCZo76dDSfWSdzTCCmmXDfFj90W7jBrDQzTIX+FXFDq
         bbIXn/1KsqrvqkJ/7p6ecnoOPAFaaVncx/Rbuu+SlZe0/DT+lry2EmvtgojmUgB+Ympl
         eifFP0UNg2bfgciOI1scf2hVYKai5PkhDXHnOD2ttXIDPQ90RCqvrHeB9gzDnLODPoVw
         rwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190255; x=1794795055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr4oHlRGypzWA8ygCEHVFzZC4J10YvJK1tg2b4hPWXQ=;
        b=VnzgUGc8ROnshmzpHWVYTJCRCMNprEgN/DPUZuwMMk0qKteP2W5TRHHs5FjFfZiDkQ
         kJ2TFcojaZZN8E2u7t7QiJBDvb8ICvkzkuEFek8Djl49QBs7JaoClk97jVibxvEr8f9p
         k7IFkqkCTK8KUv3KjrzHAqhuEnKXdwaDKZv0fGNANVCG+Ooziulk1pbENsgySP/zvyv1
         Ubsxc/+FDqpoEeYEL7uI8a21cMfX9/w9m/YCJdic6xvXN4SCrAX1BlXmRkUitbiXzXa4
         T3QuHG6hm5EkADeUnScv0K80Yxfpde+MwiGrnObVzrZz321On9cddtth+oaTNmCFFPtZ
         vBZA==
X-Forwarded-Encrypted: i=1; AL+hErFNCxmy60aZOAlVOdD7ZMCSQKuLDI5AEF1Mx49p/90nWSRcvZDu12gF/y3VVPg53uHHad+BFr0TzeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hWw+LxKKyhCOUMy9NDyKzeAAqnJd2406cifgU8hKF9LhE6QFE
	0U6iNPMJso1/z4ujRERimFLieJ/F9epINhTkufgljW3Rtzb+l7RECLyUccpJ81yQoz0cU+2BlBv
	W7ra8TQ==
X-Gm-Gg: AYBFou019qlbWdCpn5T3NCJ/exRE3OT98oCJJnCW4bHJ37GubJZHxvi2c8MR5mRgNwx
	O/1eWhfo1nAd+wq7fGcrV1EMnCDZyyVeKnlkjkdiQu3L2ZFxZ92thg2BBSOVBKNSz8d1d0A6e53
	bnqe41AhOJ5WeA9KGIrLpyG7hlCGkMBve1uYfR6rDpIhcZc0PcxHYWv0PLBbmkOjqKSJOvFpu8y
	nxNwbd4vo6/9D04HyI2laNNEDdzvUmllU46sSz/kO6C23yXmXYpZd2X7DbYNcju4D3CFVqnu/Qp
	jXKyn1uFwU43KGDdLdfc86TkCBuE+87xXgO9x6RfOGpU+luxOIufj5L79QqX8JizOoUiHn7jESR
	4JmgZELW4DBl8/m+X2g6ygpy8+xSGnEh+J5uYzDHWwP6wlFy6IbCax7xNW2iTaMSGhcsF4R4Tzy
	VYXhO29y72xVhKfmnea7jITZgZXDd4YbRSEMSTxNosmKyT3pjrX/IWRJMvlHDZePaG+7JID2qbS
	57sNomQw5LI1DOFXtR6zJkvxs5ocZ5kZv2meFWebcclblay9SJWcfsAkYUA4CCgE2usxk8TszpX
	rkwCQjAhkUbvcsOn0DzlU3zqFNJB
X-Received: by 2002:a05:622a:587:b0:54f:856e:6793 with SMTP id d75a77b69052e-552a578ba94mr43781591cf.70.1794190255024;
        Sun, 08 Nov 2026 18:10:55 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55264b242b7sm29792751cf.28.2026.11.08.18.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:10:53 -0800 (PST)
Date: Sun, 8 Nov 2026 21:10:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Shuai Liu <847807867@qq.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com
Subject: Re: [usb-storage] [PATCH v2] usb: storage: don't hold dev_mutex
 across the max_lun control transfer
Message-ID: <2957b6ab-f1ea-4d1a-9124-7ebeba7ed617@rowland.harvard.edu>
References: <tencent_5A9A9E45415EADE916B7558C66A2C4DD4F05@qq.com>
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
In-Reply-To: <tencent_5A9A9E45415EADE916B7558C66A2C4DD4F05@qq.com>

On Mon, Nov 09, 2026 at 07:53:07AM +0800, 'Shuai Liu' via USB Mass Storage on Linux wrote:
> usb_stor_scan_dwork() acquires us->dev_mutex and then calls
> usb_stor_Bulk_max_lun(), which issues a synchronous GET_MAX_LUN control
> transfer (10s timeout).  The reset and suspend callbacks
> (usb_stor_pre_reset / usb_stor_suspend) also acquire us->dev_mutex, but
> they run while the USB core already holds the device lock
> (udev->dev.mutex) during usb_reset_device() or disconnect.  This
> creates an AB-BA deadlock:
> 
>   scan work           reset/disconnect
>   ---------           ----------------
>   mutex_lock(dev_mutex)
>                       device_lock(udev)      [USB core]
>   control transfer  -- blocks waiting for
>                         the device lock

You lost me.  Exactly where does usb_stor_scan_dwork() or 
usb_stor_Bulk_max_lun() try to lock udev?  Taking that lock while 
holding us->dev_mutex certainly would be a violation of the locking 
order used by the rest of the driver.

>                       mutex_lock(dev_mutex)  [pre_reset]
>                         -- blocks forever
> 
> syzbot reports this as a task hung in usb_stor_scan_dwork(), with
> cancel_delayed_work_sync() in quiesce_and_remove_host() unable to make
> progress.

Are you certain this diagnosis is correct?  I can imagine the task being 
hung inside the mutex_lock(&us->dev_mutex) call, but that's not what you 
are claiming.

Alan Stern
