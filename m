Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C99175A7F
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784168158; cv=none; b=flTnatmD7eyeJwyobSs+kE6wXJUvz9qYju4RDEVS8g35VnBuYhMj6RNBnFSRpSi4YdeoBuUMm7R/N0s8HWL5povgP1+vOtuTQwYzcPYS1dyDkPEfBEx2kjDZ19pR09Tx6EGv6TAeUajb5CWfi1qu6kkVduBglQ1Cjdvb57Kp/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784168158; c=relaxed/simple;
	bh=8cAgOyAoCbdAOvYucNPovYBTeHsc8PwaDUEvd6+EfPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNKbgns8Ygi2RlPqIZ1F8jeMSOzbFW+jy/Tv35c2/Bfv4KYtxTdzBkRgolEebDiBFroZTQduPGkXcvlUatx2ZrAydq6lh1OpDSjh/2XjdVhteacQz6gnF7Fqq4S8xWzbrEU6i15Op/46ROk7NI/MJESA0lSF6n4mFXarVtkebcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dgFUgZh9; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dgFUgZh9"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e5d6f35c1so487616085a.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 19:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784168156; x=1784772956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n10nseNsjGqRpmRb+tDsg8yqby8NqtmaqmxUEfhBcuQ=;
        b=dgFUgZh9SIDn3XdME+sAD4w7DruJ5lMS/5tNlVPMfptfgjNDRLSfmBMPojGEUfSPqy
         fqxbGt+cSHcmLJCNQJHyUxo451xw5HX5kDTW/Le8AvBCJZ/IINCcOkTiqe4XyMHMtG6N
         MQNmmnhOGUeN0WapB/5sEEWRizlPQvf/DTRSxl2CTRfQT1w4q1dPpjXQDUZ1+0lpiAhk
         U/21dUqadELF/zM8LQGQK+vcDR0b0XlQ5z4YuWFFSDvrEtfCnj5fQc1oUfoio8uGlae/
         uY2ocs8SxosFQVcPi1UweV8o5LdbS2JPGdOM9diwg71ZmqJ10Ok3/+Xm8ZMFm15uZ715
         y+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784168156; x=1784772956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n10nseNsjGqRpmRb+tDsg8yqby8NqtmaqmxUEfhBcuQ=;
        b=GooY53G/2QrCRZFyvNg+/9+4IPzY7Acs4MX1Qyoo60pQYnn0fXMd00M2retzqq+PT/
         CQ5vcJTBUtG4w2SINif+ifPaGSgQGg7s4MiNVkiTm1QEsc6tBtFM2fdGkcS81G/NRDts
         8Ezs9O58t3U3JzG3hyMvY+yaLAhMmeuZOMBaUEOK6YcVLdKItO1rYzsOYulTQlmB7/lP
         7MvDcVPAC+ps3/Xo1wxFeWUgVniWmtPoS6zDiaTRscmW+sYGSGv9nMr+Mshloq07NsFV
         fmDJJsPo3oMczzAoZUhS9XokYEe20VP3PwOuN8y/3AfF/LkhfkKxnGfDV85GkO3mvotK
         GKOA==
X-Forwarded-Encrypted: i=1; AHgh+RpV+5xA2NBiZA2lc6pdweQM4BQSs8tylWO/+JcfOgyfeGQukwgsVBXePynVhoMod9yn7rzI5mrvsjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXduYvXJNojsW9RPRcBjncAUQ0dFa8EEAlFeLbSYl6aFG5Wbq
	6D4kV2O13V4RJ0OODSEQLcNFIkxVfE1s4KX6vNEHzfgKYGaXWj4NOh18eP4VVzhyog==
X-Gm-Gg: AfdE7cnmjqvNY61AN/F41ZlekLseQ9Iq6gtibC688wE9BPMAao6/LnBhN3BAJXYLmdO
	VZd+58mVrX5jhCqiDvo4N6ZRY0NfWdxBbQHBqv3/jMOhEDoocsMScgjMgdFx2aBxpsSfv6xwlhD
	AnOiWp3t06e0vZmO9wFMF6rQq19+E8w0a0GyACdQxx/BQXJuayfO8di0aehOZBtx2fb80P76TTP
	2F/J7Hx4cKPkzasjKbQW2nOE55N8umCQMP6Y45wf2L3Jr2LpvX2iBUgdWmUiRQ+gJ4YJnuPS14p
	Ns+Six4GHt9Fb1U2mu+RziQZhapNh4FOEH4e6g/JaDBLLtldnh+tGRBovkb7TSt0fE7LHY+p6xZ
	tx1593jcZJO0HNTaN0W84knOAoYvhf/ThpXl1qtesu3i+nbOAj7rVZc3+Pj9K2JkuDu13z7+oyt
	hwJtBzjtLy9RLOHA==
X-Received: by 2002:a05:620a:838c:b0:92e:f379:3119 with SMTP id af79cd13be357-930962c5fb5mr590775485a.30.1784168155512;
        Wed, 15 Jul 2026 19:15:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b88a38sm1815937185a.12.2026.07.15.19.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:15:54 -0700 (PDT)
Date: Wed, 15 Jul 2026 22:15:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Jiangong.Han" <jiangong.han@windriver.com>
Cc: gregkh@linuxfoundation.org, surban@surban.net, bigeasy@linutronix.de,
	eeodqql09@gmail.com, kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix IRQs-disabled violation in
 dummy_timer()
Message-ID: <17c672c6-bac3-456a-895f-d5406624a3fd@rowland.harvard.edu>
References: <20260716020713.1698421-1-jiangong.han@windriver.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716020713.1698421-1-jiangong.han@windriver.com>

On Thu, Jul 16, 2026 at 10:07:13AM +0800, Jiangong.Han wrote:
> dummy_timer() acquires dum->lock using spin_lock_irqsave(), which disables
> local IRQs. Before invoking URB/request completion callbacks it drops the
> lock with plain spin_unlock(), which releases the spinlock but leaves IRQs
> disabled. The completion handlers (and any code they call) then execute
> with IRQs disabled.
> 
> This is illegal for any completion handler that uses spin_unlock_bh() or
> any other operation that requires IRQs to be enabled.  In this case the
> call chain is:
> 
>   dummy_timer      [spin_lock_irqsave]
>     spin_unlock           <- IRQs still disabled
>     usb_hcd_giveback_urb
>       carl9170_usb_rx_irq_complete
>         carl9170_tx_process_status
>           carl9170_get_queued_skb
>             spin_unlock_bh
>               __local_bh_enable_ip
>                 lockdep_assert_irqs_enabled  <- WARN
> 
> Fix this by replacing spin_unlock() with spin_unlock_irqrestore()
> before usb_hcd_giveback_urb(), so that IRQs are properly re-enabled
> before invoking callbacks and re-disabled after they return.
> 
> Function usb_gadget_giveback_request() calls fifo_complete() which
> does nothing, so just focus on this issue.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+381102a7292a374fe8a7@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=381102a7292a374fe8a7
> Signed-off-by: Jiangong.Han <jiangong.han@windriver.com>
> ---

This is not the right way to solve the problem observed in carl9170.  It 
is documented that usb_hcd_giveback_urb() runs in atomic context, and 
drivers' completion handlers should not expect to be called with 
interrupts enabled.  The problem lies in carl9170_get_queued_skb(); 
that's where it needs to be fixed.

Alan Stern
