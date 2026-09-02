Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFBC49F139
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359600; cv=none; b=GQxryO3lHYkqhTd+LAXqLVpxxRGdKik9p886MRtdXiZh3W6gZiXcyrB7YHqN0znJ86TXhSljW8Zly2WblmtHJGOCNjGeb3SktWvkhoLgUUU0QW1KUWIB6UkIORQH7/ZwoeQ5mCpolR8ajG+P5MHDBeYDUM4hFI70N7IOacvwajQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359600; c=relaxed/simple;
	bh=2LLxhvktzmBYYWQswgIrcAZWz8NWgXBN8qUJejUNK1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPMZnw5bn3td3ovtR4ifMxYwYzWjV9mig3gwZ+JZTQ9LQx6ACnpCNU5jSLusYvjbKvuNyDDx02cXrFt4n0WVxo4gRIr83X6zNarl4bti7Wx36+LfKNvVR15pnlUUrCM2+wqFNJpq8ev1gdDD1MHrzY4YW5cAj0n+YPTN4rqH3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EeU4b2lH; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EeU4b2lH"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53016020b2fso16318201cf.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788359598; x=1788964398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cNINXlRO667kQL9+ZuWO8vECZQV3gK9JhtSG+5bWLiI=;
        b=EeU4b2lHPCHlbjHvtrJovOxAAYK5rgx1CVXr6CyrCErxoKOq6xvvRB1QDoTL8IpMjk
         2wSof7Gg6MwzuYCHnSUUhnlFPSZTVV9f8TsK+ziSjtWOnUR3Bkaz13PJDl5UhELp/xNz
         VZ8vuawvPJDm5Vtnv606zbyi6UdT7Igi8ISK9CzRSlFa8dbKP7oblvsL1qSS2+UghLqI
         Z0Wzb4EyzOQfkqVi/ZdE4bU7n1DePzSTk4o6snypzGr8ri46tarudUAYuFSkwiBSfnU5
         c5ZzkdtSR/Qa7vC/KzkShDMgmTTiIn4lfRGhYBDuXppsgCCthmppHd6gbjn5I2rIeAFc
         VoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359598; x=1788964398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNINXlRO667kQL9+ZuWO8vECZQV3gK9JhtSG+5bWLiI=;
        b=jy6kRtkeJ7wsbmEuspagnR+Hj1AiwHxQ1z04rtUR5py56HKw96PDzQnbc0RgndMq2T
         04BllM+iXswrHdkhRIYSvpCe3hrrNVwZ/a4fXSVd0rP+d6cHrke4rw+u4iITrhDiqHP6
         SHg34qc25nfA5ICul2YTouB5KLXQSaBts0zwqUSEw1NBpZZ2ikPFm8kJWOtHaCbmanEi
         4XTL1sjteDRSJATjZrVMOS/vjjYRDEylyyxApN4ZOzVCBXaLpBfSZbgwkbCJ8V7Cc/g9
         AlygetQbtm4Bl81jo5Ex8DIkqy1BZKcplZQa8LHjl9PqMnWV0geQXaZ91XMXg4cFqihd
         QMjQ==
X-Forwarded-Encrypted: i=1; AHgh+Roa2Hh1FPe4zldPPw6GaW2WlPNy0uIcte6yC0jHDwrThWTyd4qC0qeNdGs2sieE7eGwVDvwveFsZr4=@vger.kernel.org
X-Gm-Message-State: AFuF++mWjpP5Zx5F6zEphrpxcSlQbf0hC75xjAPB5dcDg2zADa9dOYek
	XZU6ZFK0p+5+BBopSMuj27petw/lgLoMS+fzLmrrDI0dNlr0fXK2RH1LL3/sjmU+0g==
X-Gm-Gg: AR+sD11xtCBH1gjsqI3PSSt9mSrb2ZzumZJ+ACo+GuouC85ITsvEmaLfDmBFD96h6cd
	i1rTDiq/EnXfvoHtGRcBp28atihm228OHtDa11IvroVzvxC4WUq1O3g1Ug+RrxGRUXtg92Gg8Gm
	JrdPQc/fxjRZDjJG94p0Q/gNUtWnjBNDJTg/B/IhtqPSQ8ezOouxethplaF4NG63AwNRiD/scWI
	Kneuff7tTMIpdP+uFRB+XzcspOfTyfgoRlVD24qUnif+3/OuzFnDQLWBk21S6Re9509dzFwdMvm
	FSCKlZo5d9+5ZW8lIgkMkUngV4tmwvYrtv+AWXECkQcDGvp1IdILLvlYrnGByxFnqZ+izNut2xu
	+YmdHZzaPC3FMsHoOQRTM1LrodBf4nySKGpq1Xtshe4iiNII9E1j80xktrtJ8fn6PRKShDMpdTg
	oCu4OIddaoNVhr482PWFwHVITeFXGJ1ra+jh0Lz7awAew/R9Qmqx+szgfgWvqE/xSBsFWQSqFUw
	vbGvwg=
X-Received: by 2002:a05:622a:388:b0:51b:60f1:689a with SMTP id d75a77b69052e-53036b90446mr59544841cf.7.1788359596785;
        Wed, 02 Sep 2026 07:33:16 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff089bsm20699101cf.4.2026.09.02.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:33:16 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:33:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Julian Oes <julian@oes.ch>, oneukum@suse.com,
	gregkh@linuxfoundation.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in
 endpoint
Message-ID: <bcc0f43a-3285-4ede-8bf5-fb9155d44e45@rowland.harvard.edu>
References: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
 <20260901231355.114733-1-julian@oes.ch>
 <20260902064204.1a47cd73.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902064204.1a47cd73.michal.pecio@gmail.com>

On Wed, Sep 02, 2026 at 06:42:04AM +0200, Michal Pecio wrote:
> What you are probably seeing is USB 2.0 hub(s) returning STALL
> handshake when a transaction attempt with downstream low/full-speed
> device fails three times. See USB 2.0 section 11.17.1 page 364.
> 
> If that's the case, the device endpoint isn't actually halted and you
> would see the traffic resume if you simply ignored the error and kept
> resubmitting until communication is restored.
> 
> That being said, calling usb_clear_halt() is indeed the only recovery
> supported by USB specs, both for -EPIPE and -EPROTO or similar. Linux
> has traditionally ignored this and things are quite broken sometimes,
> particularly with xhci-hcd, even if you call usb_clear_halt().
> 
> I suppose you can try this and see how it works, and if you run into
> xhci-hcd bugs we could try to fix them too. The -EPIPE case is easier
> because drivers don't rely on out of spec behavior of the USB stack.
> 
> Related discussion: (gonna need *a lot* of popcorn for that one)
> https://lore.kernel.org/linux-usb/261996a8-7ad4-4df2-a469-f6602da71255@suse.com/
> 
> Alan Stern tried to come up with some solution in USB core, but not sure
> how far that got.

For what it's worth, I did get started on that project and made some 
good progress.  But it started becoming rather complicated, particularly 
when taking into account that the core would need to stop trying to send 
Clear-Halt requests when it's about to do a Set-Interface or 
Set-Configuration, or handle a disconnection.  Then I got distracted 
with other things and never finished that part of the patch.

Maybe I can find time to go back and work on it some more.  It's likely 
to take a while...

Alan Stern
