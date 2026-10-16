Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD124BD373
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161951; cv=none; b=CFn2GPRVS7aYMxUzeqey51LP0M+h08RgjCw1dzzMBrdOC3Bzb2a00Ey2Fue8mAh6FBUGfpYg0mBtwfGBbOsbaGOhQnFODV4dLTiar7Q01S5BViR0NKw4yMKQ4ZdBvznbSUQhWpRvrbxovMgVjLA+YQbZLwBrgz3aEL3WQ4aTX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161951; c=relaxed/simple;
	bh=I3h8JmncAySVdnyASRgGthbld/UpPY3tAAz7Prz5Kyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dlipqr2rj5v5+YD1JKBWRCh3+vOgovfkMfI1ZEPtH8I/C3RFyHTs70tP9lZB+8Zhs/PHCkEUw31aWWk1eL/zeVmBNMc9P40YFOc3WwUTBBG+QfEFXlK/3zn+uHA+L08TFGPvGmQWMB8WHQFrPKQe+7HU931KlcmzRfpiP9z9unw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LYknFG7p; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LYknFG7p"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f20b304c0so1840585a.3
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792161948; x=1792766748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DFZB6RGZLQJ1LpcNxnkl77BEnFcrCaCy3BCJGhy3ASE=;
        b=LYknFG7ptZ8B5OMiGlwkJb4rtQQUwKofGiBLi8B81jkSDZ7UOMKDawkzEQZAXdX74J
         xarxzzV4f81lSPQu6ZG//Kp8BERPhUtbQMKATOVoxFdD6+5355zh6vpMW+Ct0vehnPK+
         azIpGVrkvB3jX+l5X1Cvsuz/trNNwHij2JPwD2/cOM5Bap7g6LOLZs7+c8zsEofL1Juf
         95rucI2dYaVeDQY3yOiaaD7coDyBtgrb8LuSuOftlMLQ2c7c6F0VlEFqupQY3Ola24MK
         kwQPqiEb+mycipjngNTX8x55Zib9xwTleyfkK+8PUZFAlqMGg/Yva9JB0PIr1Q1Ff+//
         c/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161948; x=1792766748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFZB6RGZLQJ1LpcNxnkl77BEnFcrCaCy3BCJGhy3ASE=;
        b=GL6trzCMn7dtj93i7BRpKAR66WbPs2/ZMaTOOt0K+9Jzk+iD6ODtaXugnjxxniSekz
         Cl60KHh1LPzg1JC+n/N5PEWUyu3Vyspf5wiS3XQvJWlmLo+cPQ6UK0+tescLMQuJEucu
         mLvnvUfTqNnc+5yy7XJw72kVERQd/abpiSw3FPC/RxjpBUITf19/zbZw74zmt62VfFW3
         x1GFXpZ8hS2hJ1YaqnDfas3d6UBS4y7R7T+Ra2NRbdPMHI+6f0bcw9KclF7wdDWhWBdK
         rN/Ac1QPjZiVUtykt107CEgGtMT+bpkfw57z5BrZ5ZYb1zxHDJtJJ6ThKAhXPsn/1LPI
         Cbnw==
X-Forwarded-Encrypted: i=1; AKwUvByxXdNoqRtPOXbhr6fd60mWFoZ/CXE6CtBf62ZcqhWymIqs3fTJAE0uBlRuz7piaSdrJm38/j49pYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDMrgMTJ/6oFmL42eUAMFPe7WuG8hQc2dPiFwsdi+BCjR47NBK
	i5ronR6xw7iK/78kArWpbNrbtA9gYhU2eEaXsmt2Aee+plzO916hPNhYIZtnClAiBQ==
X-Gm-Gg: AYBFou3cyieV+OQSOM/YbfWV5QE+lhuVkRs6XM3U6w1dWhn7e10Qj0uOhxAMlcFCP71
	Q2rraO+OXmOgW3M1U7Ntkfj1B/VsQo+f2RjGxvwglTruBkDUSqC6Oj4ie0aF+m47e4+vh/8eGFt
	PLSn9b//feBCLTrKWaLzHR8cl9tSRaHnwLfA9itcOUlJloyagALCFbchfkpvs4ZpH5X1hST/wGC
	0HdeWz4KQfLhB2vwjsAk7JhwPPsclTauDRdyGiLDo8jFNSJ5j8pXf6/AdklzAb5sJCjjDNHd347
	wdLfVzHs4vkfFWlEzbvAhlkACqjkJ24pFnQn4H/s/EEANTeIpzhcwSoFUA4ByJC4snLklHOh7US
	EDpc+jSytBTEaYsAwzESB0oKMZdk7Y5ZA0cn5bVjJ6NuzRtn5/yo6i+6WMk1JDsPkcn7No3q+F3
	v4aE4mtujg2p5kQOk3f9Ofk99/gsjm9kO8ndPN+IG3mSHC6SREhbGSEWnyCyVgelTTgjUDO/Q=
X-Received: by 2002:a05:620a:3195:b0:93e:5cf8:e5a4 with SMTP id af79cd13be357-93f29d8cd73mr5039985a.58.1792161947789;
        Fri, 16 Oct 2026 07:45:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a17f226sm225789985a.17.2026.10.16.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:45:47 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:45:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [usb-storage] [PATCH] usb: storage: bound timeout=0 URB waits to
 30s
Message-ID: <74237362-9f51-4d75-baac-9e8ebfb6c301@rowland.harvard.edu>
References: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
 <c1a82ee2-c48a-44ca-9da7-d3bad26dc240@rowland.harvard.edu>
 <179213233444.78616.16846009709382132836@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179213233444.78616.16846009709382132836@kylinos.cn>

On Fri, Oct 16, 2026 at 02:32:14PM +0800, Hongyu Xie wrote:
> On Wed, 14 Oct 2026, Alan Stern wrote:
> > > A device that stops responding while such a transfer is pending hangs the
> > > control thread permanently,
> >
> > Why do you say it hangs _permanently_?  I've seen plenty of examples
> > where the hang ended when the transfer was aborted.
> 
> You are right for the healthy-host-controller case, and our own tests
> agree with you: when the HC is healthy, the abort path does end the
> hang (details under Q3). "Permanently" holds only when the hang closes
> into the cycle below -- and then it holds until power loss. In the
> September incidents (5.4-based arm64), one machine sat wedged from
> 23:38 until it was power-cycled three and a half days later; hung_task
> warned every 120 s throughout and nothing ever unwedged it.
> 
> The cycle, in the September samples' stack shape:
> 
>     mdadm (systemd shutdown hook runs `mdadm --wait-clean --scan`,
>     which opens every block device): D state in disk_block_events ->
>     cancel_delayed_work_sync, holding ev->block_mutex    [hung_task x10]
>       events workfn: TEST_UNIT_READY never finishes
>       TUR's 30s SCSI deadline fires -> EH -> command_abort():
>       unbounded wait_for_completion(&us->notify)
>       control thread: msg_common(timeout=0) ->
>       wait_for_completion_interruptible_timeout(MAX_SCHEDULE_TIMEOUT)
>       [TASK_KILLABLE -- invisible to hung_task, hence only mdadm shows]
> 
> Note the last line: hung_task only reports the UNINTERRUPTIBLE part of
> the cycle, which is why the logs look like "mdadm hung" when the
> usb-storage control thread is equally stuck. Unplugging the stick does
> not deadlock the box (no block device open, no disk_block_events); the
> mdadm hook is what turns a usb-storage wedge into a system deadlock.

Okay, but you're missing the point.  If the host controller isn't 
working, only the host controller driver can repair the damage.  You 
can't fix the resulting problems by changing usb-storage.  In 
particular, adding timeouts won't help.  All that will happen is the 
timeout will expire, the timer handler will try to unlink the URB, and 
you'll be stuck waiting for the URB to complete, just as before.

If you're concerned about the fact that faulty hardware can hang the 
entire system, all I can say is that this problem is not unique to USB.  
Consider what effect a faulty hard disk drive or faulty CPU or faulty 
power supply could have.

> > >       -> usb_stor_stop_transport()  /* URB unlink issued, but the URB of
> > >                                       a device wedged mid-transition
> > >                                       never completes */
> >
> > Why do you say the URB never completes?  Unlinking an URB should always
> > cause it to complete, whether the device is responding or not.
> 
> I will drop that wording. What I can stand behind is the endpoint
> fact, not the mechanism: in those incidents the device never
> disconnected -- the firmware was wedged mid-modeswitch, still attached,
> bulk endpoint silent, and there are zero USB disconnects in the logs
> across the whole window. With no disconnect,
> usb_disable_device() -> usb_hcd_flush_endpoint(), the path that
> forcibly completes pending URBs, never runs. command_abort() did run
> and did issue usb_unlink_urb() via usb_stor_stop_transport(). The
> control thread still never returned from the msg_common() wait until
> power-off days later. Why the host controller did not hand the
> unlinked URB back in that exact state, I cannot explain -- we never
> reproduced that state live to dissect it. On healthy host controllers,
> unlink and kill do complete, including against a dead device; our own
> A/B tests show exactly that (below).
> 
> > Then the appropriate fix is to add a suitable timeout at the appropriate
> > point in this cycle.  Not to force every command to be limited to a
> > pre-defined 30-second timeout.
> 
> Agreed on both halves. On the first: in this cycle, that point is
> msg_common().

The rest of your message deserves TL;DR.

Look, I agree with your basic approach for transfers that otherwise 
would not have a timeout.  You already posted some patches along those 
lines for ene_ub6250; you can do the same for the other subdrivers.

Alan Stern
